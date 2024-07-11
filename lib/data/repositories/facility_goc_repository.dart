import 'dart:convert';

import 'package:ae_live/data/providers/facility_goc_provider.dart';
import 'package:ae_live/models/facility_goc_model.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class FacilityGocRepository {
  FacilityGocRepository({
    required this.provider,
  });

  final FacilityGocProvider provider;

  Future<List<FacilityGocModel>> getFacilityGocData() async {
    try {
      final List<dynamic> dataStrings = await Future.wait([
        provider.getFacilityGocData(),
        provider.getGocInfoData(),
      ]);

      // final String gocDataString = await provider.getFacilityGocData();
      final List<dynamic> gocDataJson = json.decode(dataStrings[0]);
      final List<dynamic> gocQuotaDataTCJson = json.decode(dataStrings[1][0]);
      final List<dynamic> gocQuotaDataSCJson = json.decode(dataStrings[1][1]);
      final List<dynamic> gocQuotaDataENJson = json.decode(dataStrings[1][2]);

      final List<FacilityGocModel> results = <FacilityGocModel>[];

      for (final item in gocDataJson) {
        /// Find the quota item in Traditional Chinese by comparing the name of
        /// the clinic.
        ///
        /// There are some special logic handling due to the inconsistent name
        /// value between APIs.
        final Map<String, dynamic>? quotaDataTCItem =
            gocQuotaDataTCJson.firstWhereOrNull(
          (quotaItem) => item['institution_tc'] == '長洲醫院普通科門診部'
              ? quotaItem['Clinic'] == '長洲醫院普通科門診診所'
              : item['institution_tc'] == '天水圍健康中心(天瑞路)'
                  ? quotaItem['Clinic'] == '天水圍健康中心'
                  : quotaItem['Clinic'] == item['institution_tc'],
        );

        /// Find the quota item in Simplified Chinese by comparing the name of
        /// the clinic.
        ///
        /// There are some special logic handling due to the inconsistent name
        /// value between APIs.
        final Map<String, dynamic>? quotaDataSCItem =
            gocQuotaDataSCJson.firstWhereOrNull(
          (quotaItem) => item['institution_sc'] == '长洲医院普通科门诊部'
              ? quotaItem['Clinic'] == '长洲医院普通科门诊诊所'
              : item['institution_sc'] == '天水围健康中心(天瑞路)'
                  ? quotaItem['Clinic'] == '天水围健康中心'
                  : quotaItem['Clinic'] == item['institution_sc'],
        );

        /// Find the quota item in English by comparing the name of the clinic.
        ///
        /// There are some special logic handling due to the inconsistent name
        /// value between APIs.
        final Map<String, dynamic>? quotaDataENItem =
            gocQuotaDataENJson.firstWhereOrNull(
          (quotaItem) => item['institution_eng'] ==
                  'Our Lady of Maryknoll Hospital Family Medicine Clinic'
              ? quotaItem['Clinic'] == 'OLMH FAMILY MEDICINE CLINIC'
              : item['institution_eng'] ==
                      'Shun Tak Fraternal Association Leung Kau Kui Clinic'
                  ? quotaItem['Clinic'] == 'S.T.F.A. LEUNG KAU KUI CLINIC'
                  : item['institution_eng'] ==
                          'Tin Shui Wai Health Centre (Tin Shui Road)'
                      ? quotaItem['Clinic'] == 'TIN SHUI WAI HEALTH CENTRE'
                      : (quotaItem['Clinic'] as String)
                              .replaceAll(
                                RegExp(
                                  ' (GOP(C|D)|COMMUNITY HEALTH CENTRE?)',
                                  caseSensitive: false,
                                ),
                                '',
                              )
                              .toLowerCase() ==
                          (item['institution_eng'] as String)
                              .replaceAll(
                                RegExp(
                                  ' (GOP(C|D)|General Out-patient (Clinic|Department)|Community Health Centre)',
                                  caseSensitive: false,
                                ),
                                '',
                              )
                              .toLowerCase(),
        );

        if (quotaDataENItem == null ||
            quotaDataSCItem == null ||
            quotaDataTCItem == null) {
          debugPrint('$quotaDataENItem');
          debugPrint('$quotaDataSCItem');
          debugPrint('$quotaDataTCItem');
          debugPrint('GOC Quota item not found: "${item['institution_eng']}"');
          throw Exception(
            'GOC Quota item not found: "${item['institution_eng']}"',
          );
        }

        results.add(
          FacilityGocModel.fromMap(
            item,
            quotaDataTCItem,
            quotaDataSCItem,
            quotaDataENItem,
          ),
        );
      }

      return results;
    } catch (error) {
      throw error.toString();
    }
  }

  List<FacilityGocModel> filterAndSortFacilityGocData(
    final List<FacilityGocModel> data, {
    final String? keyword,
    final List<int>? clusters,
    final List<int>? districts,
  }) {
    final String searchKeyword = (keyword ?? '').toLowerCase();
    final List<FacilityGocModel> results = data
        .where(
          (final FacilityGocModel element) =>
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
                      .contains(searchKeyword)) &&
              (clusters != null
                  ? clusters.contains(element.clusterCode)
                  : true) &&
              (districts != null
                  ? districts.contains(element.districtCode)
                  : true),
        )
        .toList();

    return results;
  }
}
