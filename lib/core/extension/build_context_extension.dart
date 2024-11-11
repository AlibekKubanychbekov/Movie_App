import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  double get fullVerticalSize => MediaQuery.of(this).size.height;
  double get fullHorizontalSize => MediaQuery.of(this).size.width;
}
