import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes/core/resources/colors.dart';
import 'package:recipes/core/utils/build_context.dart';
import 'package:recipes/recipe/presentation/view/recipe_details.dart';

class DetailsAppBar extends StatelessWidget {
  const DetailsAppBar({
    super.key,
    required this.widget,
  });

  final RecipeDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return Row(
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
          widget.recipe.name,
          style: TextStyle(
            fontSize: (widget.recipe.name).split(' ').length > 2
                ? context.screenWidth * 0.045
                : context.screenWidth * 0.07,
            color: AppColors.orangeTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: context.screenWidth * 0.03,
        ),
        const Spacer(),
      ],
    );
  }
}
