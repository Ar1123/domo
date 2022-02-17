import 'package:dartz/dartz.dart';
import 'package:domo/src/core/errors/failures.dart';
import 'package:domo/src/domain/entities/category_service_entities.dart';

abstract class CategoryServiceRepositoryDomain{
  Future<Either<Failure, List<CategoryServiceEntities>>> getCategoryservice();
}


