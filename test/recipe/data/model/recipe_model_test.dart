import 'package:flutter_test/flutter_test.dart';
import 'package:recipes/recipe/data/model/recipe_model.dart';

void main() {
  group(
    'RecipesResponseModel',
    () {
      final validJson = {
        'recipes': [
          {
            'id': 1,
            'name': 'Pasta',
            'ingredients': ['Tomato', 'Basil', 'Cheese'],
            'instructions': ['Boil water', 'Cook pasta', 'Mix with sauce'],
            'prepTimeMinutes': 10,
            'cookTimeMinutes': 20,
            'servings': 4,
            'difficulty': 'Easy',
            'cuisine': 'Italian',
            'caloriesPerServing': 500,
            'tags': ['Vegetarian', 'Quick'],
            'image': 'image_url',
            'rating': 4.5,
            'reviewCount': 100,
            'mealType': ['Dinner']
          },
        ],
        'total': 1,
        'skip': 0,
        'limit': 10,
      };
      final expectedRecipeModel = RecipeModel(
        id: 1,
        name: 'Pasta',
        ingredients: ['Tomato', 'Basil', 'Cheese'],
        instructions: ['Boil water', 'Cook pasta', 'Mix with sauce'],
        prepTimeMinutes: 10,
        cookTimeMinutes: 20,
        servings: 4,
        difficulty: 'Easy',
        cuisine: 'Italian',
        caloriesPerServing: 500,
        tags: ['Vegetarian', 'Quick'],
        image: 'image_url',
        rating: 4.5,
        reviewCount: 100,
        mealType: ['Dinner'],
      );

      test('should corrctly parse valid Json with all fields ', () {
        //act :
        final result = RecipesResponseModel.fromJson(validJson);
        //assert :
        expect(result.recipes.first, equals(expectedRecipeModel)); //?!
        expect(result.total, equals(1));
        expect(result.skip, equals(0));
        expect(result.limit, equals(10));
      });

      test('should corrctly pars vaild Json with missing optional fields', () {
        final jsonWithoutOptionalFields = {
          'recipes': [
            {
              'id': 1,
              'name': 'Pasta',
              'ingredients': ['Tomato', 'Basil', 'Cheese'],
              'instructions': ['Boil water', 'Cook pasta', 'Mix with sauce'],
              'prepTimeMinutes': 10,
              'cookTimeMinutes': 20,
              'servings': 4,
              'difficulty': 'Easy',
              'cuisine': 'Italian',
              'caloriesPerServing': 500,
              'tags': ['Vegetarian', 'Quick'],
              'image': 'image_url',
              'rating': 4.5,
              'reviewCount': 100,
              'mealType': ['Dinner'],
            },
          ],
          'total': 1,
        };

        final result = RecipesResponseModel.fromJson(jsonWithoutOptionalFields);
        expect(result.recipes.first, equals(expectedRecipeModel));
        expect(result.total, equals(1));
        expect(result.skip, isNull); // skip is missing, should be null
        expect(result.limit, isNull);
      });

      test('should throw an error for invalid Json structure ', () {
        final invalidJson = {
          'recipes': 'not_list',
          'total': 'not_number',
        };
        expect(() => RecipeModel.fromJson(invalidJson), throwsA(isA()));
      });
      test('should throw an error when required fields are null', () {
        final invalidJsonWithNullValues = {
          'recipes': null,
          'total': null, // they are required
        };

        expect(() => RecipeModel.fromJson(invalidJsonWithNullValues),
            throwsA(isA()));
      });

      test('should parse corrctly with an empty recipes list', () {
        final emptyRecipesJson = {
          'recipes': [],
          'total': 0,
          'skip': 0,
          'limit': 10,
        };
        final result = RecipesResponseModel.fromJson(emptyRecipesJson);
        expect(result.recipes, isEmpty);
        expect(result.total, equals(0));
      });
    },
  );
}
