import 'dart:ui';

import 'package:ae_live/config/tab_items.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/models/destination_item.dart';
import 'package:flutter/material.dart';

class PhoneNavigation extends StatelessWidget {
  const PhoneNavigation({
    super.key,
    required this.selectedIndex,
    this.onDestinationSelected,
  });

  /// Determines which one of the [destinations] is currently selected.
  final int selectedIndex;

  /// Called when one of the [destinations] is selected.
  ///
  /// This callback usually updates the int passed to [selectedIndex].
  ///
  /// Upon updating [selectedIndex], the [NavigationBar] will be rebuilt.
  final void Function(int index)? onDestinationSelected;

  @override
  Widget build(final BuildContext context) {
    final Translations t = Translations.of(context);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 16.0,
          sigmaY: 16.0,
        ),
        child: NavigationBar(
          backgroundColor: colorScheme.background.withAlpha(160),
          surfaceTintColor: Colors.transparent,
          selectedIndex: selectedIndex,
          onDestinationSelected: onDestinationSelected,
          indicatorColor: Colors.transparent,
          destinations: tabItems
              .map(
                (final DestinationItem item) => NavigationDestination(
                  icon: Icon(
                    item.icon,
                    weight: 200.0,
                    grade: 0.0,
                    opticalSize: 24.0,
                  ),
                  selectedIcon: Icon(
                    item.icon,
                    fill: 1.0,
                    weight: 200.0,
                    grade: 0.0,
                    opticalSize: 24.0,
                  ),
                  label: t.main.tabs[item.labelKey]!,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
