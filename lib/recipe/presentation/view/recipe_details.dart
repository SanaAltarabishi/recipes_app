import 'package:flutter/material.dart';
import 'package:recipes/core/resources/colors.dart';
import 'package:recipes/core/resources/strings.dart';
import 'package:recipes/core/utils/build_context.dart';
import 'package:recipes/recipe/domain/entity/recipes_entity.dart';
import 'package:recipes/recipe/presentation/widgets/details_app_bar.dart';
import 'package:recipes/recipe/presentation/widgets/details_row.dart';
import 'package:recipes/recipe/presentation/widgets/image_network_widget.dart';

class RecipeDetailsScreen extends StatefulWidget {
  final RecipeEntity recipe;
  const RecipeDetailsScreen({super.key, required this.recipe});

  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  bool isIngredientsOppened = false;
  final ScrollController _ingredientsScrollController = ScrollController();
  bool isInstructionsOppened = false;
  final ScrollController _instructionsScrollController = ScrollController();
  @override
  void dispose() {
    _ingredientsScrollController.dispose();
    _instructionsScrollController.dispose();
    super.dispose();
  }

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
              DetailsAppBar(widget: widget),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              ImageNetworkWidget(
                recipe: widget.recipe,
                height: context.screenHeight * 0.3,
                width: context.screenWidth,
              ),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              DetailsRow(
                title: AppStrings.prepTimeMinutes,
                description: widget.recipe.prepTimeMinutes.toString(),
              ),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              DetailsRow(
                title: AppStrings.cookTimeMinutes,
                description: widget.recipe.cookTimeMinutes.toString(),
              ),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              DetailsRow(
                title: AppStrings.cuisine,
                description: widget.recipe.cuisine.toString(),
              ),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              DetailsRow(
                title: AppStrings.difficulty,
                description: widget.recipe.difficulty.toString(),
              ),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isIngredientsOppened = !isIngredientsOppened;
                      });
                    },
                    child: Text(
                      AppStrings.ingredients,
                      style: TextStyle(
                        fontSize: context.screenWidth * 0.05,
                        fontWeight: FontWeight.w400,
                        color: AppColors.orangeTextColor,
                      ),
                    ),
                  ),
                  Icon(
                    isIngredientsOppened
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                    color: AppColors.orangeTextColor,
                  )
                ],
              ),
              if (isIngredientsOppened)
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.orangeTextColor.withOpacity(0.12),
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  height: 150,
                  child: Scrollbar(
                    controller: _ingredientsScrollController,
                    thumbVisibility: true,
                    child: ListView.builder(
                      controller: _ingredientsScrollController,
                      shrinkWrap: true,
                      itemCount: widget.recipe.ingredients.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading:
                              const Text("• ", style: TextStyle(fontSize: 18)),
                          title: Text(widget.recipe.ingredients[index]),
                        );
                      },
                    ),
                  ),
                ),
              SizedBox(
                height: context.screenHeight * 0.03,
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isInstructionsOppened = !isInstructionsOppened;
                      });
                    },
                    child: Text(
                      AppStrings.instructions,
                      style: TextStyle(
                        fontSize: context.screenWidth * 0.05,
                        fontWeight: FontWeight.w400,
                        color: AppColors.orangeTextColor,
                      ),
                    ),
                  ),
                  Icon(
                    isInstructionsOppened
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                    color: AppColors.orangeTextColor,
                  )
                ],
              ),
              if (isInstructionsOppened)
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.orangeTextColor.withOpacity(0.12),
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Scrollbar(
                    thumbVisibility: true,
                    controller: _instructionsScrollController,
                    child: ListView.builder(
                      controller: _instructionsScrollController,
                      shrinkWrap: true,
                      itemCount: widget.recipe.instructions.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading:
                              const Text("• ", style: TextStyle(fontSize: 18)),
                          title: Text(widget.recipe.instructions[index]),
                        );
                      },
                    ),
                  ),
                ),
              SizedBox(
                height: context.screenHeight * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
