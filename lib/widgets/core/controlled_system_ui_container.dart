import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ControlledSystemUIContainer extends StatelessWidget {
  const ControlledSystemUIContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        // Android system bar settings
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark,

        // iOS system bar settings
        statusBarBrightness: Theme.of(context).brightness,
      ),
      child: child,
    );
  }
}
