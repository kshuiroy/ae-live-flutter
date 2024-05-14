import 'dart:math';

import 'package:flutter/material.dart';

class ResponsiveDialog extends StatelessWidget {
  const ResponsiveDialog({
    super.key,
    this.maxWidth = 560.0,
    this.backgroundColor,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.insetAnimationDuration = const Duration(milliseconds: 100),
    this.insetAnimationCurve = Curves.decelerate,
    this.clipBehavior = Clip.none,
    this.shape,
    this.alignment,
    this.child,
  });

  final double maxWidth;
  final Color? backgroundColor;
  final double? elevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final Duration insetAnimationDuration;
  final Curve insetAnimationCurve;
  final Clip clipBehavior;
  final ShapeBorder? shape;
  final AlignmentGeometry? alignment;
  final Widget? child;

  @override
  Widget build(final BuildContext context) {
    final double dialogPaddingX =
        max((MediaQuery.of(context).size.width - maxWidth) / 2.0, 40.0);

    return Dialog(
      // key: key,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      insetAnimationDuration: insetAnimationDuration,
      insetAnimationCurve: insetAnimationCurve,
      insetPadding: EdgeInsets.symmetric(
        horizontal: dialogPaddingX,
        vertical: 24.0,
      ),
      clipBehavior: clipBehavior,
      shape: shape,
      alignment: alignment,
      child: child,
    );
  }
}
