import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:frutto/common/extensions.dart';
import 'package:frutto/widgets/ingredient.dart';
import 'package:frutto/widgets/product.dart';

class Show extends StatelessWidget {
  const Show({
    required this.product,
    super.key,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    const minSize = 0.5;
    const maxSize = 2.5;
    const minAngle = -math.pi / 3;
    const maxAngle = math.pi / 3;
    final minDistance = (-product.width * 1.75, -product.height * 0.25);
    final maxDistance = (product.width * 1.75, 0.0);
    const maxCount = 6;

    final count = product.ingredients.length >= 4
        ? product.ingredients.length
        : maxCount;

    return Container(
      width: context.sw,
      height: context.sh,
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.passthrough,
        children: [
          Product(model: product),
          for (int i = 0; i < count; i++)
            Transform.translate(
              offset: Offset(
                _getRandomValue(minDistance.$1, maxDistance.$1),
                _getRandomValue(minDistance.$2, maxDistance.$2),
              ),
              child: Transform.rotate(
                angle: _getRandomValue(minAngle, maxAngle),
                child: Transform.scale(
                  scale: _getRandomValue(minSize, maxSize),
                  child: Ingredient(
                    model: count == maxCount
                        ? product.ingredients[i % 3]
                        : product.ingredients[i],
                  ),
                ),
              ),
            ),
          for (int i = 0; i < count; i++)
            Transform.translate(
              offset: Offset(
                _getRandomValue(minDistance.$1, maxDistance.$1),
                _getRandomValue(minDistance.$2, maxDistance.$2),
              ),
              child: Transform.rotate(
                angle: _getRandomValue(minAngle, maxAngle),
                child: Transform.scale(
                  scale: _getRandomValue(minSize, maxSize),
                  child: Ingredient(
                    model: count == maxCount
                        ? product.ingredients[i % 3]
                        : product.ingredients[i],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  double _getRandomValue(double min, double max) {
    return min + (math.Random().nextDouble() * (max - min));
  }
}
