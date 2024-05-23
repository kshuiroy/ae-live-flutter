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
        '#${Theme.of(context).colorScheme.onSurface.value.toRadixString(16).substring(2)}';

    final String rawSvg =
        '''<svg xmlns="http://www.w3.org/2000/svg" xml:space="preserve" fill-rule="evenodd" stroke-linejoin="round" stroke-miterlimit="2" clip-rule="evenodd" viewBox="0 0 150 112"><path fill="$iconColor" d="M120.042 54.993c15.453 0 28 12.546 28 28s-12.547 28-28 28c-15.454 0-28-12.546-28-28s12.546-28 28-28Zm-82-32.083v-9.903c0-6.623 5.377-12 12-12h24c6.623 0 12 5.377 12 12v9.903h22c7.778 0 14.083 6.305 14.083 14.083V51.06a31.992 31.992 0 0 0-4.167 0V36.993c0-5.477-4.44-9.917-9.916-9.917h-22v75.834h8.959a32.306 32.306 0 0 0 3.978 4.166H16.042c-7.778 0-14.084-6.305-14.084-14.083v-56c0-7.778 6.306-14.083 14.084-14.083h22Zm82 36.25c13.154 0 23.833 10.679 23.833 23.833 0 13.154-10.679 23.833-23.833 23.833-13.154 0-23.834-10.679-23.834-23.833 0-13.154 10.68-23.833 23.834-23.833Zm-82-32.084v75.834h-22c-5.477 0-9.917-4.44-9.917-9.917v-56c0-5.477 4.44-9.917 9.917-9.917h22Zm28 75.834V83.007c0-2.208-1.793-4-4-4-2.208 0-4 1.792-4 4v19.903h8Zm-12.167-.07H42.208V13.007a7.837 7.837 0 0 1 7.834-7.833h24a7.837 7.837 0 0 1 7.833 7.833v89.833H70.208V83.007c0-4.507-3.659-8.167-8.166-8.167a8.17 8.17 0 0 0-8.167 8.167v19.833Zm64.083-19.859v.035a2.087 2.087 0 0 0 1.022 1.77l.03.017 13.846 7.994a2.084 2.084 0 0 0 2.084-3.608l-12.815-7.399V66.993a2.084 2.084 0 0 0-4.167 0v15.988ZM29.042 62.542c0-1.931-1.569-3.5-3.5-3.5h-7a3.502 3.502 0 0 0-3.5 3.5v7c0 1.932 1.568 3.5 3.5 3.5h7c1.931 0 3.5-1.568 3.5-3.5v-7Zm-9.834.667v5.667h5.667v-5.667h-5.667Zm9.834-20.716c0-1.932-1.569-3.5-3.5-3.5h-7a3.501 3.501 0 0 0-3.5 3.5v7c0 1.932 1.568 3.5 3.5 3.5h7c1.931 0 3.5-1.568 3.5-3.5v-7Zm-9.834.667v5.666h5.667V43.16h-5.667Zm40.765-20.236h-7.862a2.07 2.07 0 0 0 0 4.138h7.862v7.862a2.07 2.07 0 0 0 4.138 0v-7.862h7.862a2.07 2.07 0 0 0 0-4.138h-7.862v-7.862a2.07 2.07 0 0 0-4.138 0v7.862Z"/></svg>''';

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
