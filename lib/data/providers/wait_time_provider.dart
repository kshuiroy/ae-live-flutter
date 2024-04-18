import 'package:ae_live/utilities/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WaitTimeProvider {
  final Map<String, String> _waitTimeAPIUrl = {
    'tc': 'https://www.ha.org.hk/opendata/aed/aedwtdata-tc.json',
    'sc': 'https://www.ha.org.hk/opendata/aed/aedwtdata-sc.json',
    'en': 'https://www.ha.org.hk/opendata/aed/aedwtdata-en.json',
  };

  final APIProvider _apiProvider = APIProvider();

  Future<String> getWaitTimeData(String locale) async {
    if (locale != 'tc' && locale != 'sc' && locale != 'en') {
      throw '[WaitTimeProvider::class/getWaitTimeData()] Invalid `locale` value: $locale';
    }

    try {
      final response = await _apiProvider.fetchAPI(
        url: _waitTimeAPIUrl[locale] ??
            'https://www.ha.org.hk/opendata/aed/aedwtdata-en.json',
      );

      return response;
    } catch (error) {
      throw error.toString();
    }
  }

  Future<List<String>> getWaitTimeHistoryData(String locale) async {
    if (locale != 'tc' && locale != 'sc' && locale != 'en') {
      throw '[WaitTimeProvider::class/getWaitTimeHistoryData()] Invalid `locale` value: $locale';
    }

    try {
      final List<String> responses = [];
      await Future.wait(
        _getHistoryJobs(locale).map(
          (job) => job
              .then(
            (value) => responses.add(value),
          )
              .catchError((error) {
            debugPrint(error.toString());

            RegExp timeRegExp = RegExp(r'time=(\d{8}-\d{4})');
            RegExpMatch? timeMatch = timeRegExp.firstMatch(error.toString());

            if (timeMatch != null) {
              String timeValue = timeMatch.group(1)!;

              // Convert the extracted time string into a DateTime object
              DateTime timestamp = DateTime.parse(
                      '${timeValue.substring(0, 8)}T${timeValue.substring(9)}:00')
                  .subtract(
                const Duration(minutes: 15),
              );

              responses.add(
                  '{"error":"NOT FOUND","updateTime":"${DateFormat('yyyy-MM-dd HH:mm').format(timestamp)}"}');
            } else {
              throw error.toString();
            }
          }),
        ),
      );

      return responses;
    } catch (error) {
      throw error.toString();
    }
  }

  Future<String> getHospitalInfoData() async {
    try {
      final response = await _apiProvider.fetchAPI(
        url: 'https://www.ha.org.hk/opendata/facility-hosp.json',
      );

      return response;
    } catch (error) {
      throw error.toString();
    }
  }

  List<Future<String>> _getHistoryJobs(String locale,
      {Duration pastDuration = const Duration(hours: 5, minutes: 45)}) {
    // if (locale != 'tc' && locale != 'sc' && locale != 'en') {
    //   throw '[WaitTimeProvider::class/_getPastQuarterDateTimeValues()] Invalid `locale` value: $locale';
    // }

    List<Future<String>> requestJobs = [];

    // Get the current time
    DateTime currentTime = DateTime.now();

    // Calculate the start time, which is 6 hours ago
    DateTime startTime = currentTime.subtract(pastDuration);

    // Calculate the nearest quarter-hour time before the start time
    int quarterMinutes = startTime.minute ~/ 15;
    DateTime nearestQuarterHour = DateTime(
      startTime.year,
      startTime.month,
      startTime.day,
      startTime.hour,
      quarterMinutes * 15,
    );

    // Iterate to get the rest of the quarter-hour times
    while (nearestQuarterHour.isBefore(currentTime)) {
      requestJobs.add(
        _apiProvider.fetchAPI(
          url:
              'https://api.data.gov.hk/v1/historical-archive/get-file?url=https%3A%2F%2Fwww.ha.org.hk%2Fopendata%2Faed%2Faedwtdata-$locale.json&time=${DateFormat('yyyyMMdd-HHmm').format(nearestQuarterHour)}',
        ),
      );
      nearestQuarterHour = nearestQuarterHour.add(const Duration(minutes: 15));
    }

    return requestJobs;
  }
}
