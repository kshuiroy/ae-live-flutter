import 'package:flutter/material.dart';

class ThemedIcon extends StatelessWidget {
  const ThemedIcon(
    this.icon, {
    super.key,
    this.size = 24.0,
    this.fill = 0.0,
    this.weight = 200.0,
    this.grade,
    this.opticalSize = 24.0,
    this.color,
    this.shadows,
    this.semanticLabel,
    this.textDirection,
    this.applyTextScaling,
  });

  final IconData icon;
  final double? size;
  final double? fill;
  final double? weight;
  final double? grade;
  final double? opticalSize;
  final Color? color;
  final List<Shadow>? shadows;
  final String? semanticLabel;
  final TextDirection? textDirection;
  final bool? applyTextScaling;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size != null ? MediaQuery.textScalerOf(context).scale(size!) : null,
      fill: fill,
      weight: weight,
      grade: grade,
      opticalSize: opticalSize,
      color: color,
      shadows: shadows,
      semanticLabel: semanticLabel,
      textDirection: textDirection,
      applyTextScaling: applyTextScaling,
    );
  }
}
