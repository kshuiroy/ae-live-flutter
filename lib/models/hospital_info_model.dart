import 'dart:convert';

import 'package:flutter/foundation.dart';

class HospitalInfoModel {
  HospitalInfoModel({
    required this.nameTC,
    required this.nameSC,
    required this.nameEN,
    required this.contactNo,
    this.faxNo,
    this.emailAddress,
    this.website,
  });

  factory HospitalInfoModel.fromMap(final Map<String, dynamic> map) {
    return HospitalInfoModel(
      nameTC: map['nameTC'] ?? '',
      nameSC: map['nameSC'] ?? '',
      nameEN: map['nameEN'] ?? '',
      contactNo: map['contactNo'] ?? '',
      faxNo: map['faxNo'],
      emailAddress: map['emailAddress'],
      website: map['website'],
    );
  }

  factory HospitalInfoModel.fromJson(final String source) =>
      HospitalInfoModel.fromMap(json.decode(source));

  final String nameTC;
  final String nameSC;
  final String nameEN;
  final String contactNo;
  final String? faxNo;
  final String? emailAddress;
  final String? website;

  HospitalInfoModel copyWith({
    final String? nameTC,
    final String? nameSC,
    final String? nameEN,
    final String? contactNo,
    final ValueGetter<String?>? faxNo,
    final ValueGetter<String?>? emailAddress,
    final ValueGetter<String?>? website,
  }) {
    return HospitalInfoModel(
      nameTC: nameTC ?? this.nameTC,
      nameSC: nameSC ?? this.nameSC,
      nameEN: nameEN ?? this.nameEN,
      contactNo: contactNo ?? this.contactNo,
      faxNo: faxNo != null ? faxNo() : this.faxNo,
      emailAddress: emailAddress != null ? emailAddress() : this.emailAddress,
      website: website != null ? website() : this.website,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nameTC': nameTC,
      'nameSC': nameSC,
      'nameEN': nameEN,
      'contactNo': contactNo,
      'faxNo': faxNo,
      'emailAddress': emailAddress,
      'website': website,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'HospitalInfoModel(nameTC: $nameTC, nameSC: $nameSC, nameEN: $nameEN, contactNo: $contactNo, faxNo: $faxNo, emailAddress: $emailAddress, website: $website)';
  }

  @override
  bool operator ==(final Object other) {
    if (identical(this, other)) return true;

    return other is HospitalInfoModel &&
        other.nameTC == nameTC &&
        other.nameSC == nameSC &&
        other.nameEN == nameEN &&
        other.contactNo == contactNo &&
        other.faxNo == faxNo &&
        other.emailAddress == emailAddress &&
        other.website == website;
  }

  @override
  int get hashCode {
    return nameTC.hashCode ^
        nameSC.hashCode ^
        nameEN.hashCode ^
        contactNo.hashCode ^
        faxNo.hashCode ^
        emailAddress.hashCode ^
        website.hashCode;
  }
}
