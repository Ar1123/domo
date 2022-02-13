import 'package:dartz/dartz.dart';
import 'package:domo/src/core/errors/failures.dart';
import 'package:domo/src/domain/entities/city_entities.dart';

abstract class RemoteCityRepoDomain {
  Future<Either<Failure, List<CityEntities>>> getAllCity();
}
