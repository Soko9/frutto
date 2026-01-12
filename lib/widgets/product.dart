import 'package:flutter/material.dart';
import 'package:frutto/common/extensions.dart';
import 'package:frutto/widgets/ingredient.dart';

class ProductModel {
  const ProductModel({
    required this.name,
    required this.color,
    required this.ingredients,
    required this.width,
    required this.height,
  });

  final String name;
  final Color color;
  final List<IngredientModel> ingredients;
  final double width;
  final double height;
}

class Product extends StatelessWidget {
  const Product({
    required this.model,
    super.key,
  });

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      mainAxisSize: .min,
      children: [
        Container(
          height: model.height, //context.sh * 0.7
          width: model.width, //context.sw * 0.25,
          color: model.color,
        ),
        Text(
          model.name,
          style: context.textTheme.displayLarge,
        ),
      ],
    );
  }
}
