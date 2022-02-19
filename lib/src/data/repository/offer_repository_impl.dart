import 'package:dartz/dartz.dart';
import 'package:domo/src/data/model/offer_model.dart';

import '../../core/errors/failures.dart';
import '../../core/utils/future_response/future_response.dart';
import '../../domain/repository/repository_domain.dart';
import '../datasource/data_source_data.dart';

class OfferRepositoryImpl implements OfferRepositoryDomain{
  
  final OfferRemoteDataSource offerRemoteDataSource;

  OfferRepositoryImpl({required this.offerRemoteDataSource});
  @override
  Future<Either<Failure, List<OfferModel>>> getOfferByIdUser({required String id}) async{

        return response(()async{
          return await offerRemoteDataSource.getOfferById(id: id);
        });
  }

  @override
  Future<Either<Failure, int>> offerAmmount({required String idService, required String id}) async{
      return response(()async{
          return await offerRemoteDataSource.offerAmmount(idService: idService, id:id);
        });
  }

  @override
  Future<Either<Failure, List<OfferModel>>> offerById({required String idService, required String id}) async{
    return response(()async{
      return await offerRemoteDataSource.offerById(idService: idService, id: id);
    });
  }
}