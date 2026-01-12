import 'package:flutter/material.dart';
import 'package:frutto/models/ingredient_model.dart';

class ProductModel {
  const ProductModel({
    required this.name,
    required this.color,
    required this.ingredients,
  });

  final String name;
  final Color color;
  final List<IngredientModel> ingredients;

  static const List<ProductModel> products = [
    ProductModel(
      name: 'مربى الفراولة',
      color: Colors.red,
      ingredients: [
        IngredientModel(
          name: 'strawberry',
          icon: Icons.egg_alt,
          color: Colors.red,
          direction: Offset(0.9, 0.6),
        ),
      ],
    ),
    ProductModel(
      name: 'مربى التين',
      color: Colors.brown,
      ingredients: [
        IngredientModel(
          name: 'fig',
          icon: Icons.egg_alt,
          color: Colors.brown,
          direction: Offset(0.9, 0.6),
        ),
      ],
    ),
    ProductModel(
      name: 'مربى المشمش',
      color: Colors.orange,
      ingredients: [
        IngredientModel(
          name: 'apricot',
          icon: Icons.egg_alt,
          color: Colors.orange,
          direction: Offset(0.9, 0.6),
        ),
      ],
    ),
  ];
}
