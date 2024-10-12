// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'recipes_bloc.dart';

@immutable
sealed class RecipesState {}

final class RecipesInitial extends RecipesState {}

class RecipesLoading extends RecipesState {}

class RecipesFailure extends RecipesState {
  final String message;
  RecipesFailure({
    required this.message,
  });
}

class RecipesSuccess extends RecipesState {
  final RecipesResponseEntity recipesResponseEntity;
  RecipesSuccess({
    required this.recipesResponseEntity,
  });
}
