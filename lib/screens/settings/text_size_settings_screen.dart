import 'package:ae_live/ae_live_app.dart';
import 'package:ae_live/config/constants.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/models/settings_option_model.dart';
import 'package:ae_live/widgets/settings_screen/settings_option_screen_base.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TextSizeSettingsScreen extends StatefulWidget {
  const TextSizeSettingsScreen({
    super.key,
    this.disableAutoGoBack = false,
  });

  final bool disableAutoGoBack;

  @override
  State<TextSizeSettingsScreen> createState() => _TextSizeSettingsScreenState();
}

class _TextSizeSettingsScreenState extends State<TextSizeSettingsScreen> {
  double? _defaultTextScale;
  late SharedPreferences _preferences;

  void _init() async {
    _preferences = await SharedPreferences.getInstance();

    final double? textScalePreference =
        _preferences.getDouble(Constants.preferenceKeyTextScale);

    // Initialize the default selected option.
    if (textScalePreference == null) {
      setState(() {
        _defaultTextScale = 1.0;
      });
      await _preferences.setDouble(Constants.preferenceKeyTextScale, 1.0);
    } else {
      setState(() {
        _defaultTextScale = textScalePreference;
      });
    }
  }

  Future<void> _onSaveTextScale(
    final BuildContext context,
    final double textScale,
  ) async {
    // Update the display locale settings
    AELiveApp.of(context).updateTextScale(textScale);

    // Go back to the last screen
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
  Widget build(BuildContext context) {
    final Translations t = Translations.of(context);

    final List<SettingsOptionModel<double>> textScaleOptions =
        <SettingsOptionModel<double>>[
      SettingsOptionModel(
        title: t.settings.appearance.textSize.options.defaultSize,
        value: 1.0,
      ),
      SettingsOptionModel(
        title: t.settings.appearance.textSize.options.largeSize,
        value: 1.25,
      ),
      SettingsOptionModel(
        title: t.settings.appearance.textSize.options.extraLargeSize,
        value: 1.45,
      ),
    ];

    if (_defaultTextScale == null) {
      return const SizedBox();
    }

    return SettingsOptionScreenBase<double>(
      title: t.settings.appearance.textSize.title,
      options: textScaleOptions,
      defaultOption: _defaultTextScale!,
      onSave: (textScale) => _onSaveTextScale(context, textScale),
    );
  }
}
