import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes/core/functions/group_recipes_by_meal_type.dart';
import 'package:recipes/core/resources/colors.dart';
import 'package:recipes/core/utils/build_context.dart';
import 'package:recipes/recipe/domain/entity/recipes_entity.dart';

class RecipesSuccessWidget extends StatelessWidget {
  final List<RecipeEntity> recipes;

  const RecipesSuccessWidget({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    final Map<String, List<RecipeEntity>> groupedRecipes =
        groupRecipesByMealType(recipes);
    final mealTypes = groupedRecipes.keys.toList();

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 2 / 1,
      ),
      itemCount: mealTypes.length,
      itemBuilder: (context, index) {
        final mealType = mealTypes[index];

        return GestureDetector(
          onTap: () {
            context.push('/RecipesGridScreen', extra: {
              'mealType': mealType,
              'recipes': groupedRecipes[mealType],
            });
          },
          child: Card(
            elevation: 3,
            color: AppColors.softPeach,
            child: Center(
              child: Text(
                mealType,
                style: TextStyle(
                  fontSize: context.screenWidth * 0.04,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
