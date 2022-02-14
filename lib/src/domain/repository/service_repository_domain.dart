import 'package:dartz/dartz.dart';
import 'package:domo/src/core/errors/failures.dart';

abstract class ServiceRepositoryDomanin{

  Future<Either<Failure, bool>> createService({required Map<String, dynamic> data, required List<String> file});
  Future<Either<Failure, dynamic>> getServiceById({required String id});
  Future<Either<Failure, List<dynamic>>> getAllService();
}