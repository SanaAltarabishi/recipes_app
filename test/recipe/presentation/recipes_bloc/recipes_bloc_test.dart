import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:recipes/core/error/failures.dart';
import 'package:recipes/recipe/domain/entity/recipes_entity.dart';
import 'package:recipes/recipe/domain/use_case/get_resipes.dart';
import 'package:recipes/recipe/presentation/recipes_bloc/recipes_bloc.dart';
import '../../domain/use_case/get_resipes_test.mocks.dart';

@GenerateMocks([GetResipesUseCase])
void main() {
  late RecipesBloc recipesBloc;
  late MockRecipeRepo mockRecipeRepo;
  late GetResipesUseCase getResipesUseCase;

  setUp(() {
    mockRecipeRepo = MockRecipeRepo();
    getResipesUseCase = GetResipesUseCase(recipeRepo: mockRecipeRepo);
    recipesBloc = RecipesBloc(getResipesUseCase);
  });

  tearDown(() {
    recipesBloc.close();
  });

  group(
    'RecipesBloc',
    () {
      test('initial state should be RecipesInitial', () {
        expect(recipesBloc.state, const RecipesInitial());
      });

      blocTest<RecipesBloc, RecipesState>(
        'emits [RecipesLoading , RecipesFailure ] when GetRecipes event is added and use case returns a ServerFailure',
        build: () {
          when(getResipesUseCase.call())
              .thenAnswer((_) async => Left(ServerFailure()));
          return recipesBloc;
        },
        act: (bloc) => bloc.add(GetRecipes()),
        expect: () => [
          const RecipesLoading(),
          const RecipesFailure(
              message: 'something went wrong please try later ..')
        ],
      );

      blocTest(
        'emits [RecipesLoading , RecipesSuccess] when GetRecipes event is added and use case returns a RecipesResponseEntity',
        build: () {
          when(getResipesUseCase.call()).thenAnswer(
            (_) async => Right(
              RecipesResponseEntity(recipes: [], total: 0),
            ),
          );
          return recipesBloc;
        },
        act: (bloc) => bloc.add(GetRecipes()),
        expect: () => [
          const RecipesLoading(),
          isA<RecipesSuccess>(),
          // RecipesSuccess(recipesResponseEntity: entity)
        ],
      );

      blocTest<RecipesBloc, RecipesState>(
        'emits [RecipesLoading , RecipesFailure] when GetRecipes event is added and use case returns a NetwrorkFailure',
        build: () {
          when(getResipesUseCase.call()).thenAnswer(
            (_) async => Left(
              NetworkFailure(),
            ),
          );
          return recipesBloc;
        },
        act: (bloc) => bloc.add(GetRecipes()),
        expect: () => [
          const RecipesLoading(),
          const RecipesFailure(message: 'there is no internet ..'),
        ],
      );


    },
  );
}
