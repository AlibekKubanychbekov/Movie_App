import 'package:flutter/material.dart';
import 'package:movie_app/core/colors/app_colors.dart';
import 'package:movie_app/core/extension/build_context_extension.dart';

class BackgroundCircles extends StatelessWidget {
  const BackgroundCircles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(top: 0, right: 0, child: _getCircle()),
        Positioned(bottom: context.fullVerticalSize / 3, child: _getCircle()),
      ],
    );
  }

  Widget _getCircle() {
    return Container(
      height: 1,
      width: 1,
      decoration: BoxDecoration(
        color: AppColors.orangeColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            blurRadius: 250,
            color: AppColors.orangeColor.withOpacity(0.2),
            spreadRadius: 250,
          )
        ],
      ),
    );
  }
}
