import 'dart:ui';

import 'package:ae_live/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_framework/responsive_framework.dart';

class FrostedGlassSearchHeader extends StatefulWidget {
  const FrostedGlassSearchHeader({
    super.key,
    required this.child,
    this.padding,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  State<FrostedGlassSearchHeader> createState() =>
      _FrostedGlassSearchHeaderState();
}

class _FrostedGlassSearchHeaderState extends State<FrostedGlassSearchHeader>
    with TickerProviderStateMixin {
  @override
  Widget build(final BuildContext context) {
    return SliverPersistentHeader(
      floating: true,
      pinned: true,
      delegate: _FrostedGlassSearchHeaderDelegate(
        safeAreaTopSize: MediaQuery.of(context).padding.top,
        child: widget.child,
        vsync: this,
        padding: widget.padding,
      ),
    );
  }
}

class _FrostedGlassSearchHeaderDelegate extends SliverPersistentHeaderDelegate {
  _FrostedGlassSearchHeaderDelegate({
    required this.safeAreaTopSize,
    required this.child,
    required this.vsync,
    this.padding,
  }) : super();
  final double safeAreaTopSize;
  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  final TickerProvider vsync;

  @override
  Widget build(
    final BuildContext context,
    final double shrinkOffset,
    final bool overlapsContent,
  ) {
    final bool isCompactSize = ResponsiveBreakpoints.of(context)
        .smallerOrEqualTo(Constants.screenSizeKeyCompact);

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 16.0,
          sigmaY: 16.0,
        ),
        child: Container(
          padding: EdgeInsets.only(
            top: safeAreaTopSize,
          ),
          height: maxExtent,
          color: Theme.of(context).colorScheme.background.withAlpha(160),
          child: Stack(
            children: <Widget>[
              Positioned(
                right: 0.0,
                bottom: 0.0,
                left: 0.0,
                child: Padding(
                  padding: padding ??
                      EdgeInsets.only(
                        top: 8.0,
                        right: isCompactSize ? 16.0 : 24.0,
                        bottom: 8.0,
                        left: isCompactSize ? 16.0 : 24.0,
                      ),
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => safeAreaTopSize + 128.0;

  @override
  double get minExtent => safeAreaTopSize;

  @override
  bool shouldRebuild(final _FrostedGlassSearchHeaderDelegate oldDelegate) {
    return minExtent != oldDelegate.minExtent ||
        maxExtent != oldDelegate.maxExtent ||
        safeAreaTopSize != oldDelegate.safeAreaTopSize ||
        child != oldDelegate.child;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration =>
      FloatingHeaderSnapConfiguration(
        duration: const Duration(milliseconds: 150),
      );
}
