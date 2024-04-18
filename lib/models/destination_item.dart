import 'package:flutter/material.dart';

class DestinationItem {
  DestinationItem({
    required this.labelKey,
    required this.icon,
    required this.path,
  });

  /// The key name in the translation file.
  final String labelKey;

  /// Icon of the item.
  final IconData icon;

  /// Destination path of the screen when the item is clicked.
  final String path;
}
