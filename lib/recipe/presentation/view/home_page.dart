import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:recipes/core/network/network_connection.dart';
import 'package:recipes/core/resources/colors.dart';
import 'package:recipes/core/resources/strings.dart';
import 'package:recipes/core/utils/build_context.dart';
import 'package:recipes/recipe/data/data_source/remote_get_recipe_data_source.dart';
import 'package:recipes/recipe/data/repo_implement/recipe_repo_imp.dart';
import 'package:recipes/recipe/domain/use_case/get_resipes.dart';
import 'package:recipes/recipe/presentation/recipes_bloc/recipes_bloc.dart';
import 'package:recipes/recipe/presentation/widgets/failure_widget.dart';
import 'package:recipes/recipe/presentation/widgets/recipes_success.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecipesBloc(
        GetResipesUseCase(
          recipeRepo: RecipeRepoImp(
            remoteGetRecipeDataSource: RemoteGetRecipeDataSource(dio: Dio()),
            networkConnection: NetworkConnection(
              internetConnectionChecker: InternetConnectionChecker(),
            ),
          ),
        ),
      )..add(GetRecipes()),
      child: Scaffold(
        backgroundColor: AppColors.pastelBeige,
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: context.screenHeight * 0.02,
                ),
                Text(
                  AppStrings.mealType,
                  style: TextStyle(
                    fontSize: context.screenWidth * 0.08,
                    fontWeight: FontWeight.bold,
                    color: AppColors.orangeTextColor,
                  ),
                ),
                SizedBox(
                  height: context.screenHeight * 0.02,
                ),
                Expanded(
                  child: BlocBuilder<RecipesBloc, RecipesState>(
                    builder: (context, state) {
                      if (state is RecipesSuccess) {
                        return RecipesSuccessWidget(
                          recipes: state.recipesResponseEntity.recipes,
                        );
                      } else if (state is RecipesFailure) {
                        return FailureWidget(
                          message: state.message,
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.orangeTextColor,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
