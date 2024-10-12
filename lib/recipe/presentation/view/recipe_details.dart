import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes/core/resources/colors.dart';
import 'package:recipes/core/resources/strings.dart';
import 'package:recipes/core/utils/build_context.dart';
import 'package:recipes/recipe/domain/entity/recipes_entity.dart';

class RecipeDetailsScreen extends StatelessWidget {
  final RecipeEntity recipe;
  const RecipeDetailsScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pastelBeige,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    recipe.name,
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
              Image.network(
                recipe.image,
                height: context.screenHeight * 0.3,
                width: context.screenWidth,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  AppStrings.ingredients,
                  style: TextStyle(
                    fontSize: context.screenWidth * 0.05,
                    fontWeight: FontWeight.w400,
                    color: AppColors.orangeTextColor,
                  ),
                ),
              ),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: recipe.ingredients.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Text("• ", style: TextStyle(fontSize: 18)),
                      title: Text(recipe.ingredients[index]),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  AppStrings.instructions,
                  style: TextStyle(
                    fontSize: context.screenWidth * 0.05,
                    fontWeight: FontWeight.w400,
                    color: AppColors.orangeTextColor,
                  ),
                ),
              ),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: recipe.instructions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Text("• ", style: TextStyle(fontSize: 18)),
                      title: Text(recipe.ingredients[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
