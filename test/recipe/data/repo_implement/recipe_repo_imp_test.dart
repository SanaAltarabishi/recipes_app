import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:recipes/core/error/exeptions.dart';
import 'package:recipes/core/error/failures.dart';
import 'package:recipes/core/network/network_connection.dart';
import 'package:recipes/recipe/data/data_source/remote_get_recipe_data_source.dart';
import 'package:recipes/recipe/data/model/recipe_model.dart';
import 'package:recipes/recipe/data/repo_implement/recipe_repo_imp.dart';
import 'package:recipes/recipe/domain/entity/recipes_entity.dart';

import 'recipe_repo_imp_test.mocks.dart';

@GenerateMocks([RemoteGetRecipeDataSource, NetworkConnection])
void main() {
  late RecipeRepoImp recipeRepoImp;
  late MockRemoteGetRecipeDataSource mockRemoteGetRecipeDataSource;
  late MockNetworkConnection mockNetworkConnection;

  setUp(
    () {
      mockRemoteGetRecipeDataSource = MockRemoteGetRecipeDataSource();
      mockNetworkConnection = MockNetworkConnection();
      recipeRepoImp = RecipeRepoImp(
          networkConnection: mockNetworkConnection,
          remoteGetRecipeDataSource: mockRemoteGetRecipeDataSource);
    },
  );

  group(
    'getRecipes',
    () {
      final recipesResponseModel = RecipesResponseModel(recipes: [], total: 0);
      test(
          'should return Right<RecipesResponseEntity> when the network is connected and data is retrieved successfully',
          () async {
//arrange :
        when(mockNetworkConnection.isConnected).thenAnswer((_) async => true);
        when(mockRemoteGetRecipeDataSource.getRecipes())
            .thenAnswer((_) async => recipesResponseModel);
// act :
        final result = await recipeRepoImp.getResipes();

//assert :
        expect(result,
            Right<Failures, RecipesResponseEntity>(recipesResponseModel));
        verify(mockNetworkConnection.isConnected).called(1);
        verify(mockRemoteGetRecipeDataSource.getRecipes()).called(1);
      });

      test(
          'should return Left<NetWorkFailure> when there is no netwrork connection',
          () async {
//arrange:
        when(mockNetworkConnection.isConnected).thenAnswer((_) async => false);
//act :
        final result = await recipeRepoImp.getResipes();
//assert :
        expect(result, Left<Failures, RecipesResponseEntity>(NetworkFailure()));
        verify(mockNetworkConnection.isConnected).called(1);
        verifyZeroInteractions(mockRemoteGetRecipeDataSource);
      });

      test('should return Left<ServerFailure> when a ServerExeption is thrown',
          () async {
//arrange:
        when(mockNetworkConnection.isConnected).thenAnswer((_) async => true);
        when(mockRemoteGetRecipeDataSource.getRecipes())
            .thenThrow(ServerExeption());
//act :
        final result = await recipeRepoImp.getResipes();
        //assert:
        expect(result, Left<Failures, RecipesResponseEntity>(ServerFailure()));
        verify(mockNetworkConnection.isConnected).called(1);
        verify(mockRemoteGetRecipeDataSource.getRecipes()).called(1);
      });
    },
  );
}
