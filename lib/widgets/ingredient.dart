import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:frutto/models/ingredient_model.dart';

class Ingredient extends StatelessWidget {
  const Ingredient({
    required this.index,
    required this.controller,
    required this.model,
    super.key,
  });

  final int index;
  final AnimationController controller;
  final IngredientModel model;

  @override
  Widget build(BuildContext context) {
    return Icon(
          model.icon,
          color: model.color,
        )
        .animate()
        .fadeIn(delay: 300.ms)
        .move(
          begin: Offset.zero,
          end: Offset(
            model.direction.dx * 180,
            model.direction.dy * 120,
          ),
          curve: Curves.easeOutCubic,
          duration: 800.ms,
        )
        .scale(
          begin: const Offset(0.4, 0.4),
          end: index % 3 == 0
              ? const Offset(0.6, 0.6)
              : index % 4 == 0
              ? const Offset(1.3, 1.3)
              : const Offset(1, 1),
        )
        .rotate(
          begin: -0.3,
          end: 0,
          duration: 800.ms,
        );
  }
}
