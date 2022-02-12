part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  AuthEvent();
}

class OnVerifiedNumber extends AuthEvent {
  final String number;

  OnVerifiedNumber({
    required this.number,
  });
  @override
  List<Object?> get props => [];
}
