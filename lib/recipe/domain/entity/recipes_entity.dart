// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

class RecipesResponseEntity {
  final List<RecipeEntity> recipes;
  final int total;

  RecipesResponseEntity({
    required this.recipes,
    required this.total,
  });
}

class RecipeEntity {
  final int id;
  final String name;
  final List<String> ingredients;
  final List<String> instructions;
  final int prepTimeMinutes;
  final int cookTimeMinutes;
  final int servings;
  final String difficulty;
  final String cuisine;
  final int caloriesPerServing;
  final List<String> tags;
  final String image;
  final double rating;
  final int reviewCount;
  final List<String> mealType;

  RecipeEntity({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.difficulty,
    required this.cuisine,
    required this.caloriesPerServing,
    required this.tags,
    required this.image,
    required this.rating,
    required this.reviewCount,
    required this.mealType,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RecipeEntity &&
        other.id == id &&
        other.name == name &&
        listEquals(other.ingredients, ingredients) &&
        listEquals(other.instructions, instructions) &&
        other.prepTimeMinutes == prepTimeMinutes &&
        other.cookTimeMinutes == cookTimeMinutes &&
        other.servings == servings &&
        other.difficulty == difficulty &&
        other.cuisine == cuisine &&
        other.caloriesPerServing == caloriesPerServing &&
        listEquals(other.tags, tags) &&
        other.image == image &&
        other.rating == rating &&
        other.reviewCount == reviewCount &&
        listEquals(other.mealType, mealType);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        ingredients.hashCode ^
        instructions.hashCode ^
        prepTimeMinutes.hashCode ^
        cookTimeMinutes.hashCode ^
        servings.hashCode ^
        difficulty.hashCode ^
        cuisine.hashCode ^
        caloriesPerServing.hashCode ^
        tags.hashCode ^
        image.hashCode ^
        rating.hashCode ^
        reviewCount.hashCode ^
        mealType.hashCode;
  }
}
