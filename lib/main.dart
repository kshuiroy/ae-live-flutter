import 'package:ae_live/ae_live_app.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    TranslationProvider(
      child: const AELiveApp(),
    ),
  );
}
