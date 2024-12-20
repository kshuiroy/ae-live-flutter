import 'package:ae_live/models/wait_time_model.dart';
import 'package:ae_live/screens/home_screen.dart';
import 'package:ae_live/screens/lists/facility_cmc_screen.dart';
import 'package:ae_live/screens/lists/facility_goc_screen.dart';
import 'package:ae_live/screens/lists/facility_hospital_screen.dart';
import 'package:ae_live/screens/lists/facility_soc_screen.dart';
import 'package:ae_live/screens/lists_screen.dart';
import 'package:ae_live/screens/settings/about_this_app_screen.dart';
import 'package:ae_live/screens/settings/default_sorting_settings_screen.dart';
import 'package:ae_live/screens/settings/display_locale_settings_screen.dart';
import 'package:ae_live/screens/settings/display_theme_settings_screen.dart';
import 'package:ae_live/screens/settings/open_source_licenses_screen.dart';
import 'package:ae_live/screens/settings/text_size_settings_screen.dart';
import 'package:ae_live/screens/settings_screen.dart';
import 'package:ae_live/screens/wait_time_details_screen.dart';
import 'package:ae_live/widgets/animations/shared_axis_transition_page_wrapper.dart';
import 'package:ae_live/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (
        final BuildContext context,
        final GoRouterState state,
        final Widget child,
      ) =>
          AppScaffold(child: child),
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder:
              (final BuildContext context, final GoRouterState state) =>
                  const SharedAxisTransitionPageWrapper(
            transitionKey: ValueKey('home'),
            screen: HomeScreen(),
          ),
        ),
        GoRoute(
          path: '/lists',
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder:
              (final BuildContext context, final GoRouterState state) =>
                  const SharedAxisTransitionPageWrapper(
            transitionKey: ValueKey('lists'),
            screen: ListsScreen(),
          ),
          routes: <RouteBase>[
            GoRoute(
              path: 'hospital',
              parentNavigatorKey: _rootNavigatorKey,
              builder:
                  (final BuildContext context, final GoRouterState state) =>
                      const FacilityHospitalScreen(),
            ),
            GoRoute(
              path: 'soc',
              parentNavigatorKey: _rootNavigatorKey,
              builder:
                  (final BuildContext context, final GoRouterState state) =>
                      const FacilitySocScreen(),
            ),
            GoRoute(
              path: 'goc',
              parentNavigatorKey: _rootNavigatorKey,
              builder:
                  (final BuildContext context, final GoRouterState state) =>
                      const FacilityGocScreen(),
            ),
            GoRoute(
              path: 'cmc',
              parentNavigatorKey: _rootNavigatorKey,
              builder:
                  (final BuildContext context, final GoRouterState state) =>
                      const FacilityCmcScreen(),
            ),
          ],
        ),
        GoRoute(
          path: '/settings',
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder:
              (final BuildContext context, final GoRouterState state) =>
                  const SharedAxisTransitionPageWrapper(
            transitionKey: ValueKey('settings'),
            screen: SettingsScreen(),
          ),
          routes: <RouteBase>[
            GoRoute(
              path: 'theme',
              parentNavigatorKey: _rootNavigatorKey,
              builder:
                  (final BuildContext context, final GoRouterState state) =>
                      const DisplayThemeSettingsScreen(),
            ),
            GoRoute(
              path: 'locale',
              parentNavigatorKey: _rootNavigatorKey,
              builder:
                  (final BuildContext context, final GoRouterState state) =>
                      const DisplayLocaleSettingsScreen(),
            ),
            GoRoute(
              path: 'text-size',
              parentNavigatorKey: _rootNavigatorKey,
              builder:
                  (final BuildContext context, final GoRouterState state) =>
                      const TextSizeSettingsScreen(),
            ),
            GoRoute(
              path: 'sorting',
              parentNavigatorKey: _rootNavigatorKey,
              builder:
                  (final BuildContext context, final GoRouterState state) =>
                      const DefaultSortingSettingsScreen(),
            ),
            GoRoute(
              path: 'licenses',
              parentNavigatorKey: _rootNavigatorKey,
              builder:
                  (final BuildContext context, final GoRouterState state) =>
                      const OpenSourceLicensesScreen(),
            ),
            GoRoute(
              path: 'about',
              parentNavigatorKey: _rootNavigatorKey,
              builder:
                  (final BuildContext context, final GoRouterState state) =>
                      const AboutThisAppScreen(),
            ),
          ],
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
    // GoRoute(
    //   path: '/lists/hospital',
    //   parentNavigatorKey: _rootNavigatorKey,
    //   builder: (final BuildContext context, final GoRouterState state) =>
    //       const FacilityHospitalScreen(),
    // ),
    // GoRoute(
    //   path: '/lists/soc',
    //   parentNavigatorKey: _rootNavigatorKey,
    //   builder: (final BuildContext context, final GoRouterState state) =>
    //       const FacilitySocScreen(),
    // ),
    // GoRoute(
    //   path: '/lists/goc',
    //   parentNavigatorKey: _rootNavigatorKey,
    //   builder: (final BuildContext context, final GoRouterState state) =>
    //       const FacilityGocScreen(),
    // ),
    // GoRoute(
    //   path: '/settings/theme',
    //   parentNavigatorKey: _rootNavigatorKey,
    //   builder: (final BuildContext context, final GoRouterState state) =>
    //       const DisplayThemeSettingsScreen(),
    // ),
    // GoRoute(
    //   path: '/settings/locale',
    //   parentNavigatorKey: _rootNavigatorKey,
    //   builder: (final BuildContext context, final GoRouterState state) =>
    //       const DisplayLocaleSettingsScreen(),
    // ),
    // GoRoute(
    //   path: '/settings/sorting',
    //   parentNavigatorKey: _rootNavigatorKey,
    //   builder: (final BuildContext context, final GoRouterState state) =>
    //       const DefaultSortingSettingsScreen(),
    // ),
    // GoRoute(
    //   path: '/settings/licenses',
    //   parentNavigatorKey: _rootNavigatorKey,
    //   builder: (final BuildContext context, final GoRouterState state) =>
    //       const OpenSourceLicensesScreen(),
    // ),
    // GoRoute(
    //   path: '/settings/about',
    //   parentNavigatorKey: _rootNavigatorKey,
    //   builder: (final BuildContext context, final GoRouterState state) =>
    //       const AboutThisAppScreen(),
    // ),
  ],
);
