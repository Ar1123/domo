import 'package:dartz/dartz.dart';
import 'package:domo/src/core/errors/failures.dart';
import 'package:domo/src/domain/repository/repository_domain.dart';

class UserUSerCaseDomain {
  final UserRepositoryDomain userRepositoryDomain;

  UserUSerCaseDomain({
    required this.userRepositoryDomain,
  });

  Future<Either<Failure, bool>> createUser(
          {required Map<String, dynamic> data}) =>
      userRepositoryDomain.createUser(data: data);
  Future<Either<Failure, bool>> updateUser(
          {required Map<String, dynamic> data, required String id}) =>
      userRepositoryDomain.updateUser(data: data, id: id);
  Future<Either<Failure, dynamic>> getUser({required String id}) =>
      userRepositoryDomain.getUser(id: id);
}
