import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes/core/resources/colors.dart';
import 'package:recipes/core/resources/keys.dart';
import 'package:recipes/core/utils/build_context.dart';
import 'package:recipes/recipe/domain/entity/recipes_entity.dart';
import 'package:recipes/recipe/presentation/widgets/image_network_widget.dart';

class RecipesGridScreen extends StatelessWidget {
  final String mealType;
  final List<RecipeEntity> recipes;

  const RecipesGridScreen(
      {super.key, required this.mealType, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pastelBeige,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: AppColors.orangeTextColor,
                  ),
                ),
                const Spacer(),
                Text(
                  mealType,
                  style: TextStyle(
                    fontSize: context.screenWidth * 0.07,
                    color: AppColors.orangeTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: context.screenWidth * 0.02,
                ),
                const Spacer(),
              ],
            ),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  final recipe = recipes[index];
                  return GestureDetector(
                    onTap: () {
                      context.push(
                        '/RecipeDetails',
                        extra: {
                          AppKeys.recipeDetailsKey: recipe,
                        },
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(-2, 2),
                            color: AppColors.orangeTextColor.withOpacity(0.3),
                          )
                        ],
                        color: AppColors.softPeach,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ImageNetworkWidget(
                            recipe: recipe,
                            height: context.screenHeight * 0.09,
                            width: context.screenWidth * 0.3,
                          ),
                          SizedBox(height: context.screenHeight * 0.01),
                          Text(
                            recipe.name,
                            style: TextStyle(
                              fontSize: context.screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
