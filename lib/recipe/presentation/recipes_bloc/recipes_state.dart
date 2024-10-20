// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'recipes_bloc.dart';

@immutable
sealed class RecipesState {
  const RecipesState();
}

final class RecipesInitial extends RecipesState {
  const RecipesInitial();
}

class RecipesLoading extends RecipesState {
  const RecipesLoading();
}

class RecipesFailure extends RecipesState {
  final String message;
  const RecipesFailure({
    required this.message,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RecipesFailure && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

class RecipesSuccess extends RecipesState {
  final RecipesResponseEntity recipesResponseEntity;
  const RecipesSuccess({
    required this.recipesResponseEntity,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RecipesSuccess &&
        other.recipesResponseEntity == recipesResponseEntity;
  }

  @override
  int get hashCode => recipesResponseEntity.hashCode;
}
