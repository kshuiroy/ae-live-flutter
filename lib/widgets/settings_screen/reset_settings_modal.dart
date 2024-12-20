import 'dart:math';

import 'package:ae_live/config/constants.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/widgets/core/responsive_alert_dialog.dart';
import 'package:ae_live/widgets/shared/themed_filled_button_icon.dart';
import 'package:ae_live/widgets/shared/themed_icon.dart';
import 'package:ae_live/widgets/shared/themed_outlined_button_icon.dart';
import 'package:ae_live/widgets/shared/themed_text_button_icon.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResetSettingsModal extends StatelessWidget {
  const ResetSettingsModal({super.key});

  void _onResetSettings(
    final BuildContext context,
    final String successMessage,
  ) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();

    if (context.mounted) {
      // Dismiss the bottom sheet/dialog.
      Navigator.of(context).pop();

      // Show a message after the [SharedPreferences] is cleared.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(
            seconds: 10,
          ),
          content: Text(successMessage),
          behavior: SnackBarBehavior.floating,
          showCloseIcon: true,
          margin: EdgeInsets.only(
            left: max((MediaQuery.of(context).size.width - 616.0) / 2.0, 16.0),
            bottom: 64.0,
            right: max((MediaQuery.of(context).size.width - 616.0) / 2.0, 16.0),
          ),
        ),
      );
    }
  }

  @override
  Widget build(final BuildContext context) {
    final Translations t = Translations.of(context);
    final TextTheme textTheme = Theme.of(context).textTheme;

    if (ResponsiveBreakpoints.of(context)
        .largerOrEqualTo(Constants.screenSizeKeyMedium)) {
      return ResponsiveAlertDialog(
        icon: const ThemedIcon(
          Symbols.restart_alt_rounded,
        ),
        title: Text(t.settings.data.reset.title),
        content: Text(t.settings.data.reset.message),
        actions: <Widget>[
          ThemedTextButtonIcon(
            onPressed: () => Navigator.of(context).pop(),
            label: Text(t.settings.data.reset.buttons.cancel),
          ),
          ThemedTextButtonIcon(
            onPressed: () => _onResetSettings(
              context,
              t.settings.prompt.settingsReset,
            ),
            label: Text(t.settings.data.reset.buttons.reset),
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
                child: ThemedOutlinedButtonIcon(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  label: Text(t.settings.data.reset.buttons.cancel),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ThemedFilledButtonIcon(
                  onPressed: () => _onResetSettings(
                    context,
                    t.settings.prompt.settingsReset,
                  ),
                  label: Text(t.settings.data.reset.buttons.reset),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
