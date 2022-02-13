import 'package:dartz/dartz.dart';
import 'package:domo/src/core/errors/failures.dart';

abstract class UserRepositoryDomain{


  Future<Either<Failure, bool>> createUser({required Map<String, dynamic> data});
  Future<Either<Failure, bool>> updateUser({required Map<String, dynamic> data, required String id});
  Future<Either<Failure, dynamic>>  getUser({required String id});
} 