import 'package:flutter_test/flutter_test.dart';
import 'package:recipes/recipe/domain/entity/recipes_entity.dart';

void main() {
  group(
    'RecipeEntity',
    () {
      test(
        'should initialize correctly with valid inputs',
        () {
          //arrange :
          final recipe = RecipeEntity(
            id: 1,
            name: "Spaghetti Carbonara",
            ingredients: [
              'Spaghetti',
              'Eggs',
              'Bacon',
              'Parmesan Cheese',
            ],
            instructions: [
              'Boil pasta',
              'Fry bacon',
              'Mix eggs and cheese',
              'Combine everything'
            ],
            prepTimeMinutes: 15,
            cookTimeMinutes: 20,
            servings: 4,
            difficulty: 'Easy',
            cuisine: 'Italian',
            caloriesPerServing: 500,
            tags: ['Pasta', 'Dinner'],
            image: 'https://example.com/spaghetti.jpg',
            rating: 4.5,
            reviewCount: 150,
            mealType: ['Dinner', 'Main Course'],
          );
          //act , assert:
          expect(recipe.id, 1);
          expect(recipe.name, 'Spaghetti Carbonara');
          expect(recipe.ingredients.length, 4);
          expect(recipe.instructions.length, 4);
          expect(recipe.prepTimeMinutes, 15);
          expect(recipe.cookTimeMinutes, 20);
          expect(recipe.servings, 4);
          expect(recipe.difficulty, 'Easy');
          expect(recipe.cuisine, 'Italian');
          expect(recipe.caloriesPerServing, 500);
          expect(recipe.tags, ['Pasta', 'Dinner']);
          expect(recipe.image, 'https://example.com/spaghetti.jpg');
          expect(recipe.rating, 4.5);
          expect(recipe.reviewCount, 150);
          expect(recipe.mealType, ['Dinner', 'Main Course']);
        },
      );

      test(
        'should consider two RecipeEntities equal if they have the same values ',
        () {
//arrange:
          final recipe1 = RecipeEntity(
            id: 1,
            name: 'Spaghetti Carbonara',
            ingredients: ['Spaghetti', 'Eggs', 'Bacon', 'Parmesan Cheese'],
            instructions: [
              'Boil pasta',
              'Fry bacon',
              'Mix eggs and cheese',
              'Combine everything'
            ],
            prepTimeMinutes: 15,
            cookTimeMinutes: 20,
            servings: 4,
            difficulty: 'Easy',
            cuisine: 'Italian',
            caloriesPerServing: 500,
            tags: ['Pasta', 'Dinner'],
            image: 'https://example.com/spaghetti.jpg',
            rating: 4.5,
            reviewCount: 150,
            mealType: ['Dinner', 'Main Course'],
          );

          final recipe2 = RecipeEntity(
            id: 1,
            name: 'Spaghetti Carbonara',
            ingredients: ['Spaghetti', 'Eggs', 'Bacon', 'Parmesan Cheese'],
            instructions: [
              'Boil pasta',
              'Fry bacon',
              'Mix eggs and cheese',
              'Combine everything'
            ],
            prepTimeMinutes: 15,
            cookTimeMinutes: 20,
            servings: 4,
            difficulty: 'Easy',
            cuisine: 'Italian',
            caloriesPerServing: 500,
            tags: ['Pasta', 'Dinner'],
            image: 'https://example.com/spaghetti.jpg',
            rating: 4.5,
            reviewCount: 150,
            mealType: ['Dinner', 'Main Course'],
          );
          expect(recipe1, recipe2);
        },
      );

      test(
        'should handle empty ingredients and instructions ',
        () {
          //arrange:
          final recipe = RecipeEntity(
            id: 1,
            name: 'Empty Recipe',
            ingredients: [],
            instructions: [],
            prepTimeMinutes: 0,
            cookTimeMinutes: 0,
            servings: 1,
            difficulty: 'Easy',
            cuisine: 'None',
            caloriesPerServing: 0,
            tags: [],
            image: '',
            rating: 0.0,
            reviewCount: 0,
            mealType: [],
          );

          expect(recipe.ingredients, isEmpty);
          expect(recipe.instructions, isEmpty);
          expect(recipe.prepTimeMinutes, 0);
        },
      );
    },
  );

  group('RecipesResponseEntity', () {
    test(
      'should initialize correcctly with a list of recipes',
      () {
        final recipe = RecipeEntity(
          id: 1,
          name: 'Spaghetti Carbonara',
          ingredients: ['Spaghetti', 'Eggs', 'Bacon', 'Parmesan Cheese'],
          instructions: [
            'Boil pasta',
            'Fry bacon',
            'Mix eggs and cheese',
            'Combine everything'
          ],
          prepTimeMinutes: 15,
          cookTimeMinutes: 20,
          servings: 4,
          difficulty: 'Easy',
          cuisine: 'Italian',
          caloriesPerServing: 500,
          tags: ['Pasta', 'Dinner'],
          image: 'https://example.com/spaghetti.jpg',
          rating: 4.5,
          reviewCount: 150,
          mealType: ['Dinner', 'Main Course'],
        );
        final response = RecipesResponseEntity(recipes: [recipe], total: 1);

        expect(response.recipes.length, 1);
        expect(response.total, 1);
      },
    );
  });
}
