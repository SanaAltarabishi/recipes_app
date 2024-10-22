import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes/core/resources/strings.dart';
import 'package:recipes/recipe/presentation/view/home_page.dart';
import 'package:recipes/recipe/presentation/view/splash_screen.dart';

void main() {
  testWidgets('SplashScreen displays image and navigates after delay',
      (WidgetTester tester) async {
    final GoRouter router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const SplashScreen(),
        ),
      ],
    );
    await tester.pumpWidget(MaterialApp.router(
      routerConfig: router,
    ));
    await tester.pump(const Duration(seconds: 2));
    expect(find.byType(Image), findsOneWidget);
    expect(find.text(AppStrings.title), findsOneWidget);
  });

   testWidgets('SplashScreen navigates to HomePage after delay', (WidgetTester tester) async {
    final GoRouter router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: '/first',
          builder: (context, state) => const HomePage(),
        ),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(
      routerConfig: router,
    ));

    expect(find.byType(SplashScreen), findsOneWidget);
    expect(find.byType(HomePage), findsNothing);

    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle(); // Ensure the app finishes all animations and navigation

    expect(find.byKey(const Key('first_page')), findsOneWidget);
    expect(find.byType(SplashScreen), findsNothing);
  });
}
