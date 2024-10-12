import 'package:dartz/dartz.dart';
import 'package:recipes/core/error/failures.dart';
import 'package:recipes/recipe/domain/entity/recipes_entity.dart';
import 'package:recipes/recipe/domain/repo/recipe_repo.dart';

class GetResipesUseCase {
  final RecipeRepo recipeRepo;
  GetResipesUseCase({
    required this.recipeRepo,
  });

  Future<Either<Failures, RecipesResponseEntity>> call() async {
    return await recipeRepo.getResipes();
  }
}
