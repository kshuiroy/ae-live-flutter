import 'package:ae_live/ae_live_app.dart';
import 'package:ae_live/config/constants.dart';
import 'package:ae_live/config/theme_map.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DisplayThemeSettings extends StatefulWidget {
  const DisplayThemeSettings({super.key});

  @override
  State<DisplayThemeSettings> createState() => _DisplayThemeSettingsState();
}

class _DisplayThemeSettingsState extends State<DisplayThemeSettings> {
  ThemeMode _currentTheme = ThemeMode.system;
  late SharedPreferences _preferences;

  void _init() async {
    _preferences = await SharedPreferences.getInstance();
    final themePreference =
        _preferences.getString(Constants.preferenceKeyAppTheme);
    if (themePreference == null) {
      setState(() {
        _currentTheme = ThemeMode.system;
      });
      await _preferences.setString(Constants.preferenceKeyAppTheme, 'system');
    } else {
      setState(() {
        _currentTheme = themeMap[themePreference] ?? ThemeMode.system;
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
    final TextTheme textTheme = Theme.of(context).textTheme;

    if (ResponsiveBreakpoints.of(context)
        .largerOrEqualTo(Constants.screenSizeKeyExpanded)) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            t.settings.appearance.theme.title,
          ),
        ),
        body: SafeArea(
          child: _buildThemeOptionsList(context),
        ),
      );
    }

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
              t.settings.appearance.theme.title,
              style: textTheme.titleLarge,
            ),
          ),
          const Divider(
            indent: 16.0,
            endIndent: 16.0,
            height: 8.0,
          ),
          _buildThemeOptionsList(context),
          const SizedBox(
            height: 16.0,
          ),
        ],
      ),
    );
  }

  Widget _buildThemeOptionsList(BuildContext context) {
    final t = Translations.of(context);
    final List<_SettingsOptionModel> themeOptions = [
      _SettingsOptionModel(
        title: t.settings.appearance.theme.options.light,
        value: ThemeMode.light,
      ),
      _SettingsOptionModel(
        title: t.settings.appearance.theme.options.dark,
        value: ThemeMode.dark,
      ),
      _SettingsOptionModel(
        title: t.settings.appearance.theme.options.system,
        value: ThemeMode.system,
      ),
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        if (index == themeOptions.length) {
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
                    onPressed: () {
                      // Update the app theme
                      AELiveApp.of(context).updateTheme(_currentTheme);

                      // Dismiss the bottom sheet
                      Navigator.of(context).pop();
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

        final _SettingsOptionModel option = themeOptions[index];

        return ListTile(
          contentPadding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
          ),
          title: Text(option.title),
          trailing: Radio(
            groupValue: _currentTheme,
            value: option.value,
            onChanged: (value) {
              setState(() {
                _currentTheme = value!;
              });
            },
          ),
          onTap: () {
            setState(() {
              _currentTheme = option.value;
            });
          },
        );
      },
      itemCount: themeOptions.length + 1,
    );
  }
}

class _SettingsOptionModel {
  _SettingsOptionModel({
    required this.title,
    required this.value,
  });

  final String title;
  final ThemeMode value;
}
