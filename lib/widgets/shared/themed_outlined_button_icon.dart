import 'dart:math';

import 'package:flutter/material.dart';

class ThemedOutlinedButtonIcon extends StatelessWidget {
  const ThemedOutlinedButtonIcon({
    super.key,
    this.onPressed,
    this.onLongPress,
    this.style,
    this.focusNode,
    this.autofocus,
    this.clipBehavior,
    this.statesController,
    this.icon,
    required this.label,
    this.iconAlignment = IconAlignment.start,
  });

  final void Function()? onPressed;
  final void Function()? onLongPress;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool? autofocus;
  final Clip? clipBehavior;
  final WidgetStatesController? statesController;
  final Widget? icon;
  final Widget label;
  final IconAlignment iconAlignment;

  @override
  Widget build(BuildContext context) {
    final Size accessibilityButtonSize = Size.fromHeight(
      min(MediaQuery.textScalerOf(context).scale(40.0), 56.0),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 2.0,
      ),
      child: OutlinedButton.icon(
        key: key,
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: style != null
            ? style!.copyWith(
                minimumSize: WidgetStatePropertyAll(accessibilityButtonSize),
              )
            : OutlinedButton.styleFrom(
                minimumSize: accessibilityButtonSize,
              ),
        focusNode: focusNode,
        autofocus: autofocus,
        clipBehavior: clipBehavior,
        statesController: statesController,
        icon: icon,
        label: label,
        iconAlignment: iconAlignment,
      ),
    );
  }
}
