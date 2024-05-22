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
  });

  factory WaitTimeModel.fromMap(final Map<String, dynamic> map) {
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
              map['waitTimeHistory']?.map(
                (final Map<String, dynamic> x) =>
                    WaitTimeHistoryModel.fromMap(x),
              ),
            )
          : null,
    );
  }

  factory WaitTimeModel.fromJson(final String source) =>
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

  WaitTimeModel copyWith({
    final String? id,
    final String? institutionNameTC,
    final String? institutionNameSC,
    final String? institutionNameEN,
    final String? addressTC,
    final String? addressSC,
    final String? addressEN,
    final String? contactNo,
    final ValueGetter<String?>? faxNo,
    final ValueGetter<String?>? emailAddress,
    final ValueGetter<String?>? website,
    final int? clusterCode,
    final String? waitTimeText,
    final double? waitTimeValue,
    final double? latitude,
    final double? longitude,
    final ValueGetter<List<WaitTimeHistoryModel>?>? waitTimeHistory,
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
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
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
      'waitTimeHistory': waitTimeHistory
          ?.map((final WaitTimeHistoryModel x) => x.toMap())
          .toList(),
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'WaitTimeModel(id: $id, institutionNameTC: $institutionNameTC, institutionNameSC: $institutionNameSC, institutionNameEN: $institutionNameEN, addressTC: $addressTC, addressSC: $addressSC, addressEN: $addressEN, contactNo: $contactNo, faxNo: $faxNo, emailAddress: $emailAddress, website: $website, clusterCode: $clusterCode, waitTimeText: $waitTimeText, waitTimeValue: $waitTimeValue, latitude: $latitude, longitude: $longitude, waitTimeHistory: $waitTimeHistory)';
  }

  // String toQueryString() {
  //   return '$institutionNameTC $institutionNameSC $institutionNameEN $addressTC $addressSC $addressEN $contactNo $faxNo $emailAddress $website';
  // }

  String get institutionName {
    switch (LocaleSettings.currentLocale.languageTag) {
      case 'zh-HK':
        return institutionNameTC;
      case 'zh-CN':
        return institutionNameSC;
      default:
        return institutionNameEN;
    }
  }

  String get address {
    switch (LocaleSettings.currentLocale.languageTag) {
      case 'zh-HK':
        return addressTC;
      case 'zh-CN':
        return addressSC;
      default:
        return addressEN;
    }
  }

  @override
  bool operator ==(final Object other) {
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
        listEquals(other.waitTimeHistory, waitTimeHistory);
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
        waitTimeHistory.hashCode;
  }
}
