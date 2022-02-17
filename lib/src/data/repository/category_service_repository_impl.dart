import 'package:domo/src/core/errors/failures.dart';
import 'package:domo/src/core/utils/future_response/future_response.dart';
import 'package:domo/src/data/datasource/data_source_data.dart';
import 'package:domo/src/data/model/category_service_model.dart';
import 'package:dartz/dartz.dart';
import 'package:domo/src/domain/repository/repository_domain.dart';

class CategoryServiceRepositoryImpl implements CategoryServiceRepositoryDomain{
  final CategoryServiceRemoteDataSource categoryServiceRemoteDataSource;

  CategoryServiceRepositoryImpl({required this.categoryServiceRemoteDataSource});
  @override
  Future<Either<Failure, List<CategoryServiceModel>>> getCategoryservice() async{
        return response(()async{
          return await categoryServiceRemoteDataSource.getCategoryservice();
        });
  }
}