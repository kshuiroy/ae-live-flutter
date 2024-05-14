import 'package:flutter/material.dart';

class FilterSortButton extends StatelessWidget {
  const FilterSortButton({
    super.key,
    required this.icon,
    required this.label,
    this.enabled = true,
    this.onPressed,
  });

  final IconData icon;
  final String label;
  final bool enabled;
  final void Function()? onPressed;

  @override
  Widget build(final BuildContext context) {
    return TextButton.icon(
      style: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(
          Theme.of(context).colorScheme.onBackground,
        ),
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
