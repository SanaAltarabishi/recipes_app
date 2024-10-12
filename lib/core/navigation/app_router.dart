import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes/recipe/domain/entity/recipes_entity.dart';
import 'package:recipes/recipe/presentation/view/home_page.dart';
import 'package:recipes/recipe/presentation/view/recipe_details.dart';
import 'package:recipes/recipe/presentation/view/recipes_grid_screen.dart';
import 'package:recipes/recipe/presentation/view/splash_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/first',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const HomePage(),
          transitionsBuilder: _fadeTransition,
        ),
      ),
      GoRoute(
        path: '/RecipesGridScreen',
        pageBuilder: (context, state) {
          final Map<String, dynamic> data = state.extra as Map<String, dynamic>;
          return CustomTransitionPage(
            key: state.pageKey,
            child: RecipesGridScreen(
              mealType: data['mealType'] as String,
              recipes: data['recipes'] as List<RecipeEntity>,
            ),
            transitionsBuilder: _fadeTransition,
          );
        },
      ),
      GoRoute(
          path: '/RecipeDetails',
          pageBuilder: (context, state) {
            final Map<String, dynamic> data =
                state.extra as Map<String, dynamic>;
            return CustomTransitionPage(
              key: state.pageKey,
              child: RecipeDetailsScreen(
                recipe: data['recipe'] as RecipeEntity,
              ),
              transitionsBuilder: _fadeTransition,
            );
          },),
    ],
  );

  static Widget _fadeTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    const curve = Curves.easeInOut;
    var fadeTween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));

    return FadeTransition(
      opacity: animation.drive(fadeTween),
      child: child,
    );
  }
}
