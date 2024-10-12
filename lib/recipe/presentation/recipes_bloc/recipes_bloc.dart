import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recipes/core/error/failures.dart';
import 'package:recipes/recipe/domain/entity/recipes_entity.dart';
import 'package:recipes/recipe/domain/use_case/get_resipes.dart';

part 'recipes_event.dart';
part 'recipes_state.dart';

class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  final GetResipesUseCase getResipesUseCase;
  RecipesBloc(
    this.getResipesUseCase,
  ) : super(RecipesInitial()) {
    on<GetRecipes>((event, emit) async {
      emit(RecipesLoading());

      final failureOrEntity = await getResipesUseCase.call();
      failureOrEntity.fold((failure) {
        String message = '';
        switch (failure.runtimeType) {
          case ServerFailure:
            message = 'something went wrong please try later ..';
            break;
          case NetworkFailure:
            message = 'there is no internet ..';
            break;
          default:
            message = 'undefiend error ';
        }
        emit(RecipesFailure(message: message));
      }, (entity) {
        emit(RecipesSuccess(recipesResponseEntity: entity));
      });
    });
  }
}
