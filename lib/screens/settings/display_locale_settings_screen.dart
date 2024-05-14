import 'package:ae_live/config/constants.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/models/settings_option_model.dart';
import 'package:ae_live/utilities/locale_converter.dart';
import 'package:ae_live/widgets/settings_screen/settings_option_screen_base.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DisplayLocaleSettingsScreen extends StatefulWidget {
  const DisplayLocaleSettingsScreen({
    super.key,
    this.disableAutoGoBack = false,
  });

  final bool disableAutoGoBack;

  @override
  State<DisplayLocaleSettingsScreen> createState() =>
      _DisplayLocaleSettingsScreenState();
}

class _DisplayLocaleSettingsScreenState
    extends State<DisplayLocaleSettingsScreen> {
  late SharedPreferences _preferences;

  void _init() async {
    _preferences = await SharedPreferences.getInstance();

    final String? localePreference =
        _preferences.getString(Constants.preferenceKeyAppLocale);

    if (localePreference == null) {
      await _preferences.setString(
        Constants.preferenceKeyAppTheme,
        LocaleConverter.getLanguageCode(),
      );
    }
  }

  Future<void> _onSaveLocale(final BuildContext context, final String locale) async {
    // Update the display locale settings
    if (await _preferences.setString(
        Constants.preferenceKeyAppLocale, locale,)) {
      LocaleSettings.setLocaleRaw(locale);
    }

    // Dismiss the bottom sheet
    if (!widget.disableAutoGoBack && context.mounted) {
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

    final List<SettingsOptionModel<String>> localeOptions = <SettingsOptionModel<String>>[
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

    return SettingsOptionScreenBase<String>(
      title: t.settings.appearance.language.title,
      options: localeOptions,
      defaultOption: LocaleConverter.getLanguageCode(),
      onSave: (final String value) => _onSaveLocale(context, value),
    );
  }
}
