import 'package:ae_live/ae_live_app.dart';
import 'package:ae_live/config/constants.dart';
import 'package:ae_live/config/theme_map.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/models/settings_option_model.dart';
import 'package:ae_live/widgets/settings/responsive_settings_pane.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DisplayThemeSettings extends StatefulWidget {
  const DisplayThemeSettings({super.key});

  @override
  State<DisplayThemeSettings> createState() => _DisplayThemeSettingsState();
}

class _DisplayThemeSettingsState extends State<DisplayThemeSettings> {
  ThemeMode? _defaultTheme;
  late SharedPreferences _preferences;

  void _init() async {
    _preferences = await SharedPreferences.getInstance();
    final themePreference =
        _preferences.getString(Constants.preferenceKeyAppTheme);
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

  void _onSaveTheme(ThemeMode mode) {
    // Update the app theme
    AELiveApp.of(context).updateTheme(mode);

    // Dismiss the bottom sheet
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    final List<SettingsOptionModel<ThemeMode>> themeOptions = [
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

    // Render the settings pane when the [_defaultTheme] is initialized.
    return ResponsiveSettingsPane<ThemeMode>(
      title: t.settings.appearance.theme.title,
      options: themeOptions,
      defaultOption: _defaultTheme!,
      onSave: _onSaveTheme,
    );
  }
}
