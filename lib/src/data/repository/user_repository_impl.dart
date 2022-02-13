import 'package:domo/src/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:domo/src/core/utils/future_response/future_response.dart';
import 'package:domo/src/data/datasource/data_source_data.dart';
import 'package:domo/src/data/model/user_model.dart';
import 'package:domo/src/domain/repository/repository_domain.dart';

class UserRepositoryImpl implements UserRepositoryDomain {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({required this.userRemoteDataSource});
  @override
  Future<Either<Failure, bool>> createUser(
      {required Map<String, dynamic> data}) async {
    return response(() async {
      return await userRemoteDataSource.createUser(data: data);
    });
  }

  @override
  Future<Either<Failure, USerModel>> getUser({required String id}) async {
    return response(() async {
      return await userRemoteDataSource.get(id: id);
    });
  }

  @override
  Future<Either<Failure, bool>> updateUser(
      {required Map<String, dynamic> data, required String id}) async {
    return response(() async {
      return await userRemoteDataSource.update(data: data, id: id);
    });
  }
}
