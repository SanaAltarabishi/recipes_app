import 'package:recipes/recipe/domain/entity/recipes_entity.dart';

class RecipesResponseModel extends RecipesResponseEntity {
  final int? skip;
  final int? limit;
  RecipesResponseModel({
    required super.recipes,
    required super.total,
    this.limit,
    this.skip,
  });
  factory RecipesResponseModel.fromJson(Map<String, dynamic> json) {
    return RecipesResponseModel(
      recipes: List<RecipeModel>.from(
          json['recipes'].map((recipe) => RecipeModel.fromJson(recipe))),
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }
}

// sub model:
class RecipeModel extends RecipeEntity {
  RecipeModel({
    required super.id,
    required super.name,
    required super.ingredients,
    required super.instructions,
    required super.prepTimeMinutes,
    required super.cookTimeMinutes,
    required super.servings,
    required super.difficulty,
    required super.cuisine,
    required super.caloriesPerServing,
    required super.tags,
    required super.image,
    required super.rating,
    required super.reviewCount,
    required super.mealType,
  });
  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'],
      name: json['name'],
      ingredients: List<String>.from(json['ingredients']),
      instructions: List<String>.from(json['instructions']),
      prepTimeMinutes: json['prepTimeMinutes'],
      cookTimeMinutes: json['cookTimeMinutes'],
      servings: json['servings'],
      difficulty: json['difficulty'],
      cuisine: json['cuisine'],
      caloriesPerServing: json['caloriesPerServing'],
      tags: List<String>.from(json['tags']),
      image: json['image'],
      rating: json['rating'].toDouble(),
      reviewCount: json['reviewCount'],
      mealType: List<String>.from(json['mealType']),
    );
  }
}
