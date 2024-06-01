import 'dart:convert';

import 'package:ae_live/config/districts_list.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/models/district_model.dart';
import 'package:collection/collection.dart';

class FacilityCmcModel {
  FacilityCmcModel({
    required this.institutionNameTC,
    required this.institutionNameSC,
    required this.institutionNameEN,
    required this.addressTC,
    required this.addressSC,
    required this.addressEN,
    required this.regionCode,
    required this.districtCode,
    required this.latitude,
    required this.longitude,
  });

  factory FacilityCmcModel.fromMap(Map<String, dynamic> map) {
    final DistrictModel? districtItem = districtsList.firstWhereOrNull(
      (final DistrictModel element) => element.nameTC == map['district_tc'],
    );

    if (districtItem == null) {
      throw Exception(
        '[FacilityCmcModel::class] districtItem cannot be null. Input value: "${map['district_tc']}"',
      );
    }

    return FacilityCmcModel(
      institutionNameTC: map['CMCTR_tc'] ?? '',
      institutionNameSC: map['CMCTR_sc'] ?? '',
      institutionNameEN: map['CMCTR_eng'] ?? '',
      addressTC: map['address_tc'] ?? '',
      addressSC: map['address_sc'] ?? '',
      addressEN: map['address_eng'] ?? '',
      regionCode: districtItem.regionCode,
      districtCode: districtItem.districtCode,
      latitude: map['latitude']?.toDouble() ?? 0.0,
      longitude: map['longitude']?.toDouble() ?? 0.0,
    );
  }

  factory FacilityCmcModel.fromJson(String source) =>
      FacilityCmcModel.fromMap(json.decode(source));

  final String institutionNameTC;
  final String institutionNameSC;
  final String institutionNameEN;
  final String addressTC;
  final String addressSC;
  final String addressEN;
  final int regionCode;
  final int districtCode;
  final double latitude;
  final double longitude;

  FacilityCmcModel copyWith({
    String? institutionNameTC,
    String? institutionNameSC,
    String? institutionNameEN,
    String? addressTC,
    String? addressSC,
    String? addressEN,
    int? regionCode,
    int? districtCode,
    double? latitude,
    double? longitude,
  }) {
    return FacilityCmcModel(
      institutionNameTC: institutionNameTC ?? this.institutionNameTC,
      institutionNameSC: institutionNameSC ?? this.institutionNameSC,
      institutionNameEN: institutionNameEN ?? this.institutionNameEN,
      addressTC: addressTC ?? this.addressTC,
      addressSC: addressSC ?? this.addressSC,
      addressEN: addressEN ?? this.addressEN,
      regionCode: regionCode ?? this.regionCode,
      districtCode: districtCode ?? this.districtCode,
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
      'regionCode': regionCode,
      'districtCode': districtCode,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'FacilityCmcModel(institutionNameTC: $institutionNameTC, institutionNameSC: $institutionNameSC, institutionNameEN: $institutionNameEN, addressTC: $addressTC, addressSC: $addressSC, addressEN: $addressEN, regionCode: $regionCode, districtCode: $districtCode, latitude: $latitude, longitude: $longitude)';
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

    return other is FacilityCmcModel &&
        other.institutionNameTC == institutionNameTC &&
        other.institutionNameSC == institutionNameSC &&
        other.institutionNameEN == institutionNameEN &&
        other.addressTC == addressTC &&
        other.addressSC == addressSC &&
        other.addressEN == addressEN &&
        other.regionCode == regionCode &&
        other.districtCode == districtCode &&
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
        regionCode.hashCode ^
        districtCode.hashCode ^
        latitude.hashCode ^
        longitude.hashCode;
  }
}
