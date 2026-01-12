import 'package:flutter/material.dart';
import 'package:frutto/common/extensions.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    required this.next,
    required this.prev,
    required this.length,
    required this.currentActiveIndex,
    super.key,
  });

  final VoidCallback next;
  final VoidCallback prev;
  final int length;
  final int currentActiveIndex;

  @override
  Widget build(BuildContext context) {
    final style = IconButton.styleFrom(
      backgroundColor: Colors.transparent,
      foregroundColor: context.colorScheme.primary,
      iconSize: 32,
    );

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        spacing: 8,
        mainAxisSize: .min,
        mainAxisAlignment: .center,
        children: [
          IconButton(
            onPressed: prev,
            style: style,
            icon: const RotatedBox(
              quarterTurns: 2,
              child: Icon(
                Icons.arrow_right_alt_rounded,
              ),
            ),
          ),
          Row(
            spacing: 8,
            mainAxisSize: .min,
            mainAxisAlignment: .center,
            children: List.generate(
              length,
              (i) => _IndicatorShape(
                isActive: i == currentActiveIndex,
              ),
            ),
          ),
          IconButton(
            onPressed: next,
            style: style,
            icon: const Icon(
              Icons.arrow_right_alt_rounded,
            ),
          ),
        ],
      ),
    );
  }
}

class _IndicatorShape extends StatelessWidget {
  const _IndicatorShape({required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 1,
      decoration: BoxDecoration(
        color: isActive
            ? context.colorScheme.primary
            : context.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
