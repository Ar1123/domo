import 'package:domo/src/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:domo/src/core/utils/future_response/future_response.dart';
import 'package:domo/src/data/datasource/data_source_data.dart';
import 'package:domo/src/domain/repository/repository_domain.dart';

class ServerRepositoryImpl implements ServerRepositoryDomain{
  final ServerRemoteDataSource serverRemoteDataSource;

  ServerRepositoryImpl(this.serverRemoteDataSource);
  @override
  Future<Either<Failure, List<String>>> getServer({required String category, required String city}) async{
      return response(()async{
        return await serverRemoteDataSource.getServer(category: category, city: city);
      });

  }
}