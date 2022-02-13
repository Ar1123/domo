// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:domo/src/domain/usecase/auth_use_case_domain.dart';
import 'package:domo/src/domain/usecase/shared_prefences_use_case.dart';
import 'package:domo/src/domain/usecase/user_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/constant/words.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth firebaseAuth;
  final AuthUseCaseDomnain authUseCaseDomnain;
  final UserUSerCaseDomain uSerCaseDomain;
  final SharedPrefencesUseCase sharedPrefencesUseCase;

  AuthBloc({
    required this.firebaseAuth,
    required this.authUseCaseDomnain,
    required this.uSerCaseDomain,
    required this.sharedPrefencesUseCase,
  }) : super(AuthInitial()) {
    on<OnVerifiedNumber>(_onVerifiedNumber);
    on<OnSendNumber>(_onSendNumber);
    on<OnVerifiedCode>(_onVerifiedCode);
  }

  void _onVerifiedNumber(
      OnVerifiedNumber event, Emitter<AuthState> emitter) async {
    emitter(LoadingAuthState());
    await Future.delayed(Duration(seconds: 4));
    if (event.number.trim().isEmpty) {
      emitter(ErrorInAuthState(message: kErrorNumberEmpty));
    } else if (event.number.trim().length < 10) {
      emitter(ErrorInAuthState(message: kErrorNumber));
    } else if (!event.number.startsWith("3") &&
        event.number.trim().length < 10) {
      emitter(ErrorInAuthState(message: kErrorNumber));
    } else if (event.number.trim().length == 10) {
      emitter(NextInAuthState());
    }
    emitter(CloseInAuthState());
    emitter(HidenLoadingAuthState());
  }

  void _onSendNumber(OnSendNumber event, Emitter<AuthState> emitter) async {
    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: '+57${event.number}',
      verificationCompleted: (PhoneAuthCredential credential) {
        emit(ShowCode(phoneAuthCredential: credential));
        emit(CloseInAuthState());
      },
      verificationFailed: (FirebaseAuthException firebaseException) {
        String message = "";

        if (firebaseException.code == 'too-many-requests') {
          message = kErrorIntentons;
        }
        if (firebaseException.code == 'invalid-phone-number') {
          message = kFormatoNumero;
        }
        emit(ErrorInAuthState(message: message));
        emit(CloseInAuthState());
      },
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {
        emit(ErrorInAuthState(message: kTimeOut));
        emit(CloseInAuthState());
      },
    );
  }

  void _onVerifiedCode(OnVerifiedCode event, Emitter emitter) async {
    final result = await authUseCaseDomnain.signInWithPhone(
        phoneAuthCredential: event.phoneAuthCredential);
    result.fold((l) {
      emit(ErrorInAuthState(message: 'Error al crear cuenta'));
      emit(CloseInAuthState());
    }, (r) async {
      if (r.user != null) {
        final result2 = await uSerCaseDomain.createUser(data: {
          "uid": r.user!.uid,
          "active": true,
          "accountComplete": false,
        });
        result2.fold((l) {
          emit(ErrorInAuthState(message: 'Error a crear cuenta'));
        }, (r) {
          emit(NextInAuthState());
          emit(CloseInAuthState());
        });
      }
    });
  }

  Future<bool> getSession() async {
    bool status = false;
    final session = await authUseCaseDomnain.verifySession();
    session.fold((l) {}, (r) async {
      status = r;
    });
    return status;
  }
}
