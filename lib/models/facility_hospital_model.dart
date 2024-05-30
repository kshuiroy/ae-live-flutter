import 'dart:convert';

import 'package:ae_live/config/clusters.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/models/cluster_model.dart';

class FacilityHospitalModel {
  FacilityHospitalModel({
    required this.institutionNameTC,
    required this.institutionNameSC,
    required this.institutionNameEN,
    required this.addressTC,
    required this.addressSC,
    required this.addressEN,
    required this.withAEService,
    required this.clusterCode,
    required this.latitude,
    required this.longitude,
  });

  factory FacilityHospitalModel.fromMap(Map<String, dynamic> map) {
    return FacilityHospitalModel(
      institutionNameTC: map['institution_tc'] ?? '',
      institutionNameSC: map['institution_sc'] ?? '',
      institutionNameEN: map['institution_eng'] ?? '',
      addressTC: map['address_tc'] ?? '',
      addressSC: map['address_sc'] ?? '',
      addressEN: map['address_eng'] ?? '',
      withAEService: map['with_AE_service_eng'] == 'Yes',
      clusterCode: clusters
          .firstWhere(
            (final ClusterModel element) =>
                element.nameEN == map['cluster_eng'],
          )
          .clusterCode,
      latitude: map['latitude']?.toDouble() ?? 0.0,
      longitude: map['longitude']?.toDouble() ?? 0.0,
    );
  }

  factory FacilityHospitalModel.fromJson(String source) =>
      FacilityHospitalModel.fromMap(json.decode(source));

  final String institutionNameTC;
  final String institutionNameSC;
  final String institutionNameEN;
  final String addressTC;
  final String addressSC;
  final String addressEN;
  final bool withAEService;
  final int clusterCode;
  final double latitude;
  final double longitude;

  FacilityHospitalModel copyWith({
    String? institutionNameTC,
    String? institutionNameSC,
    String? institutionNameEN,
    String? addressTC,
    String? addressSC,
    String? addressEN,
    bool? withAEService,
    int? clusterCode,
    double? latitude,
    double? longitude,
  }) {
    return FacilityHospitalModel(
      institutionNameTC: institutionNameTC ?? this.institutionNameTC,
      institutionNameSC: institutionNameSC ?? this.institutionNameSC,
      institutionNameEN: institutionNameEN ?? this.institutionNameEN,
      addressTC: addressTC ?? this.addressTC,
      addressSC: addressSC ?? this.addressSC,
      addressEN: addressEN ?? this.addressEN,
      withAEService: withAEService ?? this.withAEService,
      clusterCode: clusterCode ?? this.clusterCode,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'institutionNameTC': institutionNameTC,
      'institutionNameSC': institutionNameSC,
      'institutionNameEN': institutionNameEN,
      'addressTC': addressTC,
      'addressSC': addressSC,
      'addressEN': addressEN,
      'withAEService': withAEService,
      'clusterCode': clusterCode,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'FacilityHospitalModel(institutionNameTC: $institutionNameTC, institutionNameSC: $institutionNameSC, institutionNameEN: $institutionNameEN, addressTC: $addressTC, addressSC: $addressSC, addressEN: $addressEN, withAEService: $withAEService, clusterCode: $clusterCode, latitude: $latitude, longitude: $longitude)';
  }

  String get institutionName {
    switch (LocaleSettings.currentLocale) {
      case AppLocale.zhHk:
        return institutionNameTC;
      case AppLocale.zhCn:
        return institutionNameSC;
      default:
        return institutionNameEN;
    }
  }

  String get address {
    switch (LocaleSettings.currentLocale) {
      case AppLocale.zhHk:
        return addressTC;
      case AppLocale.zhCn:
        return addressSC;
      default:
        return addressEN;
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FacilityHospitalModel &&
        other.institutionNameTC == institutionNameTC &&
        other.institutionNameSC == institutionNameSC &&
        other.institutionNameEN == institutionNameEN &&
        other.addressTC == addressTC &&
        other.addressSC == addressSC &&
        other.addressEN == addressEN &&
        other.withAEService == withAEService &&
        other.clusterCode == clusterCode &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode {
    return institutionNameTC.hashCode ^
        institutionNameSC.hashCode ^
        institutionNameEN.hashCode ^
        addressTC.hashCode ^
        addressSC.hashCode ^
        addressEN.hashCode ^
        withAEService.hashCode ^
        clusterCode.hashCode ^
        latitude.hashCode ^
        longitude.hashCode;
  }
}
