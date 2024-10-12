
import 'package:recipes/recipe/domain/entity/recipes_entity.dart';

Map<String, List<RecipeEntity>> groupRecipesByMealType(List<RecipeEntity> recipes) {
  Map<String, List<RecipeEntity>> groupedRecipes = {};

  for (var recipe in recipes) {
    List<String> mealTypes = recipe.mealType;

    for (String mealType in mealTypes) {
      if (!groupedRecipes.containsKey(mealType)) {
        groupedRecipes[mealType] = [];
      }
      groupedRecipes[mealType]!.add(recipe);
    }
  }

  return groupedRecipes;
}
