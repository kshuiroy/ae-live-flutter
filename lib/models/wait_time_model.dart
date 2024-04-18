import 'dart:convert';

import 'package:ae_live/models/wait_time_history_model.dart';
import 'package:flutter/foundation.dart';

class WaitTimeModel {
  WaitTimeModel({
    required this.institutionName,
    required this.address,
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

  final String institutionName;
  final String address;
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
    String? institutionName,
    String? address,
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
  }) {
    return WaitTimeModel(
      institutionName: institutionName ?? this.institutionName,
      address: address ?? this.address,
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
    return {
      'institutionName': institutionName,
      'address': address,
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
    };
  }

  factory WaitTimeModel.fromMap(Map<String, dynamic> map) {
    return WaitTimeModel(
      institutionName: map['institutionName'] ?? '',
      address: map['address'] ?? '',
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
          ? List<WaitTimeHistoryModel>.from(map['waitTimeHistory']
              ?.map((x) => WaitTimeHistoryModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory WaitTimeModel.fromJson(String source) =>
      WaitTimeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WaitTimeModel(institutionName: $institutionName, address: $address, contactNo: $contactNo, faxNo: $faxNo, emailAddress: $emailAddress, website: $website, clusterCode: $clusterCode, waitTimeText: $waitTimeText, waitTimeValue: $waitTimeValue, latitude: $latitude, longitude: $longitude, waitTimeHistory: $waitTimeHistory)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WaitTimeModel &&
        other.institutionName == institutionName &&
        other.address == address &&
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
    return institutionName.hashCode ^
        address.hashCode ^
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
