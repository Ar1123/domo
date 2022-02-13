// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/constant/words.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth firebaseAuth;

  AuthBloc({required this.firebaseAuth}) : super(AuthInitial()) {
    on<OnVerifiedNumber>(_onVerifiedNumber);
    on<OnSendNumber>(_onSendNumber);
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
        emit(NextInAuthState(phoneAuthCredential: credential));
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
}
