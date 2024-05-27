import 'package:ae_live/config/constants.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SharedAxisTransitionPageWrapper extends Page {
  const SharedAxisTransitionPageWrapper({
    required this.screen,
    required this.transitionKey,
  }) : super(key: transitionKey);

  final Widget screen;
  final ValueKey transitionKey;

  @override
  Route createRoute(final BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SharedAxisTransition(
          fillColor: Theme.of(context).scaffoldBackgroundColor,
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: ResponsiveBreakpoints.of(context)
                  .largerOrEqualTo(Constants.screenSizeKeyExpanded)
              ? SharedAxisTransitionType.vertical
              : SharedAxisTransitionType.horizontal,
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return screen;
      },
    );
  }
}
