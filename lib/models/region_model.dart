import 'dart:convert';

import 'package:ae_live/i18n/translations.g.dart';

class RegionModel {
  RegionModel({
    required this.id,
    required this.nameTC,
    required this.nameSC,
    required this.nameEN,
    required this.regionCode,
  });

  factory RegionModel.fromMap(Map<String, dynamic> map) {
    return RegionModel(
      id: map['id'] ?? '',
      nameTC: map['nameTC'] ?? '',
      nameSC: map['nameSC'] ?? '',
      nameEN: map['nameEN'] ?? '',
      regionCode: map['regionCode']?.toInt() ?? 0,
    );
  }

  factory RegionModel.fromJson(String source) =>
      RegionModel.fromMap(json.decode(source));

  final String id;
  final String nameTC;
  final String nameSC;
  final String nameEN;
  final int regionCode;

  RegionModel copyWith({
    String? id,
    String? nameTC,
    String? nameSC,
    String? nameEN,
    int? regionCode,
  }) {
    return RegionModel(
      id: id ?? this.id,
      nameTC: nameTC ?? this.nameTC,
      nameSC: nameSC ?? this.nameSC,
      nameEN: nameEN ?? this.nameEN,
      regionCode: regionCode ?? this.regionCode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nameTC': nameTC,
      'nameSC': nameSC,
      'nameEN': nameEN,
      'regionCode': regionCode,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'RegionModel(id: $id, nameTC: $nameTC, nameSC: $nameSC, nameEN: $nameEN, regionCode: $regionCode)';
  }

  String get regionName {
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

    return other is RegionModel &&
        other.id == id &&
        other.nameTC == nameTC &&
        other.nameSC == nameSC &&
        other.nameEN == nameEN &&
        other.regionCode == regionCode;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nameTC.hashCode ^
        nameSC.hashCode ^
        nameEN.hashCode ^
        regionCode.hashCode;
  }
}
