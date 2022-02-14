import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../repository/repository_domain.dart';

class ServiceUseCase {
  final ServiceRepositoryDomanin serviceRepositoryDomanin;

  ServiceUseCase({required this.serviceRepositoryDomanin});

  Future<Either<Failure, bool>> createService(
          {required Map<String, dynamic> data, required List<String> file}) =>
      serviceRepositoryDomanin.createService(data: data, file: file);
  Future<Either<Failure, dynamic>> getServiceById({required String id}) =>
      serviceRepositoryDomanin.getServiceById(id: id);
  Future<Either<Failure, List<dynamic>>> getAllService() =>
      serviceRepositoryDomanin.getAllService();
}
