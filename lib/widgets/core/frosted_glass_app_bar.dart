import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FrostedGlassAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const FrostedGlassAppBar({
    super.key,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.elevation,
    this.scrolledUnderElevation,
    this.notificationPredicate = defaultScrollNotificationPredicate,
    this.shadowColor,
    this.surfaceTintColor = Colors.transparent,
    this.shape,
    this.backgroundColor,
    this.foregroundColor,
    this.iconTheme,
    this.actionsIconTheme,
    this.primary = true,
    this.centerTitle = true,
    this.excludeHeaderSemantics = false,
    this.titleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
    this.toolbarHeight,
    this.leadingWidth,
    this.toolbarTextStyle,
    this.titleTextStyle,
    this.systemOverlayStyle,
    this.forceMaterialTransparency = false,
    this.clipBehavior,
  });

  final Widget? leading;
  final bool automaticallyImplyLeading;
  final Widget? title;
  final List<Widget>? actions;
  final Widget? flexibleSpace;
  final PreferredSizeWidget? bottom;
  final double? elevation;
  final double? scrolledUnderElevation;
  final bool Function(ScrollNotification) notificationPredicate;
  final Color? shadowColor;
  final Color surfaceTintColor;
  final ShapeBorder? shape;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final IconThemeData? iconTheme;
  final IconThemeData? actionsIconTheme;
  final bool primary;
  final bool centerTitle;
  final bool excludeHeaderSemantics;
  final double? titleSpacing;
  final double toolbarOpacity;
  final double bottomOpacity;
  final double? toolbarHeight;
  final double? leadingWidth;
  final TextStyle? toolbarTextStyle;
  final TextStyle? titleTextStyle;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final bool forceMaterialTransparency;
  final Clip? clipBehavior;

  @override
  Widget build(final BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 16.0,
          sigmaY: 16.0,
        ),
        child: AppBar(
          leading: leading,
          automaticallyImplyLeading: automaticallyImplyLeading,
          title: title,
          actions: actions,
          flexibleSpace: flexibleSpace,
          bottom: bottom,
          elevation: elevation,
          scrolledUnderElevation: scrolledUnderElevation,
          notificationPredicate: notificationPredicate,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          shape: shape,
          backgroundColor: backgroundColor ??
              Theme.of(context).colorScheme.background.withAlpha(160),
          foregroundColor: foregroundColor,
          iconTheme: iconTheme,
          actionsIconTheme: actionsIconTheme,
          primary: primary,
          centerTitle: centerTitle,
          excludeHeaderSemantics: excludeHeaderSemantics,
          titleSpacing: titleSpacing,
          toolbarOpacity: toolbarOpacity,
          bottomOpacity: bottomOpacity,
          toolbarHeight: toolbarHeight,
          leadingWidth: leadingWidth,
          toolbarTextStyle: toolbarTextStyle,
          titleTextStyle: titleTextStyle,
          systemOverlayStyle: systemOverlayStyle,
          forceMaterialTransparency: forceMaterialTransparency,
          clipBehavior: clipBehavior,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
