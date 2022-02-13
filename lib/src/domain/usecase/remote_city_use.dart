import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../entities/city_entities.dart';
import '../repository/repository_domain.dart';

class RemoteCityUseCase{

  final RemoteCityRepoDomain remoteCityRepoDomain;

  RemoteCityUseCase(this.remoteCityRepoDomain);

  Future<Either<Failure,List<CityEntities>>> getCity()=> remoteCityRepoDomain.getAllCity();
}