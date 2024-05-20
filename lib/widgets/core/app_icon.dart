import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.matchTextDirection = false,
    this.allowDrawingOutsideViewBox = false,
    this.placeholderBuilder,
    this.colorFilter,
    this.semanticsLabel,
    this.excludeFromSemantics = false,
    this.clipBehavior = Clip.hardEdge,
    this.theme,
  });

  final double? width;
  final double? height;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final bool matchTextDirection;
  final bool allowDrawingOutsideViewBox;
  final Widget Function(BuildContext)? placeholderBuilder;
  final ColorFilter? colorFilter;
  final String? semanticsLabel;
  final bool excludeFromSemantics;
  final Clip clipBehavior;
  final SvgTheme? theme;

  @override
  Widget build(BuildContext context) {
    final String iconColor =
        '#${Theme.of(context).colorScheme.onBackground.value.toRadixString(16).substring(2)}';

    final String rawSvg =
        '''<svg xmlns="http://www.w3.org/2000/svg" xml:space="preserve" fill-rule="evenodd" stroke-linejoin="round" stroke-miterlimit="2" clip-rule="evenodd" viewBox="0 0 150 112"><path fill="$iconColor" d="M58.042 107.007v-24c0-2.208 1.792-4 4-4s4 1.792 4 4v24h20v-94c0-6.623-5.377-12-12-12h-24c-6.623 0-12 5.377-12 12v94h20Zm-4.167-4.167H42.209V13.007a7.837 7.837 0 0 1 7.833-7.833h24a7.837 7.837 0 0 1 7.833 7.833v89.833H70.209V83.007a8.171 8.171 0 0 0-8.167-8.167 8.171 8.171 0 0 0-8.167 8.167v19.833Z"/><path fill="$iconColor" d="M29.041 42.493c0-1.932-1.568-3.5-3.5-3.5h-7a3.501 3.501 0 0 0-3.5 3.5v7c0 1.932 1.569 3.5 3.5 3.5h7c1.932 0 3.5-1.568 3.5-3.5v-7Zm-9.832.666v5.667h5.666v-5.667h-5.666Z"/><path fill="$iconColor" d="M29.041 62.543c0-1.932-1.568-3.5-3.5-3.5h-7a3.501 3.501 0 0 0-3.5 3.5v6.999c0 1.932 1.569 3.5 3.5 3.5h7c1.932 0 3.5-1.568 3.5-3.5v-7Zm-9.832.665v5.667h5.666v-5.667h-5.666Z"/><path fill="$iconColor" d="M120.041 54.993c15.455 0 28 12.546 28 28s-12.545 28-28 28c-15.453 0-28-12.546-28-28s12.547-28 28-28Zm0 4.167c13.155 0 23.834 10.679 23.834 23.833 0 13.154-10.679 23.833-23.834 23.833-13.153 0-23.832-10.679-23.832-23.833 0-13.154 10.679-23.833 23.832-23.833ZM98.98 107.076H16.042c-7.778 0-14.083-6.305-14.083-14.083v-56c0-7.778 6.305-14.083 14.083-14.083h24v4.166h-24c-5.477 0-9.917 4.44-9.917 9.917v56c0 5.477 4.44 9.917 9.917 9.917h78.96a32.174 32.174 0 0 0 3.978 4.166Zm18.979-56.016V36.993c0-5.477-4.44-9.917-9.917-9.917h-24V22.91h24c7.778 0 14.083 6.305 14.083 14.083V51.06a31.97 31.97 0 0 0-4.166 0Z"/><path fill="$iconColor" d="M117.958 66.993v16c0 1.15.934 2.084 2.083 2.084 1.15 0 2.084-.934 2.084-2.084v-16a2.085 2.085 0 0 0-4.167 0Z"/><path fill="$iconColor" d="m119 84.798 13.856 8a2.085 2.085 0 0 0 2.846-.763 2.085 2.085 0 0 0-.762-2.846l-13.856-8a2.085 2.085 0 0 0-2.847.763 2.085 2.085 0 0 0 .763 2.846ZM52.11 27.062h19.863a2.07 2.07 0 0 0 0-4.138H52.111a2.07 2.07 0 0 0 0 4.138Z"/><path fill="$iconColor" d="M59.973 15.062v19.862a2.07 2.07 0 0 0 2.068 2.07 2.07 2.07 0 0 0 2.07-2.07V15.062a2.07 2.07 0 0 0-4.138 0Z"/></svg>''';

    return SvgPicture.string(
      rawSvg,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      matchTextDirection: matchTextDirection,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      colorFilter: colorFilter,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      theme: theme,
    );
  }
}
