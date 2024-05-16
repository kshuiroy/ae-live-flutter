import 'dart:convert';

import 'package:ae_live/data/providers/facility_goc_provider.dart';
import 'package:ae_live/models/facility_goc_model.dart';

class FacilityGocRepository {
  FacilityGocRepository({
    required this.provider,
  });

  final FacilityGocProvider provider;

  Future<List<FacilityGocModel>> getFacilityGocData() async {
    try {
      final String gocDataString = await provider.getFacilityGocData();
      final List<dynamic> hospitalDataJson = json.decode(gocDataString);

      final List<FacilityGocModel> results = <FacilityGocModel>[];

      for (final item in hospitalDataJson) {
        results.add(
          FacilityGocModel.fromMap(item),
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
              ((clusters ?? []).isNotEmpty
                  ? clusters!.contains(element.clusterCode)
                  : true),
        )
        .toList();

    return results;
  }
}
