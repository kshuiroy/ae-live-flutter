import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoSearchResult extends StatelessWidget {
  const NoSearchResult({
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
  Widget build(final BuildContext context) {
    final String primaryColor =
        '#${Theme.of(context).colorScheme.primary.value.toRadixString(16).substring(2)}';

    final String rawSvg =
        '''<svg xmlns="http://www.w3.org/2000/svg" width="412.23999" height="608.19" viewBox="0 0 412.23999 608.19" xmlns:xlink="http://www.w3.org/1999/xlink"><path d="m360.29999,608.19h-193.12c-28.64,0-51.94-23.29999-51.94-51.94V51.94c0-28.64,23.3-51.94,51.94-51.94h193.12c28.64001,0,51.94,23.3,51.94,51.94v504.31c0,28.64001-23.29999,51.94-51.94,51.94ZM167.17999,2c-27.54001,0-49.94,22.4-49.94,49.94v504.31c0,27.53998,22.39999,49.94,49.94,49.94h193.12c27.54001,0,49.94-22.40002,49.94-49.94V51.94c0-27.54-22.39999-49.94-49.94-49.94h-193.12Z" fill="#dedfe0"/><path d="m291.09,47.36h-54.69c-7.22,0-13.09-5.87-13.09-13.09s5.87-13.09,13.09-13.09h54.69c7.22,0,13.09,5.87,13.09,13.09s-5.87,13.09-13.09,13.09Z" fill="#dadbdc"/><path d="m215.08,607.14001c0,.53998-.44.97998-.98.97998H.98c-.54,0-.98-.44-.98-.97998s.44-.97998.98-.97998h213.11999c.53999,0,.98.44.98.97998h.00002Z" fill="#3f3d58"/><polygon points="119.16 304.10999 138.81 310.57001 138.81 282.29001 120.98 282.29001 119.16 304.10999" fill="#f6aaae"/><circle cx="136.37" cy="270.54" r="19.58" fill="#f6aaae"/><path d="m131.39,272.07001l2.7,3.28,4.88-8.54001s6.23.32001,6.23-4.29999,5.72-4.75,5.72-4.75c0,0,8.09-14.13-8.67-10.41,0,0-11.63-7.97-17.41-1.16,0,0-17.73,8.92999-12.66,24.48001l8.43,16.01999,1.91-3.63s-1.16-15.23001,8.87-10.98999Z" fill="#2f2e43"/><rect x="113.75" y="572.09003" width="15.82001" height="22.44" fill="#f6aaae"/><path d="m127.83,607.39001c-2.71.25-16.24,1.31-16.92-1.78998-.62-2.84998.29-5.83002.42-6.22998,1.3-12.94,1.78-13.09003,2.07-13.17999.46-.13,1.81.5,3.99,1.90997l.14.09003.03.15997c.04.20001,1.01,4.95001,5.59,4.22998,3.14-.5,4.16-1.19,4.49-1.53003-.27-.12-.6-.33002-.83-.70001-.34-.53003-.4-1.21002-.18-2.02002.59-2.15002,2.36-5.33002,2.42999-5.46002l.2-.35999,17.98,12.13,11.10001,3.16998c.84.23999,1.50999.84003,1.85001,1.64001h0c.47,1.12.17999,2.41998-.72,3.22998-2.02,1.81-6.02,4.91998-10.23,5.29999-1.12.09998-2.60001.14001-4.25999.14001-6.95,0-17.08-.71997-17.16-.72998h.01v.00006Z" fill="#2f2e43"/><rect x="67.9498" y="544.16751" width="22.44" height="15.82001" transform="translate(-396.67796 261.17144) rotate(-50.4)" fill="#f6aaae"/><path d="m68.59,574.58002c-2.24-1.53998-13.35-9.34003-11.9-12.15997,1.34-2.59003,3.94-4.29999,4.3-4.53003,9.25-9.14001,9.72-8.95001,10-8.83002.44.19,1.07,1.53998,1.86,4.01001l.05.15002-.08.14001c-.1.17999-2.38,4.46002,1.61,6.82001,2.74,1.62,3.97,1.72998,4.43,1.67999-.13-.26001-.25-.64001-.2-1.07001.07-.62.46-1.19,1.16-1.66998,1.83-1.28003,5.21-2.59998,5.36-2.65997l.38-.15002,6.12,20.81,6.53,9.52002c.49.71997.63,1.60999.38,2.45001h0c-.35,1.15997-1.4,1.97998-2.62,2.03003-2.71.10999-7.77-.04999-11.26-2.44-.92-.63-2.09-1.53998-3.37-2.59998-5.35-4.42999-12.7-11.44-12.76-11.5h.01v-.00012Z" fill="#2f2e43"/><path d="m155.74001,399.01999h-54.25999l12.06,179.36002h18.09l24.12-179.35999h0l-.00999-.00003Z" fill="#2f2e43"/><polygon points="144.69 408.89999 155.74001 399.01999 150.21001 497.66 88.41 556.44 73.01 543.71002 109.01 496.98999 144.69 408.89999" fill="#2f2e43"/><path d="m144.69,293.51001l-26.8-4.35001-8.32,14.54999c-10.58,18.5-14.89,39.92001-12.3,61.07001l4.21,34.25h54.25999l-11.05-105.51001h0l.00002-.00998Z" fill="#dadbdc"/><path id="uuid-a048c2b9-908a-4c55-bce2-85345ea0567b-382" d="m122.93,431.31c1.11,5.53-.96,10.57999-4.61,11.28-3.66.69-7.52-3.23001-8.63-8.76999-.47-2.20999-.39-4.48999.24-6.66l-4.4-23.51001,11.5-1.79001,3.11,23.37c1.42,1.79001,2.38,3.87,2.79,6.09h0v-.00998Z" fill="#f6aaae"/><path d="m108.94,424.94l-16.89-52.17999v-.07999l6.38-53.73001c.98-8.23001,7.96-14.42999,16.24-14.42999,5.07,0,9.77,2.29001,12.89,6.29001s4.21001,9.10999,2.98,14.04001l-11.27,45.07001,2.69,51.14999-13.03,3.87h.01v-.00003Z" fill="#dadbdc"/><path d="m205.57001,310.29001c4.69,25.04999,28.8,41.56,53.85999,36.86002,7.57999-1.42001,14.38-4.62,20.04001-9.09h0l57,61.48001c3.48999,3.76001,9.44,3.75,12.92001-.03h0c3.25-3.53,3.07001-9.01001-.41-12.32001l-60.89999-58.04001c7.32001-9.94,10.66-22.76999,8.20999-35.85999-4.69-25.04999-28.79999-41.56-53.86-36.85999s-41.56,28.79999-36.86,53.85999h0v-.00003Zm9.84-1.84c-3.67-19.62,9.25-38.5,28.87-42.16998,19.62-3.67001,38.5,9.25,42.17001,28.87s-9.25,38.5-28.87,42.16998-38.5-9.25-42.17-28.87h-.00002Z" fill="$primaryColor"/></svg>''';

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
