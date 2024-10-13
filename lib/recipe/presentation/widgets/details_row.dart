import 'package:flutter/material.dart';
import 'package:recipes/core/resources/colors.dart';
import 'package:recipes/core/utils/build_context.dart';

class DetailsRow extends StatelessWidget {
  final String title;
  final String description;
  const DetailsRow({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.screenWidth * 0.025),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: context.screenWidth * 0.05,
              fontWeight: FontWeight.w400,
              color: AppColors.orangeTextColor,
            ),
          ),
          Text(
            description,
          ),
        ],
      ),
    );
  }
}
