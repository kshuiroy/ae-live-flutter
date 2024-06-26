import 'package:ae_live/widgets/shared/themed_icon.dart';
import 'package:flutter/material.dart';

class FilterSortButton extends StatelessWidget {
  const FilterSortButton({
    super.key,
    required this.icon,
    required this.label,
    this.enabled = true,
    this.isHighlighted = false,
    this.onPressed,
  });

  final IconData icon;
  final String label;
  final bool enabled;
  final bool isHighlighted;
  final void Function()? onPressed;

  @override
  Widget build(final BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return TextButton.icon(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(
          isHighlighted
              ? colorScheme.onTertiaryContainer
              : colorScheme.onSurface,
        ),
        backgroundColor: isHighlighted
            ? WidgetStatePropertyAll(
                colorScheme.tertiaryContainer,
              )
            : null,
      ),
      onPressed: enabled ? onPressed : null,
      icon: ThemedIcon(
        icon,
      ),
      label: Text(label),
    );
  }
}
