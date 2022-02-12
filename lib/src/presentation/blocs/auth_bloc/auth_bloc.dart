import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/constant/words.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<OnVerifiedNumber>(_onVerifiedNumber);
  }

  void _onVerifiedNumber(OnVerifiedNumber event, Emitter<AuthState> emitter) {
    if (event.number.trim().length == 10) {
      emitter(NextInAuthState());
    } else {
      emitter(
          ErrorInAuthState(message: kErrorNumber));
    }
    emitter(CloseInAuthState());
  }
}
