import 'package:ae_live/i18n/translations.g.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WaitTimeDataRemarks extends StatelessWidget {
  const WaitTimeDataRemarks({super.key});

  @override
  Widget build(BuildContext context) {
    final Translations t = Translations.of(context);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    final TextStyle urlTextStyle = TextStyle(
      color: colorScheme.primary,
      decoration: TextDecoration.underline,
      decorationColor: colorScheme.primary,
      decorationThickness: 2.0,
      // fontWeight: FontWeight.bold,
    );

    return Text.rich(
      t.main.dataRemarks.content(
        tapPCD: (final String text) => TextSpan(
          text: text,
          style: urlTextStyle,
          recognizer: TapGestureRecognizer()
            ..onTap = () async {
              await launchUrl(
                Uri.parse(t.main.dataRemarks.pcdUrl),
                mode: LaunchMode.inAppBrowserView,
              );
            },
        ),
        tapHKD: (final String text) => TextSpan(
          text: text,
          style: urlTextStyle,
          recognizer: TapGestureRecognizer()
            ..onTap = () async {
              await launchUrl(
                Uri.parse(t.main.dataRemarks.hkdUrl),
                mode: LaunchMode.inAppBrowserView,
              );
            },
        ),
      ),
      style: textTheme.bodyMedium?.copyWith(
        color: textTheme.bodyMedium?.color?.withAlpha(160),
      ),
    );
  }
}
