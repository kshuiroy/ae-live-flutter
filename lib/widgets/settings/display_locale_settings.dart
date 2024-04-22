import 'package:ae_live/config/constants.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/utilities/locale_converter.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DisplayLocaleSettings extends StatefulWidget {
  const DisplayLocaleSettings({super.key});

  @override
  State<DisplayLocaleSettings> createState() => _DisplayLocaleSettingsState();
}

class _DisplayLocaleSettingsState extends State<DisplayLocaleSettings> {
  String _currentLocale = LocaleConverter.getLanguageCode();
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

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final TextTheme textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 16.0,
              right: 16.0,
              bottom: 12.0,
              left: 16.0,
            ),
            child: Text(
              t.settings.appearance.language.title,
              style: textTheme.titleLarge,
            ),
          ),
          const Divider(
            indent: 16.0,
            endIndent: 16.0,
            height: 8.0,
          ),
          _buildLocaleOptionsList(context),
          const SizedBox(
            height: 16.0,
          ),
        ],
      ),
    );
  }

  Widget _buildLocaleOptionsList(BuildContext context) {
    final t = Translations.of(context);
    final List<_SettingsOptionModel<String>> localeOptions = [
      _SettingsOptionModel(
        title: t.settings.appearance.language.options.zhHK,
        value: 'zh-HK',
      ),
      _SettingsOptionModel(
        title: t.settings.appearance.language.options.zhCN,
        value: 'zh-CN',
      ),
      _SettingsOptionModel(
        title: t.settings.appearance.language.options.en,
        value: 'en',
      ),
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        if (index == localeOptions.length) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 16.0,
              right: 16.0,
              left: 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: FilledButton.tonalIcon(
                    onPressed: () async {
                      if (await _preferences.setString(
                          Constants.preferenceKeyAppLocale, _currentLocale)) {
                        // Update the display locale settings
                        LocaleSettings.setLocaleRaw(_currentLocale);
                      }

                      if (context.mounted) {
                        // Dismiss the bottom sheet
                        Navigator.of(context).pop();
                      }
                    },
                    icon: const Icon(
                      Symbols.save_rounded,
                      size: 24.0,
                      fill: 0.0,
                      weight: 200.0,
                      opticalSize: 24.0,
                    ),
                    label: Text(
                      t.settings.save,
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        final _SettingsOptionModel<String> option = localeOptions[index];

        return ListTile(
          contentPadding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
          ),
          title: Text(option.title),
          trailing: Radio(
            groupValue: _currentLocale,
            value: option.value,
            onChanged: (value) {
              setState(() {
                _currentLocale = value!;
              });
            },
          ),
          onTap: () {
            setState(() {
              _currentLocale = option.value;
            });
          },
        );
      },
      itemCount: localeOptions.length + 1,
    );
  }
}

class _SettingsOptionModel<T> {
  _SettingsOptionModel({
    required this.title,
    required this.value,
  });

  final String title;
  final T value;
}
