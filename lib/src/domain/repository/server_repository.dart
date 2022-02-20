import 'package:dartz/dartz.dart';
import 'package:domo/src/core/errors/failures.dart';

abstract class ServerRepositoryDomain{

  Future<Either<Failure, List<String>>> getServer({required String category, required String city});
}