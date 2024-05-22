import 'dart:convert';

import 'package:ae_live/config/clusters.dart';
import 'package:ae_live/config/constants.dart';
import 'package:ae_live/config/hospital_info.dart';
import 'package:ae_live/data/enum/wait_time_sort_type.dart';
import 'package:ae_live/data/providers/wait_time_provider.dart';
import 'package:ae_live/models/cluster_model.dart';
import 'package:ae_live/models/hospital_info_model.dart';
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
        // languageCode: LocaleSettings.currentLocale.languageTag,
        );

    try {
      late String waitTimeData;
      late List<String> waitTimeHistoryData;
      late String hospitalInfoData;

      await Future.wait(<Future<Object>>[
        provider
            .getWaitTimeData(currentLocale)
            .then((final String response) => waitTimeData = response),
        provider.getWaitTimeHistoryData(currentLocale).then(
              (final List<String> responses) => waitTimeHistoryData = responses,
            ),
        provider
            .getHospitalInfoData()
            .then((final String response) => hospitalInfoData = response),
      ]);

      final waitTimeDataJson = json.decode(waitTimeData);
      waitTimeHistoryData.add(waitTimeData);
      final List<dynamic> hospitalInfoDataJson = json.decode(hospitalInfoData);
      final Map<String, List<WaitTimeHistoryModel>> waitTimeHistoryMap =
          _processHistoryData(waitTimeHistoryData);

      final List<WaitTimeModel> results = <WaitTimeModel>[];

      for (final item in waitTimeDataJson['waitTime']) {
        final String infoLocaleKey =
            currentLocale == 'en' ? 'eng' : currentLocale;

        // Special handling for St. John Hospital due to the inconsistent name
        // between different API.
        final hospitalInfoItem = hospitalInfoDataJson.firstWhere(
          (final element) =>
              item['hospName'] == 'St John Hospital' &&
                  element['institution_eng'] == 'St. John Hospital' ||
              element['institution_$infoLocaleKey'] == item['hospName'],
        );

        final HospitalInfoModel hospitalContactInfoItem =
            hospitalInfo.firstWhere(
          (final HospitalInfoModel element) =>
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
            id: hospitalContactInfoItem.id,
            institutionNameTC: hospitalInfoItem['institution_tc'],
            institutionNameSC: hospitalInfoItem['institution_sc'],
            institutionNameEN: hospitalInfoItem['institution_eng'],
            addressTC: hospitalInfoItem['address_tc'],
            addressSC: hospitalInfoItem['address_sc'],
            addressEN: hospitalInfoItem['address_eng'],
            contactNo: hospitalContactInfoItem.contactNo,
            faxNo: hospitalContactInfoItem.faxNo,
            emailAddress: hospitalContactInfoItem.emailAddress,
            website: hospitalContactInfoItem.website,
            clusterCode: clusters
                .firstWhere(
                  (final ClusterModel element) =>
                      element.nameEN == hospitalInfoItem['cluster_eng'],
                )
                .clusterCode,
            waitTimeText: item['topWait'],
            waitTimeValue: double.parse(
                  (item['topWait'] as String).replaceAll(RegExp(r'[^0-9]'), ''),
                ) +
                (waitTimeIsOverType ? 0.5 : 0.0),
            latitude: hospitalInfoItem['latitude'],
            longitude: hospitalInfoItem['longitude'],
            waitTimeHistory: waitTimeHistoryMap[item['hospName']],
          ),
        );
      }

      return filterAndSortWaitTimeData(
        results,
        sortType: toWaitTimeSortType(
          preferences.getString(Constants.preferenceKeyDefaultSorting),
        ),
      );
    } catch (error) {
      throw error.toString();
    }
  }

  Map<String, List<WaitTimeHistoryModel>> _processHistoryData(
    final List<String> data,
  ) {
    // Convert List<String> to List<Map<String, dynamic>>
    final List<Map<String, dynamic>> dataMapList = <Map<String, dynamic>>[];

    for (final String jsonString in data) {
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      dataMapList.add(jsonMap);
    }

    // Sort the history result based on the [updateTime] value since the data is
    // not sorted in the [WaitTimeProvider] because we need to inject a custom
    // object when the request is failed.
    dataMapList.sort(
      (final Map<String, dynamic> a, final Map<String, dynamic> b) =>
          DateTimeConverter.convertWaitTime(a['updateTime']).compareTo(
        DateTimeConverter.convertWaitTime(b['updateTime']),
      ),
    );

    final Map<String, List<WaitTimeHistoryModel>> groupedData =
        <String, List<WaitTimeHistoryModel>>{};

    for (final Map<String, dynamic> entry in dataMapList) {
      if (entry['error'] != null) {
        groupedData.forEach(
            (final String key, final List<WaitTimeHistoryModel> value) {
          value.add(
            WaitTimeHistoryModel(
              timestamp:
                  DateFormat('yyyy-MM-dd HH:mm').parse(entry['updateTime']),
              waitTimeText: '',
            ),
          );
        });
      } else {
        final List<dynamic> waitTimes = entry['waitTime'];
        final String updateTime = entry['updateTime'];

        for (final waitTime in waitTimes) {
          final String hospName = waitTime['hospName'];
          final String topWait = waitTime['topWait'];

          groupedData.putIfAbsent(hospName, () => <WaitTimeHistoryModel>[]);
          groupedData[hospName]?.add(
            WaitTimeHistoryModel.fromMap(
              <String, String>{
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
    final List<WaitTimeModel> data, {
    final String? keyword,
    final List<int>? clusters,
    final WaitTimeSortType sortType = WaitTimeSortType.timeInAsd,
  }) {
    final String searchKeyword = (keyword ?? '').toLowerCase();
    final List<WaitTimeModel> results = data
        .where(
          (final WaitTimeModel element) =>
              (element.addressEN.toLowerCase().contains(searchKeyword) ||
                  element.addressSC.toLowerCase().contains(searchKeyword) ||
                  element.addressTC.toLowerCase().contains(searchKeyword) ||
                  element.institutionNameEN
                      .toLowerCase()
                      .contains(searchKeyword) ||
                  element.institutionNameSC
                      .toLowerCase()
                      .contains(searchKeyword) ||
                  element.institutionNameTC
                      .toLowerCase()
                      .contains(searchKeyword) ||
                  element.contactNo.toLowerCase().contains(searchKeyword) ||
                  (element.faxNo != null
                      ? element.faxNo!.toLowerCase().contains(searchKeyword)
                      : false) ||
                  (element.emailAddress != null
                      ? element.emailAddress!
                          .toLowerCase()
                          .contains(searchKeyword)
                      : false) ||
                  (element.website != null
                      ? element.website!.toLowerCase().contains(searchKeyword)
                      : false)) &&
              ((clusters ?? <int>[]).isNotEmpty
                  ? clusters!.contains(element.clusterCode)
                  : true),
        )
        .toList();

    results.sort(
      (final WaitTimeModel a, final WaitTimeModel b) =>
          sortType == WaitTimeSortType.nameInAsd
              ? _sortByNameInAsd(a, b)
              : sortType == WaitTimeSortType.nameInDesc
                  ? _sortByNameInDesc(a, b)
                  : sortType == WaitTimeSortType.timeInDesc
                      ? _sortByTimeInDesc(a, b)
                      : _sortByTimeInAsd(a, b),
    );

    return results;
  }

  /// Sort data by hospital name (A-Z)
  int _sortByNameInAsd(final WaitTimeModel a, final WaitTimeModel b) {
    return a.institutionNameEN.compareTo(b.institutionNameEN);
  }

  /// Sort data by hospital name (Z-A)
  int _sortByNameInDesc(final WaitTimeModel a, final WaitTimeModel b) {
    return b.institutionNameEN.compareTo(a.institutionNameEN);
  }

  /// Sort data by the waiting time in ascending order.
  ///
  /// If the waiting time of two hospitals are the same, then sort them by
  /// hospital name (A-Z).
  int _sortByTimeInAsd(final WaitTimeModel a, final WaitTimeModel b) {
    final int compareTime = a.waitTimeValue.compareTo(b.waitTimeValue);
    if (compareTime != 0) {
      return compareTime;
    }

    return a.institutionNameEN.compareTo(b.institutionNameEN);
  }

  /// Sort data by the waiting time in descending order.
  ///
  /// If the waiting time of two hospitals are the same, then sort them by
  /// hospital name (A-Z).
  int _sortByTimeInDesc(final WaitTimeModel a, final WaitTimeModel b) {
    final int compareTime = b.waitTimeValue.compareTo(a.waitTimeValue);
    if (compareTime != 0) {
      return compareTime;
    }

    return a.institutionNameEN.compareTo(b.institutionNameEN);
  }
}
