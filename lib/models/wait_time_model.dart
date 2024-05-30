import 'dart:convert';

import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/models/wait_time_history_model.dart';
import 'package:flutter/foundation.dart';

class WaitTimeModel {
  WaitTimeModel({
    required this.id,
    required this.institutionNameTC,
    required this.institutionNameSC,
    required this.institutionNameEN,
    required this.addressTC,
    required this.addressSC,
    required this.addressEN,
    required this.contactNo,
    this.faxNo,
    this.emailAddress,
    this.website,
    required this.clusterCode,
    required this.waitTimeText,
    required this.waitTimeValue,
    required this.latitude,
    required this.longitude,
    this.waitTimeHistory,
    required this.regionCode,
    required this.districtCode,
  });

  factory WaitTimeModel.fromMap(Map<String, dynamic> map) {
    return WaitTimeModel(
      id: map['id'] ?? '',
      institutionNameTC: map['institutionNameTC'] ?? '',
      institutionNameSC: map['institutionNameSC'] ?? '',
      institutionNameEN: map['institutionNameEN'] ?? '',
      addressTC: map['addressTC'] ?? '',
      addressSC: map['addressSC'] ?? '',
      addressEN: map['addressEN'] ?? '',
      contactNo: map['contactNo'] ?? '',
      faxNo: map['faxNo'],
      emailAddress: map['emailAddress'],
      website: map['website'],
      clusterCode: map['clusterCode']?.toInt() ?? 0,
      waitTimeText: map['waitTimeText'] ?? '',
      waitTimeValue: map['waitTimeValue']?.toDouble() ?? 0.0,
      latitude: map['latitude']?.toDouble() ?? 0.0,
      longitude: map['longitude']?.toDouble() ?? 0.0,
      waitTimeHistory: map['waitTimeHistory'] != null
          ? List<WaitTimeHistoryModel>.from(
              map['waitTimeHistory']
                  ?.map((x) => WaitTimeHistoryModel.fromMap(x)),
            )
          : null,
      regionCode: map['regionCode']?.toInt() ?? 0,
      districtCode: map['districtCode']?.toInt() ?? 0,
    );
  }

  factory WaitTimeModel.fromJson(String source) =>
      WaitTimeModel.fromMap(json.decode(source));

  final String id;
  final String institutionNameTC;
  final String institutionNameSC;
  final String institutionNameEN;
  final String addressTC;
  final String addressSC;
  final String addressEN;
  final String contactNo;
  final String? faxNo;
  final String? emailAddress;
  final String? website;
  final int clusterCode;
  final String waitTimeText;
  final double waitTimeValue;
  final double latitude;
  final double longitude;
  final List<WaitTimeHistoryModel>? waitTimeHistory;
  final int regionCode;
  final int districtCode;

  WaitTimeModel copyWith({
    String? id,
    String? institutionNameTC,
    String? institutionNameSC,
    String? institutionNameEN,
    String? addressTC,
    String? addressSC,
    String? addressEN,
    String? contactNo,
    ValueGetter<String?>? faxNo,
    ValueGetter<String?>? emailAddress,
    ValueGetter<String?>? website,
    int? clusterCode,
    String? waitTimeText,
    double? waitTimeValue,
    double? latitude,
    double? longitude,
    ValueGetter<List<WaitTimeHistoryModel>?>? waitTimeHistory,
    int? regionCode,
    int? districtCode,
  }) {
    return WaitTimeModel(
      id: id ?? this.id,
      institutionNameTC: institutionNameTC ?? this.institutionNameTC,
      institutionNameSC: institutionNameSC ?? this.institutionNameSC,
      institutionNameEN: institutionNameEN ?? this.institutionNameEN,
      addressTC: addressTC ?? this.addressTC,
      addressSC: addressSC ?? this.addressSC,
      addressEN: addressEN ?? this.addressEN,
      contactNo: contactNo ?? this.contactNo,
      faxNo: faxNo != null ? faxNo() : this.faxNo,
      emailAddress: emailAddress != null ? emailAddress() : this.emailAddress,
      website: website != null ? website() : this.website,
      clusterCode: clusterCode ?? this.clusterCode,
      waitTimeText: waitTimeText ?? this.waitTimeText,
      waitTimeValue: waitTimeValue ?? this.waitTimeValue,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      waitTimeHistory:
          waitTimeHistory != null ? waitTimeHistory() : this.waitTimeHistory,
      regionCode: regionCode ?? this.regionCode,
      districtCode: districtCode ?? this.districtCode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'institutionNameTC': institutionNameTC,
      'institutionNameSC': institutionNameSC,
      'institutionNameEN': institutionNameEN,
      'addressTC': addressTC,
      'addressSC': addressSC,
      'addressEN': addressEN,
      'contactNo': contactNo,
      'faxNo': faxNo,
      'emailAddress': emailAddress,
      'website': website,
      'clusterCode': clusterCode,
      'waitTimeText': waitTimeText,
      'waitTimeValue': waitTimeValue,
      'latitude': latitude,
      'longitude': longitude,
      'waitTimeHistory': waitTimeHistory?.map((x) => x.toMap()).toList(),
      'regionCode': regionCode,
      'districtCode': districtCode,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'WaitTimeModel(id: $id, institutionNameTC: $institutionNameTC, institutionNameSC: $institutionNameSC, institutionNameEN: $institutionNameEN, addressTC: $addressTC, addressSC: $addressSC, addressEN: $addressEN, contactNo: $contactNo, faxNo: $faxNo, emailAddress: $emailAddress, website: $website, clusterCode: $clusterCode, waitTimeText: $waitTimeText, waitTimeValue: $waitTimeValue, latitude: $latitude, longitude: $longitude, waitTimeHistory: $waitTimeHistory, regionCode: $regionCode, districtCode: $districtCode)';
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

    return other is WaitTimeModel &&
        other.id == id &&
        other.institutionNameTC == institutionNameTC &&
        other.institutionNameSC == institutionNameSC &&
        other.institutionNameEN == institutionNameEN &&
        other.addressTC == addressTC &&
        other.addressSC == addressSC &&
        other.addressEN == addressEN &&
        other.contactNo == contactNo &&
        other.faxNo == faxNo &&
        other.emailAddress == emailAddress &&
        other.website == website &&
        other.clusterCode == clusterCode &&
        other.waitTimeText == waitTimeText &&
        other.waitTimeValue == waitTimeValue &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        listEquals(other.waitTimeHistory, waitTimeHistory) &&
        other.regionCode == regionCode &&
        other.districtCode == districtCode;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        institutionNameTC.hashCode ^
        institutionNameSC.hashCode ^
        institutionNameEN.hashCode ^
        addressTC.hashCode ^
        addressSC.hashCode ^
        addressEN.hashCode ^
        contactNo.hashCode ^
        faxNo.hashCode ^
        emailAddress.hashCode ^
        website.hashCode ^
        clusterCode.hashCode ^
        waitTimeText.hashCode ^
        waitTimeValue.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        waitTimeHistory.hashCode ^
        regionCode.hashCode ^
        districtCode.hashCode;
  }
}
