import 'package:ae_live/ae_live_app.dart';
import 'package:ae_live/config/constants.dart';
import 'package:ae_live/config/theme_map.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/models/settings_option_model.dart';
import 'package:ae_live/widgets/settings_screen/settings_option_screen_base.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DisplayThemeSettingsScreen extends StatefulWidget {
  const DisplayThemeSettingsScreen({
    super.key,
    this.disableAutoGoBack = false,
  });

  final bool disableAutoGoBack;

  @override
  State<DisplayThemeSettingsScreen> createState() =>
      _DisplayThemeSettingsScreenState();
}

class _DisplayThemeSettingsScreenState
    extends State<DisplayThemeSettingsScreen> {
  ThemeMode? _defaultTheme;
  late SharedPreferences _preferences;

  void _init() async {
    _preferences = await SharedPreferences.getInstance();

    // Get the theme preference from [SharedPreferences].
    final String? themePreference =
        _preferences.getString(Constants.preferenceKeyAppTheme);

    // Initialize the default selected option.
    if (themePreference == null) {
      setState(() {
        _defaultTheme = ThemeMode.system;
      });
      await _preferences.setString(Constants.preferenceKeyAppTheme, 'system');
    } else {
      setState(() {
        _defaultTheme = themeMap[themePreference] ?? ThemeMode.system;
      });
    }
  }

  void _onSaveTheme(final BuildContext context, final ThemeMode mode) {
    // Update the app theme
    AELiveApp.of(context).updateTheme(mode);

    if (!widget.disableAutoGoBack) {
      // Go back to the previous screen after the setting is saved.
      Navigator.of(context).pop();
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

    final List<SettingsOptionModel<ThemeMode>> themeOptions =
        <SettingsOptionModel<ThemeMode>>[
      SettingsOptionModel(
        title: t.settings.appearance.theme.options.light,
        value: ThemeMode.light,
      ),
      SettingsOptionModel(
        title: t.settings.appearance.theme.options.dark,
        value: ThemeMode.dark,
      ),
      SettingsOptionModel(
        title: t.settings.appearance.theme.options.system,
        value: ThemeMode.system,
      ),
    ];

    if (_defaultTheme == null) {
      return const SizedBox();
    }

    return SettingsOptionScreenBase<ThemeMode>(
      title: t.settings.appearance.theme.title,
      options: themeOptions,
      defaultOption: _defaultTheme!,
      onSave: (theme) => _onSaveTheme(context, theme),
    );
  }
}
