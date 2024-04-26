import 'package:ae_live/config/constants.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/models/settings_option_model.dart';
import 'package:ae_live/utilities/locale_converter.dart';
import 'package:ae_live/widgets/settings/responsive_settings_pane.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DisplayLocaleSettings extends StatefulWidget {
  const DisplayLocaleSettings({super.key});

  @override
  State<DisplayLocaleSettings> createState() => _DisplayLocaleSettingsState();
}

class _DisplayLocaleSettingsState extends State<DisplayLocaleSettings> {
  // String _currentLocale = LocaleConverter.getLanguageCode();
  late SharedPreferences _preferences;

  void _init() async {
    _preferences = await SharedPreferences.getInstance();

    final localePreference =
        _preferences.getString(Constants.preferenceKeyAppLocale);

    if (localePreference == null) {
      await _preferences.setString(
        Constants.preferenceKeyAppTheme,
        LocaleConverter.getLanguageCode(),
      );
    }
  }

  Future<void> _onSaveLocale(BuildContext context, String locale) async {
    // Update the display locale settings
    if (await _preferences.setString(
        Constants.preferenceKeyAppLocale, locale)) {
      LocaleSettings.setLocaleRaw(locale);
    }

    // Dismiss the bottom sheet
    if (context.mounted) {
      Navigator.of(context).pop();
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

    final List<SettingsOptionModel<String>> localeOptions = [
      SettingsOptionModel(
        title: t.settings.appearance.language.options.zhHK,
        value: 'zh-HK',
      ),
      SettingsOptionModel(
        title: t.settings.appearance.language.options.zhCN,
        value: 'zh-CN',
      ),
      SettingsOptionModel(
        title: t.settings.appearance.language.options.en,
        value: 'en',
      ),
    ];

    return ResponsiveSettingsPane<String>(
      title: t.settings.appearance.language.title,
      options: localeOptions,
      defaultOption: LocaleConverter.getLanguageCode(),
      onSave: (value) => _onSaveLocale(context, value),
    );
  }
}
