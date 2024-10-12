import 'package:dartz/dartz.dart';
import 'package:recipes/core/error/exeptions.dart';
import 'package:recipes/core/error/failures.dart';
import 'package:recipes/core/network/network_connection.dart';
import 'package:recipes/recipe/data/data_source/remote_get_recipe_data_source.dart';
import 'package:recipes/recipe/data/model/recipe_model.dart';
import 'package:recipes/recipe/domain/entity/recipes_entity.dart';
import 'package:recipes/recipe/domain/repo/recipe_repo.dart';

class RecipeRepoImp implements RecipeRepo {
  final RemoteGetRecipeDataSource remoteGetRecipeDataSource;
  final NetworkConnection networkConnection;
  RecipeRepoImp({
    required this.networkConnection,
    required this.remoteGetRecipeDataSource,
  });

  @override
  Future<Either<Failures, RecipesResponseEntity>> getResipes() async {
    if (await networkConnection.isConnected) {
      try {
        RecipesResponseModel recipesResponseModel =
            await remoteGetRecipeDataSource.getRecipes();
        return Right(recipesResponseModel);
      } on ServerExeption catch (e) {
        print('repo imp exeption $e');
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
