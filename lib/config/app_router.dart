import 'package:ae_live/models/wait_time_model.dart';
import 'package:ae_live/screens/home_screen.dart';
import 'package:ae_live/screens/lists_screen.dart';
import 'package:ae_live/screens/settings_screen.dart';
import 'package:ae_live/screens/wait_time_details_screen.dart';
import 'package:ae_live/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => AppScaffold(child: child),
      routes: [
        GoRoute(
          path: '/',
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: HomeScreen(),
          ),
        ),
        GoRoute(
          path: '/lists',
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ListsScreen(),
          ),
        ),
        GoRoute(
          path: '/settings',
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: SettingsScreen(),
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/wait-time/details',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => WaitTimeDetailsScreen(
        data: state.extra as WaitTimeModel,
      ),
    ),
  ],
);
