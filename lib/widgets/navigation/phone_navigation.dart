import 'dart:ui';

import 'package:ae_live/config/constants.dart';
import 'package:ae_live/config/tab_items.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/models/destination_item.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
    if (ResponsiveBreakpoints.of(context)
        .largerOrEqualTo(Constants.screenSizeKeyMedium)) {
      return Row(
        children: [
          Expanded(
            child: _buildNavigationBar(context, true),
          ),
          const SizedBox(
            width: 1.0,
          ),
          const Expanded(
            child: SizedBox(),
          ),
        ],
      );
    }

    return _buildNavigationBar(context, false);
  }

  Widget _buildNavigationBar(
    final BuildContext context,
    final bool isMediumSize,
  ) {
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
          height: isMediumSize ? 64.0 : 56.0,
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
