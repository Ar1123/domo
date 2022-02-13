import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/errors/failures.dart';

abstract class AuthRepositoryDomain{
  Future<Either<Failure, UserCredential>> signInWithPhone({required PhoneAuthCredential phoneAuthCredential});
  Future<Either<Failure, bool>> verifySession();
  Future<Either<Failure, void>> logOut();

}