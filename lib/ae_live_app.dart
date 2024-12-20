import 'package:ae_live/bloc/facility_cmc/facility_cmc_bloc.dart';
import 'package:ae_live/bloc/facility_goc/facility_goc_bloc.dart';
import 'package:ae_live/bloc/facility_hospital/facility_hospital_bloc.dart';
import 'package:ae_live/bloc/facility_soc/facility_soc_bloc.dart';
import 'package:ae_live/bloc/wait_time/wait_time_bloc.dart';
import 'package:ae_live/config/app_router.dart';
import 'package:ae_live/config/constants.dart';
import 'package:ae_live/config/theme_map.dart';
import 'package:ae_live/data/providers/facility_cmc_provider.dart';
import 'package:ae_live/data/providers/facility_goc_provider.dart';
import 'package:ae_live/data/providers/facility_hospital_provider.dart';
import 'package:ae_live/data/providers/facility_soc_provider.dart';
import 'package:ae_live/data/providers/wait_time_provider.dart';
import 'package:ae_live/data/repositories/facility_cmc_repository.dart';
import 'package:ae_live/data/repositories/facility_goc_repository.dart';
import 'package:ae_live/data/repositories/facility_hospital_repository.dart';
import 'package:ae_live/data/repositories/facility_soc_repository.dart';
import 'package:ae_live/data/repositories/wait_time_repository.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/theme/custom_text_theme.g.dart';
import 'package:ae_live/theme/new_color_scheme/material_theme.dart';
import 'package:ae_live/utilities/locale_converter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AELiveApp extends StatefulWidget {
  const AELiveApp({super.key});

  @override
  State<AELiveApp> createState() => _AELiveAppState();

  // ignore: library_private_types_in_public_api
  static _AELiveAppState of(final BuildContext context) =>
      context.findAncestorStateOfType<_AELiveAppState>()!;
}

class _AELiveAppState extends State<AELiveApp> {
  ThemeMode _themeMode = ThemeMode.system;
  bool _localeInitialized = false;
  double _textScale = 1.0;
  late SharedPreferences _preferences;

  void _init() async {
    _preferences = await SharedPreferences.getInstance();

    // Setting app locale
    final String? localePreference =
        _preferences.getString(Constants.preferenceKeyAppLocale);

    if (localePreference == null) {
      // Use the device's settings by default
      final AppLocale deviceLocale = AppLocaleUtils.findDeviceLocale();

      if (deviceLocale.languageCode == 'zh') {
        if (deviceLocale.scriptCode == 'Hans' ||
            deviceLocale.countryCode == 'CN') {
          LocaleSettings.setLocaleRaw('zh-CN');
        } else {
          LocaleSettings.setLocaleRaw('zh-HK');
        }
      } else {
        LocaleSettings.setLocaleRaw('en');
      }

      // Store the locale settings to Shared Preference
      await _preferences.setString(
        Constants.preferenceKeyAppLocale,
        LocaleConverter.getLanguageCode(),
      );
    } else {
      debugPrint('Locale: $localePreference');
      // Use the locale settings stored in Shared Preference
      LocaleSettings.setLocaleRaw(localePreference);
    }

    setState(() {
      _localeInitialized = true;
    });

    // Setting app theme
    final String? themePreference =
        _preferences.getString(Constants.preferenceKeyAppTheme);

    if (themePreference == null) {
      // setState(() {
      //   _themeMode = ThemeMode.system;
      // });
      await _preferences.setString(Constants.preferenceKeyAppTheme, 'system');
    } else {
      setState(() {
        _themeMode = themeMap[themePreference] ?? ThemeMode.system;
      });
    }

    // Setting text size
    final double? textScalePreference =
        _preferences.getDouble(Constants.preferenceKeyTextScale);

    if (textScalePreference == null) {
      await _preferences.setDouble(Constants.preferenceKeyTextScale, 1.0);
    } else {
      setState(() {
        _textScale = textScalePreference;
      });
    }
  }

  /// Update the display theme of the app.
  void updateTheme(final ThemeMode mode) async {
    if (await _preferences.setString(
      Constants.preferenceKeyAppTheme,
      mode.name,
    )) {
      setState(() {
        _themeMode = mode;
      });
    }
  }

  /// Update the text scale of the app.
  void updateTextScale(final double textScale) async {
    if (await _preferences.setDouble(
      Constants.preferenceKeyTextScale,
      textScale,
    )) {
      setState(() {
        _textScale = textScale;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(final BuildContext context) {
    final Translations t = Translations.of(context);

    // Enable edge-to-edge style on Android
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
      ),
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (final BuildContext context) => WaitTimeRepository(
            provider: WaitTimeProvider(),
          ),
        ),
        RepositoryProvider(
          create: (final BuildContext context) => FacilityHospitalRepository(
            provider: FacilityHospitalProvider(),
          ),
        ),
        RepositoryProvider(
          create: (final BuildContext context) => FacilitySocRepository(
            provider: FacilitySocProvider(),
          ),
        ),
        RepositoryProvider(
          create: (final BuildContext context) => FacilityGocRepository(
            provider: FacilityGocProvider(),
          ),
        ),
        RepositoryProvider(
          create: (final BuildContext context) => FacilityCmcRepository(
            provider: FacilityCmcProvider(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<WaitTimeBloc>(
            create: (final BuildContext context) => WaitTimeBloc(
              repository: context.read<WaitTimeRepository>(),
            ),
          ),
          BlocProvider<FacilityHospitalBloc>(
            create: (final BuildContext context) => FacilityHospitalBloc(
              repository: context.read<FacilityHospitalRepository>(),
            ),
          ),
          BlocProvider<FacilitySocBloc>(
            create: (final BuildContext context) => FacilitySocBloc(
              repository: context.read<FacilitySocRepository>(),
            ),
          ),
          BlocProvider<FacilityGocBloc>(
            create: (final BuildContext context) => FacilityGocBloc(
              repository: context.read<FacilityGocRepository>(),
            ),
          ),
          BlocProvider<FacilityCmcBloc>(
            create: (final BuildContext context) => FacilityCmcBloc(
              repository: context.read<FacilityCmcRepository>(),
            ),
          ),
        ],
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(_textScale),
          ),
          child: MaterialApp.router(
            title: t.main.app_name,
            theme: const MaterialTheme(customTextTheme).light(),
            darkTheme: const MaterialTheme(customTextTheme).dark(),
            highContrastTheme:
                const MaterialTheme(customTextTheme).lightHighContrast(),
            highContrastDarkTheme:
                const MaterialTheme(customTextTheme).darkHighContrast(),
            themeMode: _themeMode,
            routerConfig: appRouter,
            locale: TranslationProvider.of(context).flutterLocale,
            supportedLocales: AppLocaleUtils.supportedLocales,
            localizationsDelegates: GlobalMaterialLocalizations.delegates,
            builder: (final BuildContext context, final Widget? child) =>
                ResponsiveBreakpoints.builder(
              child: _localeInitialized ? child! : const SizedBox(),
              breakpoints: <Breakpoint>[
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
      ),
    );
  }
}
