import 'package:ae_live/i18n/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class WaitTimeNoticeItem extends StatelessWidget {
  const WaitTimeNoticeItem({super.key});

  @override
  Widget build(BuildContext context) {
    final Translations t = Translations.of(context);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: Row(
        children: <Widget>[
          Icon(
            Symbols.info_rounded,
            color: colorScheme.error,
            size: 24.0,
            fill: 0.0,
            weight: 200.0,
            opticalSize: 24.0,
          ),
          const SizedBox(
            width: 16.0,
          ),
          Expanded(
            child: Text(
              t.home.badgeText,
              style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.error,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
