import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/core/resources/colors.dart';
import 'package:recipes/core/resources/strings.dart';
import 'package:recipes/core/utils/build_context.dart';
import 'package:recipes/recipe/presentation/recipes_bloc/recipes_bloc.dart';

class FailureWidget extends StatelessWidget {
  final String message;
  const FailureWidget({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.close_rounded,
            color: AppColors.orangeTextColor,
            size: context.screenWidth * 0.3,
          ).animate().fade(delay: 0.1.seconds, duration: 0.2.seconds),
          SizedBox(
            height: context.screenHeight * 0.05,
          ),
          Text(
            message,
            style: const TextStyle(
              color: AppColors.orangeTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ).animate().fade(delay: 0.15.seconds, duration: 0.3.seconds),
          SizedBox(
            height: context.screenHeight * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: TextButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  AppColors.orangeTextColor,
                ),
              ),
              onPressed: () {
                context.read<RecipesBloc>().add(
                      GetRecipes(),
                    );
              },
              child: const Center(
                child: Text(
                  AppStrings.tryAgain,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ).animate().fade(delay: 0.2.seconds, duration: 0.4.seconds),
          SizedBox(
            height: context.screenHeight * 0.05,
          ),
        ],
      ),
    );
  }
}
