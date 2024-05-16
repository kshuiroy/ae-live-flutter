import 'dart:async';

import 'package:ae_live/bloc/wait_time/wait_time_bloc.dart';
import 'package:ae_live/config/constants.dart';
import 'package:ae_live/config/tab_items.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/widgets/navigation/phone_navigation.dart';
import 'package:ae_live/widgets/navigation/tablet_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  int _selectedTabIndex = 0;
  late StreamSubscription<AppLocale> _localeStream;

  void _onDestinationSelected(final BuildContext context, final int index) {
    context.go(tabItems[index].path);

    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _localeStream =
        LocaleSettings.getLocaleStream().listen((final AppLocale locale) {
      // Reset BLoC's data when the locale is changed.
      context.read<WaitTimeBloc>().add(WaitTimeReset());
    });
  }

  @override
  void dispose() {
    super.dispose();
    _localeStream.cancel();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (ResponsiveBreakpoints.of(context)
              .largerOrEqualTo(Constants.screenSizeKeyExpanded))
            TabletNavigation(
              selectedIndex: _selectedTabIndex,
              onDestinationSelected: (final int index) =>
                  _onDestinationSelected(context, index),
            ),
          Expanded(
            child: widget.child,
          ),
        ],
      ),
      bottomNavigationBar: ResponsiveBreakpoints.of(context)
              .smallerOrEqualTo(Constants.screenSizeKeyMedium)
          ? PhoneNavigation(
              selectedIndex: _selectedTabIndex,
              onDestinationSelected: (final int index) =>
                  _onDestinationSelected(context, index),
            )
          : null,
    );
  }
}
