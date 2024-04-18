import 'package:ae_live/config/tab_items.dart';
import 'package:ae_live/i18n/translations.g.dart';
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
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: tabItems
          .map(
            (item) => NavigationDestination(
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
    );
  }
}
