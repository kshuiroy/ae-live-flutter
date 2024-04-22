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
  late StreamSubscription<AppLocale> _localeStram;

  void _onDestinationSelected(BuildContext context, int index) {
    context.go(tabItems[index].path);

    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _localeStram = LocaleSettings.getLocaleStream().listen((AppLocale locale) {
      // Reset BLoC's data when the locale is changed.
      context.read<WaitTimeBloc>().add(WaitTimeReset());
    });
  }

  @override
  void dispose() {
    super.dispose();
    _localeStram.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (ResponsiveBreakpoints.of(context)
              .largerOrEqualTo(Constants.screenSizeKeyMedium))
            TabletNavigation(
              selectedIndex: _selectedTabIndex,
              onDestinationSelected: (int index) =>
                  _onDestinationSelected(context, index),
            ),
          Expanded(
            child: widget.child,
          ),
        ],
      ),
      bottomNavigationBar: ResponsiveBreakpoints.of(context)
              .equals(Constants.screenSizeKeyCompact)
          ? PhoneNavigation(
              selectedIndex: _selectedTabIndex,
              onDestinationSelected: (int index) =>
                  _onDestinationSelected(context, index),
            )
          : null,
    );
  }
}
