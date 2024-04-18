import 'package:ae_live/i18n/translations.g.dart';

class LocaleConverter {
  LocaleConverter._();

  static String getAPILocaleCode() {
    switch (LocaleSettings.currentLocale) {
      case AppLocale.zhHk:
        return 'tc';
      case AppLocale.zhCn:
        return 'sc';
      default:
        return 'en';
    }
  }
}
