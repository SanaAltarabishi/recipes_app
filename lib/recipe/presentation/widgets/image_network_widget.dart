import 'package:flutter/material.dart';
import 'package:recipes/core/resources/colors.dart';
import 'package:recipes/core/utils/build_context.dart';
import 'package:recipes/recipe/domain/entity/recipes_entity.dart';

class ImageNetworkWidget extends StatelessWidget {
  const ImageNetworkWidget({
    super.key,
    required this.recipe,
    required this.height,
    required this.width,
  });

  final RecipeEntity recipe;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      recipe.image,
      height: height,
      width: width,
      fit: BoxFit.cover,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return CircularProgressIndicator(
          color: AppColors.orangeTextColor,
          value: loadingProgress.expectedTotalBytes != null
              ? loadingProgress.cumulativeBytesLoaded /
                  (loadingProgress.expectedTotalBytes ?? 1)
              : null,
        );
      },
      errorBuilder: (context, error, StackTrace? stackTrace) {
        return Container(
          color: AppColors.orangeTextColor.withOpacity(0.2),
          height: context.screenHeight * 0.09,
          width: context.screenWidth * 0.3,
          child: Icon(
            Icons.broken_image_outlined,
            color: AppColors.orangeTextColor,
            size: context.screenHeight * 0.05,
          ),
        );
      },
    );
  }
}
