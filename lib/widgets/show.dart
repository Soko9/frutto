import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:frutto/common/constants.dart';
import 'package:frutto/models/product_model.dart';
import 'package:frutto/widgets/ingredient.dart';
import 'package:frutto/widgets/product.dart';

class Show extends StatefulWidget {
  const Show({
    required this.isActive,
    required this.product,
    super.key,
  });

  final bool isActive;
  final ProductModel product;

  @override
  State<Show> createState() => _ShowState();
}

class _ShowState extends State<Show> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void didUpdateWidget(covariant Show oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isActive && !oldWidget.isActive) {
      unawaited(_controller.forward(from: 0));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ingredientsLength =
        widget.product.ingredients.length <= Constants.kIngredientsLength ~/ 2
        ? Constants.kIngredientsLength
        : widget.product.ingredients.length;

    return ColoredBox(
      color: widget.product.color.withValues(alpha: 0.25),
      child: Stack(
        alignment: Alignment.center,
        children: [
          for (int i = 0; i < ingredientsLength; i++)
            Positioned(
              child: Ingredient(
                index: i,
                controller: _controller,
                model: widget
                    .product
                    .ingredients[i % widget.product.ingredients.length]
                    .copyWith(
                      direction: jitter(
                        Constants.kDirections[i],
                      ),
                    ),
              ),
            ),
          Product(
            model: widget.product,
            controller: _controller,
          ),
        ],
      ),
    );
  }

  Offset jitter(Offset base) {
    final rand = math.Random();
    return base +
        Offset(
          (rand.nextDouble() - 0.5) * 0.15,
          (rand.nextDouble() - 0.5) * 0.15,
        );
  }
}
