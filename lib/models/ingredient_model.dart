import 'package:flutter/material.dart';

class IngredientModel {
  const IngredientModel({
    required this.name,
    required this.image,
    required this.color,
    required this.direction,
  });

  final String name;
  final String image;
  final Color color;
  final Offset direction;

  IngredientModel copyWith({Offset? direction}) => IngredientModel(
    name: name,
    image: image,
    color: color,
    direction: direction ?? this.direction,
  );
}
