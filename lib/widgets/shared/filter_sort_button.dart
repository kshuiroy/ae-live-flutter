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
      icon: Icon(
        icon,
        fill: 0.0,
        weight: 200.0,
        opticalSize: 24.0,
      ),
      label: Text(label),
    );
  }
}