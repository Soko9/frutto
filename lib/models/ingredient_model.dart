import 'package:flutter/material.dart';

class IngredientModel {
  const IngredientModel({
    required this.name,
    required this.icon,
    required this.color,
    required this.direction,
  });

  final String name;
  final IconData icon;
  final Color color;
  final Offset direction;

  IngredientModel copyWith({Offset? direction}) => IngredientModel(
    name: name,
    icon: icon,
    color: color,
    direction: direction ?? this.direction,
  );
}
