import 'package:dartz/dartz.dart';
import 'package:domo/src/core/errors/failures.dart';
import 'package:domo/src/domain/entities/offer_entities.dart';

abstract class OfferRepositoryDomain{

  Future<Either<Failure, List<OfferEntities>>> getOfferByIdUser({required String id});
  Future<Either<Failure, int>> offerAmmount({required String idService, required String id});
  Future<Either<Failure, List<OfferEntities>>> offerById({required String idService, required String id});
  Future<Either<Failure, bool>> updateOffer({required String id, required Map<String, dynamic> data});
}