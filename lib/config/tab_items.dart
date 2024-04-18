import 'package:ae_live/models/destination_item.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

final List<DestinationItem> tabItems = [
  DestinationItem(
    labelKey: 'home',
    icon: Symbols.home_rounded,
    path: '/',
  ),
  DestinationItem(
    labelKey: 'lists',
    icon: Symbols.browse_rounded,
    path: '/lists',
  ),
  DestinationItem(
    labelKey: 'settings',
    icon: Symbols.settings_rounded,
    path: '/settings',
  ),
];
