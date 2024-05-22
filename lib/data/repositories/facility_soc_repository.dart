import 'dart:convert';

import 'package:ae_live/data/providers/facility_soc_provider.dart';
import 'package:ae_live/models/facility_soc_model.dart';

class FacilitySocRepository {
  FacilitySocRepository({
    required this.provider,
  });

  final FacilitySocProvider provider;

  Future<List<FacilitySocModel>> getFacilitySocData() async {
    try {
      final String socDataString = await provider.getFacilitySocData();
      final List<dynamic> socDataJson = json.decode(socDataString);

      final List<FacilitySocModel> results = <FacilitySocModel>[];

      for (final item in socDataJson) {
        results.add(
          FacilitySocModel.fromMap(item),
        );
      }

      return results;
    } catch (error) {
      throw error.toString();
    }
  }

  List<FacilitySocModel> filterAndSortFacilitySocData(
    final List<FacilitySocModel> data, {
    final String? keyword,
    final List<int>? clusters,
  }) {
    final String searchKeyword = (keyword ?? '').toLowerCase();
    final List<FacilitySocModel> results = data
        .where(
          (final FacilitySocModel element) =>
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
              ((clusters ?? <int>[]).isNotEmpty
                  ? clusters!.contains(element.clusterCode)
                  : true),
        )
        .toList();

    return results;
  }
}
