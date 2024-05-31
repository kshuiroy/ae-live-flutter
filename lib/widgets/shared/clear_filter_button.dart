import 'package:ae_live/i18n/translations.g.dart';
import 'package:flutter/material.dart';

class ClearFilterButton extends StatelessWidget {
  const ClearFilterButton({
    super.key,
    this.label,
    this.onPressed,
  });

  final String? label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final Translations t = Translations.of(context);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(
          colorScheme.error,
        ),
        overlayColor: WidgetStatePropertyAll(
          colorScheme.errorContainer.withAlpha(80),
        ),
      ),
      child: Text(label ?? t.shared.filter.actions.clear),
    );
  }
}
