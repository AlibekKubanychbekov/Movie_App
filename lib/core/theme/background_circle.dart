import 'package:flutter/material.dart';

class BackgroundCircle extends StatelessWidget {
  const BackgroundCircle({
    required this.color,
    this.radius = 200,
    super.key,
  });

  final Color color;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: 1,
      decoration: BoxDecoration(
          color: color.withOpacity(0.5),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              blurRadius: 500,
              color: color.withOpacity(0.15),
              spreadRadius: radius,
            )
          ]),
    );
  }
}
