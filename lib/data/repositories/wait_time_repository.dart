import 'dart:convert';

import 'package:ae_live/config/clusters.dart';
import 'package:ae_live/config/constants.dart';
import 'package:ae_live/config/hospital_info.dart';
import 'package:ae_live/data/enum/wait_time_sort_type.dart';
import 'package:ae_live/data/providers/wait_time_provider.dart';
import 'package:ae_live/models/wait_time_history_model.dart';
import 'package:ae_live/models/wait_time_model.dart';
import 'package:ae_live/utilities/date_time_converter.dart';
import 'package:ae_live/utilities/locale_converter.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WaitTimeRepository {
  WaitTimeRepository({required this.provider});

  final WaitTimeProvider provider;

  /// Get the A&E service waiting time from the API
  Future<List<WaitTimeModel>> getWaitTimeData() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String currentLocale = LocaleConverter.getAPILocaleCode(
      languageCode: preferences.getString(Constants.preferenceKeyAppLocale),
    );

    try {
      late String waitTimeData;
      late List<String> waitTimeHistoryData;
      late String hospitalInfoData;

      await Future.wait([
        provider
            .getWaitTimeData(currentLocale)
            .then((response) => waitTimeData = response),
        provider
            .getWaitTimeHistoryData(currentLocale)
            .then((responses) => waitTimeHistoryData = responses),
        provider
            .getHospitalInfoData()
            .then((response) => hospitalInfoData = response),
      ]);

      final waitTimeDataJson = json.decode(waitTimeData);
      waitTimeHistoryData.add(waitTimeData);
      final List<dynamic> hospitalInfoDataJson = json.decode(hospitalInfoData);
      final Map<String, List<WaitTimeHistoryModel>> waitTimeHistoryMap =
          _processHistoryData(waitTimeHistoryData);

      final List<WaitTimeModel> results = [];

      for (var item in waitTimeDataJson['waitTime']) {
        final String infoLocaleKey =
            currentLocale == 'en' ? 'eng' : currentLocale;

        // Special handling for St. John Hospital due to the inconsistent name
        // between different API.
        final hospitalInfoItem = hospitalInfoDataJson.firstWhere((element) =>
            item['hospName'] == 'St John Hospital' &&
                element['institution_eng'] == 'St. John Hospital' ||
            element['institution_$infoLocaleKey'] == item['hospName']);

        final hospitalContactInfoItem = hospitalInfo.firstWhere(
          (element) =>
              element.nameEN == item['hospName'] ||
              element.nameSC == item['hospName'] ||
              element.nameTC == item['hospName'],
        );

        final bool waitTimeIsOverType =
            (item['topWait'] as String).startsWith('超過') ||
                (item['topWait'] as String).startsWith('超过') ||
                (item['topWait'] as String).startsWith('Over');

        results.add(
          WaitTimeModel(
            institutionName: hospitalInfoItem['institution_$infoLocaleKey'],
            address: hospitalInfoItem['address_$infoLocaleKey'],
            contactNo: hospitalContactInfoItem.contactNo,
            faxNo: hospitalContactInfoItem.faxNo,
            emailAddress: hospitalContactInfoItem.emailAddress,
            website: hospitalContactInfoItem.website,
            clusterCode: clusters
                .firstWhere((element) =>
                    element.nameEN == hospitalInfoItem['cluster_eng'])
                .clusterCode,
            waitTimeText: item['topWait'],
            waitTimeValue: double.parse((item['topWait'] as String)
                    .replaceAll(RegExp(r'[^0-9]'), '')) +
                (waitTimeIsOverType ? 0.5 : 0.0),
            latitude: hospitalInfoItem['latitude'],
            longitude: hospitalInfoItem['longitude'],
            waitTimeHistory: waitTimeHistoryMap[item['hospName']],
          ),
        );
      }

      return filterAndSortWaitTimeData(results);
    } catch (error) {
      throw error.toString();
    }
  }

  Map<String, List<WaitTimeHistoryModel>> _processHistoryData(
      List<String> data) {
    // Convert List<String> to List<Map<String, dynamic>>
    List<Map<String, dynamic>> dataMapList = [];

    for (String jsonString in data) {
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      dataMapList.add(jsonMap);
    }

    // Sort the history result based on the [updateTime] value since the data is
    // not sorted in the [WaitTimeProvider] because we need to inject a custom
    // object when the request is failed.
    dataMapList.sort(
        (a, b) => DateTimeConverter.convertWaitTime(a['updateTime']).compareTo(
              DateTimeConverter.convertWaitTime(b['updateTime']),
            ));

    Map<String, List<WaitTimeHistoryModel>> groupedData = {};

    for (var entry in dataMapList) {
      if (entry['error'] != null) {
        groupedData.forEach((key, value) {
          value.add(
            WaitTimeHistoryModel(
              timestamp:
                  DateFormat('yyyy-MM-dd HH:mm').parse(entry['updateTime']),
              waitTimeText: '',
              waitTimeValue: null,
            ),
          );
        });
      } else {
        List<dynamic> waitTimes = entry['waitTime'];
        String updateTime = entry['updateTime'];

        for (var waitTime in waitTimes) {
          String hospName = waitTime['hospName'];
          String topWait = waitTime['topWait'];

          groupedData.putIfAbsent(hospName, () => []);
          groupedData[hospName]?.add(
            WaitTimeHistoryModel.fromMap(
              {
                'topWait': topWait,
                'updateTime': updateTime,
              },
            ),
          );
        }
      }
    }

    return groupedData;
  }

  List<WaitTimeModel> filterAndSortWaitTimeData(
    List<WaitTimeModel> data, {
    String? name,
    List<int>? clusters,
    WaitTimeSortType sortType = WaitTimeSortType.timeInAsd,
  }) {
    List<WaitTimeModel> results = data
        .where((element) =>
            element.institutionName
                .toLowerCase()
                .contains((name ?? '').toLowerCase()) &&
            ((clusters ?? []).isNotEmpty
                ? clusters!.contains(element.clusterCode)
                : true))
        .toList();

    results.sort(
      (a, b) => sortType == WaitTimeSortType.nameInAsd
          ? _sortByNameInAsd(a, b)
          : sortType == WaitTimeSortType.nameInDesc
              ? _sortByNameInDesc(a, b)
              : sortType == WaitTimeSortType.timeInDesc
                  ? _sortByTimeInDesc(a, b)
                  : _sortByTimeInAsd(a, b),
    );

    return results;
  }

  int _sortByNameInAsd(WaitTimeModel a, WaitTimeModel b) {
    return a.institutionName.compareTo(b.institutionName);
  }

  int _sortByNameInDesc(WaitTimeModel a, WaitTimeModel b) {
    return b.institutionName.compareTo(a.institutionName);
  }

  int _sortByTimeInAsd(WaitTimeModel a, WaitTimeModel b) {
    int compareTime = a.waitTimeValue.compareTo(b.waitTimeValue);
    if (compareTime != 0) {
      return compareTime;
    }

    return a.institutionName.compareTo(b.institutionName);
  }

  int _sortByTimeInDesc(WaitTimeModel a, WaitTimeModel b) {
    int compareTime = b.waitTimeValue.compareTo(a.waitTimeValue);
    if (compareTime != 0) {
      return compareTime;
    }

    return a.institutionName.compareTo(b.institutionName);
  }
}
