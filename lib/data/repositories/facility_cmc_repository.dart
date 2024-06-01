import 'dart:convert';

import 'package:ae_live/data/providers/facility_cmc_provider.dart';
import 'package:ae_live/models/facility_cmc_model.dart';

class FacilityCmcRepository {
  FacilityCmcRepository({
    required this.provider,
  });

  final FacilityCmcProvider provider;

  Future<List<FacilityCmcModel>> getFacilityCmcData() async {
    try {
      final String gocDataString = await provider.getFacilityCmcData();
      final List<dynamic> gocDataJson = json.decode(gocDataString);

      final List<FacilityCmcModel> results = <FacilityCmcModel>[];

      for (final item in gocDataJson) {
        results.add(
          FacilityCmcModel.fromMap(item),
        );
      }

      return results;
    } catch (error) {
      throw error.toString();
    }
  }

  List<FacilityCmcModel> filterAndSortFacilityCmcData(
    final List<FacilityCmcModel> data, {
    final String? keyword,
    final List<int>? regions,
    final List<int>? districts,
  }) {
    final String searchKeyword = (keyword ?? '').toLowerCase();
    final List<FacilityCmcModel> results = data
        .where(
          (final FacilityCmcModel element) =>
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
              (regions != null ? regions.contains(element.regionCode) : true) &&
              (districts != null
                  ? districts.contains(element.districtCode)
                  : true),
        )
        .toList();

    return results;
  }
}
