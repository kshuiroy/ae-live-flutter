import 'dart:convert';

import 'package:ae_live/data/providers/facility_hospital_provider.dart';
import 'package:ae_live/models/facility_hospital_model.dart';

class FacilityHospitalRepository {
  FacilityHospitalRepository({
    required this.provider,
  });

  final FacilityHospitalProvider provider;

  Future<List<FacilityHospitalModel>> getFacilityHospitalData() async {
    try {
      final String hospitalDataString =
          await provider.getFacilityHospitalData();
      final List<dynamic> hospitalDataJson = json.decode(hospitalDataString);

      final List<FacilityHospitalModel> results = <FacilityHospitalModel>[];

      for (final item in hospitalDataJson) {
        results.add(
          FacilityHospitalModel.fromMap(item),
        );
      }

      return results;
    } catch (error) {
      throw error.toString();
    }
  }

  List<FacilityHospitalModel> filterAndSortFacilityHospitalData(
    final List<FacilityHospitalModel> data, {
    final String? keyword,
    final List<int>? clusters,
  }) {
    final String searchKeyword = (keyword ?? '').toLowerCase();
    final List<FacilityHospitalModel> results = data
        .where(
          (final FacilityHospitalModel element) =>
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
