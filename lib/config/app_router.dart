import 'package:ae_live/models/wait_time_model.dart';
import 'package:ae_live/screens/home_screen.dart';
import 'package:ae_live/screens/lists_screen.dart';
import 'package:ae_live/screens/settings/about_this_app_screen.dart';
import 'package:ae_live/screens/settings/display_locale_settings_screen.dart';
import 'package:ae_live/screens/settings/display_theme_settings_screen.dart';
import 'package:ae_live/screens/settings/open_source_licenses_screen.dart';
import 'package:ae_live/screens/settings_screen.dart';
import 'package:ae_live/screens/wait_time_details_screen.dart';
import 'package:ae_live/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: <RouteBase>[
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (final BuildContext context, final GoRouterState state,
              final Widget child) =>
          AppScaffold(child: child),
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder:
              (final BuildContext context, final GoRouterState state) =>
                  const NoTransitionPage(
            child: HomeScreen(),
          ),
        ),
        GoRoute(
          path: '/lists',
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder:
              (final BuildContext context, final GoRouterState state) =>
                  const NoTransitionPage(
            child: ListsScreen(),
          ),
        ),
        GoRoute(
          path: '/settings',
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder:
              (final BuildContext context, final GoRouterState state) =>
                  const NoTransitionPage(
            child: SettingsScreen(),
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/wait-time/details',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (final BuildContext context, final GoRouterState state) =>
          WaitTimeDetailsScreen(
        data: state.extra as WaitTimeModel,
      ),
    ),
    GoRoute(
      path: '/settings/theme',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (final BuildContext context, final GoRouterState state) =>
          const DisplayThemeSettingsScreen(),
    ),
    GoRoute(
      path: '/settings/locale',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (final BuildContext context, final GoRouterState state) =>
          const DisplayLocaleSettingsScreen(),
    ),
    GoRoute(
      path: '/settings/licenses',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (final BuildContext context, final GoRouterState state) =>
          const OpenSourceLicensesScreen(),
    ),
    GoRoute(
      path: '/settings/about',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (final BuildContext context, final GoRouterState state) =>
          const AboutThisAppScreen(),
    ),
  ],
);
