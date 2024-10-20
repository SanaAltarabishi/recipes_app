import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:recipes/core/error/exeptions.dart';
import 'package:recipes/core/resources/urls.dart';
import 'package:recipes/recipe/data/data_source/remote_get_recipe_data_source.dart';
import 'package:recipes/recipe/data/model/recipe_model.dart';

import 'remote_get_recipe_data_source_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late RemoteGetRecipeDataSource recipeDataSource;

  setUp(() {
    mockDio = MockDio();
    recipeDataSource = RemoteGetRecipeDataSource(dio: mockDio);
  });

  group('getRecipes', () {
    const testUrl = AppUrls.getRecipesUrl;
    final recipesResponseData = {
      "recipes": [
        {
          "id": 1,
          "name": "Test Recipe",
          "ingredients": ["Ingredient 1", "Ingredient 2"],
          "instructions": ["Step 1", "Step 2"],
          "prepTimeMinutes": 10,
          "cookTimeMinutes": 20,
          "servings": 2,
          "difficulty": "Easy",
          "cuisine": "Italian",
          "caloriesPerServing": 200,
          "tags": ["Dinner"],
          "image": "image_url",
          "rating": 4.5,
          "reviewCount": 10,
          "mealType": ["Dinner"]
        }
      ],
      "total": 1,
      "skip": 0,
      "limit": 10
    };
    test('should return RecipesResponseModel when the status code is 200',
        () async {
//arrange:
      when(mockDio.get(any, options: anyNamed('options'))).thenAnswer(
        (_) async => Response(
          data: recipesResponseData,
          statusCode: 200,
          requestOptions: RequestOptions(path: testUrl),
        ),
      );
      //act :
      final result = await recipeDataSource.getRecipes();
      //assert:
      expect(result, isA<RecipesResponseModel>());
      expect(result.recipes.length, 1);
      expect(result.recipes[0].name, 'Test Recipe');
    });

    test('should throw ServerException when the status code is not 200',
        () async {
      // Arrange:
      when(mockDio.get(any, options: anyNamed('options'))).thenAnswer(
        (_) async => Response(
          data: 'Error',
          statusCode: 404,
          requestOptions: RequestOptions(path: testUrl),
        ),
      );

      // Act & Assert:
      expect(
          () => recipeDataSource.getRecipes(), throwsA(isA<ServerExeption>()));
    });
    test('should throw ServerException when Dio throws an error', () async {
      // Arrange:
      when(mockDio.get(any, options: anyNamed('options')))
          .thenThrow(DioException(requestOptions: RequestOptions(path: testUrl)));

      // Act & Assert:
      expect(
          () => recipeDataSource.getRecipes(), throwsA(isA<ServerExeption>()));
    });
  });
}
