import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes/core/resources/colors.dart';
import 'package:recipes/core/resources/images.dart';
import 'package:recipes/core/resources/strings.dart';
import 'package:recipes/core/utils/build_context.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      context.pushReplacement('/first');
    });
    return Scaffold(
      backgroundColor: AppColors.pastelBeige,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.splashImage,
              width: context.screenWidth * 0.5,
              height: context.screenHeight * 0.35,
            ).animate().scaleXY(duration: 0.5.seconds, delay: 0.3.seconds),
            Text(
              AppStrings.title,
              style: TextStyle(
                fontSize: context.screenWidth * 0.08, //20,
                fontWeight: FontWeight.bold,
                color: AppColors.orangeTextColor,
              ),
            ).animate().scaleXY(duration: 0.5.seconds, delay: 0.4.seconds),
          ],
        ),
      ),
    );
  }
}
