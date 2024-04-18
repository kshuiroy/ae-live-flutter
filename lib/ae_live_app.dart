import 'package:ae_live/bloc/wait_time/wait_time_bloc.dart';
import 'package:ae_live/config/app_router.dart';
import 'package:ae_live/config/constants.dart';
import 'package:ae_live/config/theme_map.dart';
import 'package:ae_live/data/providers/wait_time_provider.dart';
import 'package:ae_live/data/repositories/wait_time_repository.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/theme/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AELiveApp extends StatefulWidget {
  const AELiveApp({super.key});

  @override
  State<AELiveApp> createState() => _AELiveAppState();

  static _AELiveAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_AELiveAppState>()!;
}

class _AELiveAppState extends State<AELiveApp> {
  ThemeMode _themeMode = ThemeMode.system;
  late SharedPreferences _preferences;

  void _init() async {
    _preferences = await SharedPreferences.getInstance();
    final themePreference =
        _preferences.getString(Constants.preferenceKeyAppTheme);
    if (themePreference == null) {
      setState(() {
        _themeMode = ThemeMode.system;
      });
      await _preferences.setString(Constants.preferenceKeyAppTheme, 'system');
    } else {
      setState(() {
        _themeMode = themeMap[themePreference] ?? ThemeMode.system;
      });
    }
  }

  void updateTheme(ThemeMode mode) async {
    if (await _preferences.setString(
        Constants.preferenceKeyAppTheme, mode.name)) {
      setState(() {
        _themeMode = mode;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => WaitTimeRepository(
            provider: WaitTimeProvider(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<WaitTimeBloc>(
            create: (BuildContext context) => WaitTimeBloc(
              repository: context.read<WaitTimeRepository>(),
            ),
          ),
        ],
        child: MaterialApp.router(
          title: t.main.app_name,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: _themeMode,
          routerConfig: appRouter,
          locale: TranslationProvider.of(context).flutterLocale,
          supportedLocales: AppLocaleUtils.supportedLocales,
          localizationsDelegates: GlobalMaterialLocalizations.delegates,
          builder: (context, child) => ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: [
              const Breakpoint(
                start: 0.0,
                end: 599.0,
                name: Constants.screenSizeKeyCompact,
              ),
              const Breakpoint(
                start: 600.0,
                end: 839.0,
                name: Constants.screenSizeKeyMedium,
              ),
              const Breakpoint(
                start: 840.0,
                end: 1199.0,
                name: Constants.screenSizeKeyExpanded,
              ),
              const Breakpoint(
                start: 1200.0,
                end: 1599.0,
                name: Constants.screenSizeKeyLarge,
              ),
              const Breakpoint(
                start: 1600.0,
                end: double.infinity,
                name: Constants.screenSizeKeyExtraLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
