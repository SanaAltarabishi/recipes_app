import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:recipes/core/error/failures.dart';
import 'package:recipes/recipe/domain/entity/recipes_entity.dart';
import 'package:recipes/recipe/domain/repo/recipe_repo.dart';
import 'package:recipes/recipe/domain/use_case/get_resipes.dart';
import 'get_resipes_test.mocks.dart';

// class MockRecipeRepo extends Mock implements RecipeRepo {}
@GenerateMocks([RecipeRepo])
//flutter pub run build_runner build --delete-conflicting-outputs
void main() {
  late GetResipesUseCase useCase;
  late RecipeRepo mockRecipeRepo;
  setUp(() {
    mockRecipeRepo = MockRecipeRepo();
    useCase = GetResipesUseCase(recipeRepo: mockRecipeRepo);
  });
//! scenario 1:
  test(
    'should return a list of recipes when repository returns data successfully',
    () async {
      // Arrange
      final recipes = RecipesResponseEntity(
        recipes: [
          RecipeEntity(
            id: 1,
            name: 'Spaghetti',
            ingredients: ['Pasta', 'Tomato Sauce'],
            instructions: ['Boil water', 'Cook pasta'],
            prepTimeMinutes: 10,
            cookTimeMinutes: 20,
            servings: 4,
            difficulty: 'Easy',
            cuisine: 'Italian',
            caloriesPerServing: 400,
            tags: ['Vegetarian'],
            image: 'spaghetti.jpg',
            rating: 4.5,
            reviewCount: 100,
            mealType: ['Dinner'],
          ),
        ],
        total: 1,
      );

//mock the behavior of the repo:
      when(mockRecipeRepo.getResipes()).thenAnswer((_) async => Right(recipes));
      //act :
      final result = await useCase();

      expect(result, Right(recipes));
      verify(mockRecipeRepo.getResipes())
          .called(1); //ensure the repo is called once
      verifyNoMoreInteractions(mockRecipeRepo);
    },
  );
//! scenario 2 :
  test(
    'should return a ServerFailure when the repo fails to retrieve data ',
    () async {
      //arrange :
      when(mockRecipeRepo.getResipes())
          .thenAnswer((_) async => Left(ServerFailure()));
//act :
      final result = await useCase();
      //assert :
      expect(
        result,
        Left<Failures, RecipesResponseEntity>(ServerFailure()),
      );
      verify(mockRecipeRepo.getResipes()).called(1);
      verifyNoMoreInteractions(mockRecipeRepo);
    },
  );
//! scenario 3 :
  test(
    'should return an empty list when the repo returns no recipes ',
    () async {
      final recipes = RecipesResponseEntity(
        recipes: [],
        total: 0,
      );
      when(mockRecipeRepo.getResipes()).thenAnswer((_) async => Right(recipes));

      final result = await useCase();

      expect(result, Right(recipes));
      expect(
          result
              .getOrElse(() => RecipesResponseEntity(recipes: [], total: 0))
              .recipes
              .isEmpty,
          true);
      verify(mockRecipeRepo.getResipes()).called(1);
      verifyNoMoreInteractions(mockRecipeRepo);
    },
  );

  //!scenario 4 : cach data :
  //! scenario 5 : no internet :
  test(
    'should return internetConnectionError when there is no internet connection',
    () async {
      when(mockRecipeRepo.getResipes())
          .thenAnswer((_) async => Left(NetworkFailure()));
      final result = await useCase();
      expect(result, Left(NetworkFailure()));
      verify(mockRecipeRepo.getResipes()).called(1);
    },
  );
}
