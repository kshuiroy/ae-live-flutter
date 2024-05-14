import 'package:ae_live/config/tab_items.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/models/destination_item.dart';
import 'package:ae_live/widgets/core/app_icon.dart';
import 'package:flutter/material.dart';

class TabletNavigation extends StatelessWidget {
  const TabletNavigation({
    super.key,
    required this.selectedIndex,
    this.onDestinationSelected,
  });

  /// Determines which one of the [destinations] is currently selected.
  final int selectedIndex;

  /// Called when one of the [destinations] is selected.
  ///
  /// The stateful widget that creates the navigation rail needs to keep track
  /// of the index of the selected [NavigationRailDestination] and call setState
  /// to rebuild the navigation rail with the new [selectedIndex].
  final void Function(int index)? onDestinationSelected;

  @override
  Widget build(final BuildContext context) {
    final Translations t = Translations.of(context);

    return NavigationRail(
      selectedIndex: selectedIndex,
      groupAlignment: 0.0,
      labelType: NavigationRailLabelType.all,
      indicatorColor: Colors.transparent,
      useIndicator: true,
      onDestinationSelected: onDestinationSelected,
      leading: const AppIcon(
        width: 40.0,
        height: 40.0,
      ),
      destinations: tabItems
          .map(
            (final DestinationItem item) => NavigationRailDestination(
              icon: Icon(
                item.icon,
                size: 28.0,
                weight: 200.0,
                grade: 0.0,
                opticalSize: 28.0,
              ),
              selectedIcon: Icon(
                item.icon,
                size: 28.0,
                fill: 1.0,
                weight: 200.0,
                grade: 0.0,
                opticalSize: 28.0,
              ),
              label: Text(
                t.main.tabs[item.labelKey]!,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
              ),
            ),
          )
          .toList(),
    );
  }
}
