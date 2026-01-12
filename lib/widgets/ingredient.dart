import 'package:flutter/material.dart';

class IngredientModel {
  const IngredientModel({
    required this.name,
    required this.icon,
    required this.color,
  });

  final String name;
  final IconData icon;
  final Color color;
}

class Ingredient extends StatelessWidget {
  const Ingredient({
    required this.model,
    super.key,
  });

  final IngredientModel model;

  @override
  Widget build(BuildContext context) {
    return Icon(
      model.icon,
      color: model.color,
    );
  }
}
