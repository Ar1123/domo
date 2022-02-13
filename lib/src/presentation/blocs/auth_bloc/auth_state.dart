part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}
class VerifiedNumber extends AuthState{
  final bool  status;

  VerifiedNumber({required this.status});
}


class ErrorInAuthState extends AuthState{

final  String? message;

  ErrorInAuthState({this.message});
}

class NextInAuthState extends AuthState{

  final PhoneAuthCredential? phoneAuthCredential;

  NextInAuthState({this.phoneAuthCredential});
}
class CloseInAuthState extends AuthState{}
class LoadingAuthState extends AuthState{}
class HidenLoadingAuthState extends AuthState{}