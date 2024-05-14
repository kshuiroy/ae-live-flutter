import 'dart:math';

import 'package:flutter/material.dart';

class ResponsiveAlertDialog extends StatelessWidget {
  const ResponsiveAlertDialog({
    super.key,
    this.maxWidth = 560.0,
    this.icon,
    this.iconPadding,
    this.iconColor,
    this.title,
    this.titlePadding,
    this.titleTextStyle,
    this.content,
    this.contentPadding,
    this.contentTextStyle,
    this.actions,
    this.actionsPadding,
    this.actionsAlignment,
    this.actionsOverflowAlignment,
    this.actionsOverflowDirection,
    this.actionsOverflowButtonSpacing,
    this.buttonPadding,
    this.backgroundColor,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.semanticLabel,
    this.clipBehavior = Clip.none,
    this.shape,
    this.alignment,
    this.scrollable = false,
  });

  final double maxWidth;
  final Widget? icon;
  final EdgeInsetsGeometry? iconPadding;
  final Color? iconColor;
  final Widget? title;
  final EdgeInsetsGeometry? titlePadding;
  final TextStyle? titleTextStyle;
  final Widget? content;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? contentTextStyle;
  final List<Widget>? actions;
  final EdgeInsetsGeometry? actionsPadding;
  final MainAxisAlignment? actionsAlignment;
  final OverflowBarAlignment? actionsOverflowAlignment;
  final VerticalDirection? actionsOverflowDirection;
  final double? actionsOverflowButtonSpacing;
  final EdgeInsetsGeometry? buttonPadding;
  final Color? backgroundColor;
  final double? elevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final String? semanticLabel;
  final Clip clipBehavior;
  final ShapeBorder? shape;
  final AlignmentGeometry? alignment;
  final bool scrollable;

  @override
  Widget build(final BuildContext context) {
    final double dialogPaddingX =
        max((MediaQuery.of(context).size.width - maxWidth) / 2, 40.0);

    return AlertDialog(
      icon: icon,
      iconPadding: iconPadding,
      iconColor: iconColor,
      title: title,
      titlePadding: titlePadding,
      titleTextStyle: titleTextStyle,
      content: content,
      contentPadding: contentPadding,
      contentTextStyle:
          contentTextStyle ?? Theme.of(context).textTheme.bodyLarge,
      actions: actions,
      actionsPadding: actionsPadding,
      actionsAlignment: actionsAlignment,
      actionsOverflowAlignment: actionsOverflowAlignment,
      actionsOverflowDirection: actionsOverflowDirection,
      actionsOverflowButtonSpacing: actionsOverflowButtonSpacing,
      buttonPadding: buttonPadding,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      semanticLabel: semanticLabel,
      insetPadding: EdgeInsets.symmetric(
        horizontal: dialogPaddingX,
        vertical: 24.0,
      ),
      clipBehavior: clipBehavior,
      shape: shape,
      alignment: alignment,
      scrollable: scrollable,
    );
  }
}
