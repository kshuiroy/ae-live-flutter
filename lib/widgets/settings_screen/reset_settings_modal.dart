import 'package:ae_live/config/constants.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/widgets/core/responsive_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResetSettingsModal extends StatelessWidget {
  const ResetSettingsModal({super.key});

  void _onResetSettings(final BuildContext context) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();

    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(final BuildContext context) {
    final Translations t = Translations.of(context);
    final TextTheme textTheme = Theme.of(context).textTheme;

    if (ResponsiveBreakpoints.of(context)
        .largerOrEqualTo(Constants.screenSizeKeyMedium)) {
      return ResponsiveAlertDialog(
        icon: const Icon(
          Symbols.restart_alt_rounded,
          size: 24.0,
          fill: 0.0,
          weight: 200.0,
          opticalSize: 24.0,
        ),
        title: Text(t.settings.data.reset.title),
        content: Text(t.settings.data.reset.message),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(t.settings.data.reset.buttons.cancel),
          ),
          TextButton(
            onPressed: () => _onResetSettings(context),
            child: Text(t.settings.data.reset.buttons.reset),
          ),
        ],
      );
    }

    return Padding(
      padding: EdgeInsets.only(
        top: 16.0,
        right: 16.0,
        bottom: MediaQuery.of(context).padding.bottom + 16.0,
        left: 16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Text(
                  t.settings.data.reset.title,
                  style: textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          const Divider(
            height: 32.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Text(
                  t.settings.data.reset.message,
                  style: textTheme.bodyLarge,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(t.settings.data.reset.buttons.cancel),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: FilledButton(
                  onPressed: () => _onResetSettings(context),
                  child: Text(t.settings.data.reset.buttons.reset),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
