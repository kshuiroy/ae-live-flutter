import 'dart:convert';

import 'package:ae_live/i18n/translations.g.dart';

class DistrictModel {
  DistrictModel({
    required this.id,
    required this.nameTC,
    required this.nameSC,
    required this.nameEN,
    required this.regionCode,
    required this.districtCode,
  });

  factory DistrictModel.fromMap(Map<String, dynamic> map) {
    return DistrictModel(
      id: map['id'] ?? '',
      nameTC: map['nameTC'] ?? '',
      nameSC: map['nameSC'] ?? '',
      nameEN: map['nameEN'] ?? '',
      regionCode: map['regionCode']?.toInt() ?? 0,
      districtCode: map['districtCode']?.toInt() ?? 0,
    );
  }

  factory DistrictModel.fromJson(String source) =>
      DistrictModel.fromMap(json.decode(source));

  final String id;
  final String nameTC;
  final String nameSC;
  final String nameEN;
  final int regionCode;
  final int districtCode;

  DistrictModel copyWith({
    String? id,
    String? nameTC,
    String? nameSC,
    String? nameEN,
    int? regionCode,
    int? districtCode,
  }) {
    return DistrictModel(
      id: id ?? this.id,
      nameTC: nameTC ?? this.nameTC,
      nameSC: nameSC ?? this.nameSC,
      nameEN: nameEN ?? this.nameEN,
      regionCode: regionCode ?? this.regionCode,
      districtCode: districtCode ?? this.districtCode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nameTC': nameTC,
      'nameSC': nameSC,
      'nameEN': nameEN,
      'regionCode': regionCode,
      'districtCode': districtCode,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'DistrictModel(id: $id, nameTC: $nameTC, nameSC: $nameSC, nameEN: $nameEN, regionCode: $regionCode, districtCode: $districtCode)';
  }

  String get districtName {
    switch (LocaleSettings.currentLocale) {
      case AppLocale.zhHk:
        return nameTC;
      case AppLocale.zhCn:
        return nameSC;
      default:
        return nameEN;
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DistrictModel &&
        other.id == id &&
        other.nameTC == nameTC &&
        other.nameSC == nameSC &&
        other.nameEN == nameEN &&
        other.regionCode == regionCode &&
        other.districtCode == districtCode;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nameTC.hashCode ^
        nameSC.hashCode ^
        nameEN.hashCode ^
        regionCode.hashCode ^
        districtCode.hashCode;
  }
}
