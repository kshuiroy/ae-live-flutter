import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DateTimeConverter {
  DateTimeConverter._();

  /// Convert the [updateTime] string to [DateTime] object.
  static DateTime convertWaitTime(String dateTimeString) {
    initializeDateFormatting();

    // Attempt to parse as Traditional Chinese format
    // e.g. 2024年4月10日 下午1時15分
    try {
      DateFormat chineseFormat = DateFormat('yyyy年MM月dd日 ahh時mm分', 'zh');
      return chineseFormat.parse(dateTimeString);
    } catch (_) {}

    // Attempt to parse as Simplified Chinese format
    // e.g. 2024年4月10日 下午1时15分
    try {
      DateFormat chineseFormat = DateFormat('yyyy年MM月dd日 ahh时mm分', 'zh');
      return chineseFormat.parse(dateTimeString);
    } catch (_) {}

    // Attempt to parse as English format
    // 10/4/2024 1:15pm
    try {
      DateFormat englishFormat = DateFormat('dd/MM/yyyy hh:mma');
      return englishFormat.parse(dateTimeString.toUpperCase());
    } catch (_) {}

    // Attempt to parse as English format
    // 10/4/2024 1:15pm
    try {
      DateFormat generalFormat = DateFormat('yyyy-MM-dd HH:mm');
      return generalFormat.parse(dateTimeString);
    } catch (_) {}

    return DateTime.now();
  }
}
