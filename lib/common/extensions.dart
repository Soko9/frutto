import 'package:flutter/material.dart';

extension ContextX on BuildContext {
  double get sh => MediaQuery.sizeOf(this).height;
  double get sw => MediaQuery.sizeOf(this).width;

  TextTheme get textTheme => Theme.of(this).textTheme;
}
