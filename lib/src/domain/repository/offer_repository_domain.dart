import 'package:dartz/dartz.dart';
import 'package:domo/src/core/errors/failures.dart';
import 'package:domo/src/domain/entities/offer_entities.dart';

abstract class OfferRepositoryDomain{

  Future<Either<Failure, List<OfferEntities>>> getOfferByIdUser({required String id});
  Future<Either<Failure, int>> offerAmmount({required String idService, required String id});
}