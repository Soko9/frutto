import 'package:flutter/material.dart';
import 'package:frutto/common/asset_manager.dart';
import 'package:frutto/models/ingredient_model.dart';

class ProductModel {
  const ProductModel({
    required this.name,
    required this.image,
    required this.color,
    required this.ingredients,
  });

  final String name;
  final String image;
  final Color color;
  final List<IngredientModel> ingredients;

  static const List<ProductModel> products = [
    ProductModel(
      name: 'مربى الفراولة',
      image: AssetManager.jam,
      color: Colors.red,
      ingredients: [
        IngredientModel(
          name: 'strawberry',
          image: AssetManager.strawberryImage,
          color: Colors.red,
          direction: Offset(0.9, 0.6),
        ),
      ],
    ),
    ProductModel(
      name: 'مربى التين',
      image: AssetManager.jam,
      color: Colors.brown,
      ingredients: [
        IngredientModel(
          name: 'fig',
          image: AssetManager.figImage,
          color: Colors.brown,
          direction: Offset(0.9, 0.6),
        ),
      ],
    ),
    ProductModel(
      name: 'مربى المشمش',
      image: AssetManager.jam,
      color: Colors.orange,
      ingredients: [
        IngredientModel(
          name: 'apricot',
          image: AssetManager.apricotImage,
          color: Colors.orange,
          direction: Offset(0.9, 0.6),
        ),
      ],
    ),
  ];
}
