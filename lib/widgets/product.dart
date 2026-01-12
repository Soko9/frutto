import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frutto/common/extensions.dart';
import 'package:frutto/models/product_model.dart';

class Product extends StatelessWidget {
  const Product({
    required this.controller,
    required this.model,
    super.key,
  });

  final AnimationController controller;
  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
          spacing: 12,
          mainAxisSize: .min,
          children: [
            SvgPicture.asset(
              model.image,
              width: 270,
              height: 415,
              colorFilter: ColorFilter.mode(
                model.color,
                BlendMode.srcATop,
              ),
            ),
            Text(
              model.name,
              style: context.textTheme.displayLarge,
            ),
          ],
        )
        .animate(controller: controller)
        .scale(
          begin: const Offset(0.3, 0.3),
          end: const Offset(1, 1),
          duration: 300.ms,
          curve: Curves.easeOutBack,
        )
        .move(
          begin: const Offset(0, -40),
          end: Offset.zero,
          delay: 300.ms,
          duration: 250.ms,
        );
  }
}
