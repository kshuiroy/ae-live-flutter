import 'dart:math';

import 'package:flutter/material.dart';

class ThemedTextButtonIcon extends StatelessWidget {
  const ThemedTextButtonIcon({
    super.key,
    this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
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
  final void Function(bool)? onHover;
  final void Function(bool)? onFocusChange;
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
    final Size accessibilityButtonSize = Size(
      88.0,
      min(MediaQuery.textScalerOf(context).scale(40.0), 56.0),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 2.0,
      ),
      child: TextButton.icon(
        key: key,
        onPressed: onPressed,
        onLongPress: onLongPress,
        onHover: onHover,
        onFocusChange: onFocusChange,
        // style: style,
        style: style != null
            ? style!.copyWith(
                minimumSize: WidgetStatePropertyAll(accessibilityButtonSize),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              )
            : TextButton.styleFrom(
                minimumSize: accessibilityButtonSize,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
