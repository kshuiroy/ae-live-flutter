import 'package:ae_live/config/constants.dart';
import 'package:ae_live/utilities/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WaitTimeProvider {
  final Map<String, String> _waitTimeAPIUrl = <String, String>{
    'tc': Constants.apiWaitTimeTC,
    'sc': Constants.apiWaitTimeSC,
    'en': Constants.apiWaitTimeEN,
  };

  final APIProvider _apiProvider = APIProvider();

  Future<String> getWaitTimeData(final String locale) async {
    if (locale != 'tc' && locale != 'sc' && locale != 'en') {
      throw '[WaitTimeProvider::class/getWaitTimeData()] Invalid `locale` value: $locale';
    }

    try {
      final String response = await _apiProvider.fetchAPI(
        url: _waitTimeAPIUrl[locale] ?? Constants.apiWaitTimeEN,
      );

      return response;
    } catch (error) {
      throw error.toString();
    }
  }

  Future<List<String>> getWaitTimeHistoryData(final String locale) async {
    if (locale != 'tc' && locale != 'sc' && locale != 'en') {
      throw '[WaitTimeProvider::class/getWaitTimeHistoryData()] Invalid `locale` value: $locale';
    }

    try {
      final List<String> responses = <String>[];
      await Future.wait(
        _getHistoryJobs(locale).map(
          (final Future<String> job) => job
              .then(
            (final String value) => responses.add(value),
          )
              .catchError((final error) {
            debugPrint(error.toString());

            final RegExp timeRegExp = RegExp(r'time=(\d{8}-\d{4})');
            final RegExpMatch? timeMatch =
                timeRegExp.firstMatch(error.toString());

            if (timeMatch != null) {
              final String timeValue = timeMatch.group(1)!;

              // Convert the extracted time string into a DateTime object
              final DateTime timestamp = DateTime.parse(
                '${timeValue.substring(0, 8)}T${timeValue.substring(9)}:00',
              ).subtract(
                const Duration(minutes: 15),
              );

              responses.add(
                '{"error":"NOT FOUND","updateTime":"${DateFormat('yyyy-MM-dd HH:mm').format(timestamp)}"}',
              );
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
      final String response = await _apiProvider.fetchAPI(
        url: Constants.apiFacilityHospital,
      );

      return response;
    } catch (error) {
      throw error.toString();
    }
  }

  List<Future<String>> _getHistoryJobs(
    final String locale, {
    final Duration pastDuration = const Duration(hours: 5, minutes: 45),
  }) {
    // if (locale != 'tc' && locale != 'sc' && locale != 'en') {
    //   throw '[WaitTimeProvider::class/_getPastQuarterDateTimeValues()] Invalid `locale` value: $locale';
    // }

    final List<Future<String>> requestJobs = <Future<String>>[];

    // Get the current time
    final DateTime currentTime = DateTime.now();

    // Calculate the start time, which is 6 hours ago
    final DateTime startTime = currentTime.subtract(pastDuration);

    // Calculate the nearest quarter-hour time before the start time
    final int quarterMinutes = startTime.minute ~/ 15;
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
