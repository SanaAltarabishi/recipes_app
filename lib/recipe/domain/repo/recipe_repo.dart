import 'package:dartz/dartz.dart';
import 'package:recipes/core/error/failures.dart';
import 'package:recipes/recipe/domain/entity/recipes_entity.dart';

abstract class RecipeRepo {
  Future<Either<Failures, RecipesResponseEntity>> getResipes();
}
