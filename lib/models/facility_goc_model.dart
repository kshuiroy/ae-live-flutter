import 'dart:convert';

import 'package:ae_live/config/clusters.dart';
import 'package:ae_live/config/districts_list.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/models/cluster_model.dart';
import 'package:ae_live/models/district_model.dart';
import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';

class FacilityGocModel {
  FacilityGocModel({
    required this.institutionNameTC,
    required this.institutionNameSC,
    required this.institutionNameEN,
    required this.addressTC,
    required this.addressSC,
    required this.addressEN,
    this.consultationSessionsTC,
    this.consultationSessionsSC,
    this.consultationSessionsEN,
    required this.clusterCode,
    required this.regionCode,
    required this.districtCode,
    required this.latitude,
    required this.longitude,
  });

  factory FacilityGocModel.fromMap(
    Map<String, dynamic> mainMap,
    Map<String, dynamic> quotaTCMap,
    Map<String, dynamic> quotaSCMap,
    Map<String, dynamic> quotaENMap,
  ) {
    final DistrictModel? districtItem = districtsList.firstWhereOrNull(
      (final DistrictModel element) => element.nameTC == quotaTCMap['District'],
    );

    if (districtItem == null) {
      throw Exception(
        '[FacilityGocModel::class] districtItem cannot be null. Input value: "${quotaTCMap['District']}"',
      );
    }

    return FacilityGocModel(
      institutionNameTC: mainMap['institution_tc'] ?? '',
      institutionNameSC: mainMap['institution_sc'] ?? '',
      institutionNameEN: mainMap['institution_eng'] ?? '',
      addressTC: mainMap['address_tc'] ?? '',
      addressSC: mainMap['address_sc'] ?? '',
      addressEN: mainMap['address_eng'] ?? '',
      consultationSessionsTC: quotaTCMap['Doctor Consultation Sessions'],
      consultationSessionsSC: quotaSCMap['Doctor Consultation Sessions'],
      consultationSessionsEN: quotaENMap['Doctor Consultation Sessions'],
      clusterCode: clusters
          .firstWhere(
            (final ClusterModel element) =>
                element.nameEN == mainMap['cluster_eng'],
          )
          .clusterCode,
      regionCode: districtItem.regionCode,
      districtCode: districtItem.districtCode,
      latitude: mainMap['latitude']?.toDouble() ?? 0.0,
      longitude: mainMap['longitude']?.toDouble() ?? 0.0,
    );
  }

  final String institutionNameTC;
  final String institutionNameSC;
  final String institutionNameEN;
  final String addressTC;
  final String addressSC;
  final String addressEN;
  final String? consultationSessionsTC;
  final String? consultationSessionsSC;
  final String? consultationSessionsEN;
  final int clusterCode;
  final int regionCode;
  final int districtCode;
  final double latitude;
  final double longitude;

  FacilityGocModel copyWith({
    String? institutionNameTC,
    String? institutionNameSC,
    String? institutionNameEN,
    String? addressTC,
    String? addressSC,
    String? addressEN,
    ValueGetter<String?>? consultationSessionsTC,
    ValueGetter<String?>? consultationSessionsSC,
    ValueGetter<String?>? consultationSessionsEN,
    int? clusterCode,
    int? regionCode,
    int? districtCode,
    double? latitude,
    double? longitude,
  }) {
    return FacilityGocModel(
      institutionNameTC: institutionNameTC ?? this.institutionNameTC,
      institutionNameSC: institutionNameSC ?? this.institutionNameSC,
      institutionNameEN: institutionNameEN ?? this.institutionNameEN,
      addressTC: addressTC ?? this.addressTC,
      addressSC: addressSC ?? this.addressSC,
      addressEN: addressEN ?? this.addressEN,
      consultationSessionsTC: consultationSessionsTC != null
          ? consultationSessionsTC()
          : this.consultationSessionsTC,
      consultationSessionsSC: consultationSessionsSC != null
          ? consultationSessionsSC()
          : this.consultationSessionsSC,
      consultationSessionsEN: consultationSessionsEN != null
          ? consultationSessionsEN()
          : this.consultationSessionsEN,
      clusterCode: clusterCode ?? this.clusterCode,
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
      'consultationSessionsTC': consultationSessionsTC,
      'consultationSessionsSC': consultationSessionsSC,
      'consultationSessionsEN': consultationSessionsEN,
      'clusterCode': clusterCode,
      'regionCode': regionCode,
      'districtCode': districtCode,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'FacilityGocModel(institutionNameTC: $institutionNameTC, institutionNameSC: $institutionNameSC, institutionNameEN: $institutionNameEN, addressTC: $addressTC, addressSC: $addressSC, addressEN: $addressEN, consultationSessionTC: $consultationSessionsTC, consultationSessionSC: $consultationSessionsSC, consultationSessionEN: $consultationSessionsEN, clusterCode: $clusterCode, regionCode: $regionCode, districtCode: $districtCode, latitude: $latitude, longitude: $longitude)';
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

  String get consultationSessions {
    switch (LocaleSettings.currentLocale) {
      case AppLocale.zhHk:
        return consultationSessionsTC ?? '';
      case AppLocale.zhCn:
        return consultationSessionsSC ?? '';
      default:
        return consultationSessionsEN ?? '';
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FacilityGocModel &&
        other.institutionNameTC == institutionNameTC &&
        other.institutionNameSC == institutionNameSC &&
        other.institutionNameEN == institutionNameEN &&
        other.addressTC == addressTC &&
        other.addressSC == addressSC &&
        other.addressEN == addressEN &&
        other.consultationSessionsTC == consultationSessionsTC &&
        other.consultationSessionsSC == consultationSessionsSC &&
        other.consultationSessionsEN == consultationSessionsEN &&
        other.clusterCode == clusterCode &&
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
        consultationSessionsTC.hashCode ^
        consultationSessionsSC.hashCode ^
        consultationSessionsEN.hashCode ^
        clusterCode.hashCode ^
        regionCode.hashCode ^
        districtCode.hashCode ^
        latitude.hashCode ^
        longitude.hashCode;
  }
}
