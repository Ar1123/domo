import 'package:dartz/dartz.dart';
import 'package:domo/src/core/errors/failures.dart';
import 'package:domo/src/domain/entities/offer_entities.dart';
import 'package:domo/src/domain/repository/repository_domain.dart';

class OfferUsecase {
  final OfferRepositoryDomain offerRepositoryDomain;

  OfferUsecase({required this.offerRepositoryDomain});

  Future<Either<Failure, List<OfferEntities>>> getOffer({required String id}) =>
      offerRepositoryDomain.getOfferByIdUser(id: id);
  Future<Either<Failure, int>> offerAmmount(
          {required String idService, required String id}) =>
      offerRepositoryDomain.offerAmmount(idService: idService, id: id);
  Future<Either<Failure, List<OfferEntities>>> offerById(
          {required String idService, required String id}) =>
      offerRepositoryDomain.offerById(idService: idService, id: id);
  Future<Either<Failure, bool>> udpateOffer(
          {required Map<String, dynamic> data, required String id}) =>
      offerRepositoryDomain.updateOffer(id: id, data: data);
  Future<Either<Failure, List<OfferEntities>>> getOfferInProgress(
          {required String id}) =>
      offerRepositoryDomain.getOfferInProgress(id: id);
}
