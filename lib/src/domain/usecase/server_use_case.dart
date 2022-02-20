import 'package:dartz/dartz.dart';
import 'package:domo/src/core/errors/failures.dart';
import 'package:domo/src/domain/repository/repository_domain.dart';

class ServerUseCase{
  
  final ServerRepositoryDomain serverRepositoryDomain;

  ServerUseCase({required this.serverRepositoryDomain});


  Future<Either<Failure, List<String>>> getserver({required String category, required String city})=> serverRepositoryDomain.getServer(category: category, city: city);
}