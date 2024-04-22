import 'package:ae_live/i18n/translations.g.dart';

class LocaleConverter {
  LocaleConverter._();

  static String getAPILocaleCode({String? languageCode}) {
    if (languageCode != null &&
        (languageCode == 'zh-HK' ||
            languageCode == 'zh-CN' ||
            languageCode == 'en')) {
      switch (languageCode) {
        case 'zh-HK':
          return 'tc';
        case 'zh-CN':
          return 'sc';
        default:
          return 'en';
      }
    }

    switch (LocaleSettings.currentLocale) {
      case AppLocale.zhHk:
        return 'tc';
      case AppLocale.zhCn:
        return 'sc';
      default:
        return 'en';
    }
  }

  static String getLanguageCode({AppLocale? locale}) {
    switch (locale ?? LocaleSettings.currentLocale) {
      case AppLocale.zhHk:
        return 'zh-HK';
      case AppLocale.zhCn:
        return 'zh-CN';
      default:
        return 'en';
    }
  }

  static AppLocale toAppLocale({required String languageCode}) {
    switch (languageCode.toLowerCase()) {
      case 'zh-hk':
        return AppLocale.zhHk;
      case 'zh-cn':
        return AppLocale.zhCn;
      default:
        return AppLocale.en;
    }
  }
}
