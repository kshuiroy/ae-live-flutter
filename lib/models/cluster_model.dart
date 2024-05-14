import 'dart:convert';

import 'package:ae_live/i18n/translations.g.dart';

class ClusterModel {
  ClusterModel({
    required this.id,
    required this.nameTC,
    required this.nameSC,
    required this.nameEN,
    required this.clusterCode,
  });

  factory ClusterModel.fromMap(final Map<String, dynamic> map) {
    return ClusterModel(
      id: map['id'] ?? '',
      nameTC: map['nameTC'] ?? '',
      nameSC: map['nameSC'] ?? '',
      nameEN: map['nameEN'] ?? '',
      clusterCode: map['clusterCode']?.toInt() ?? -1,
    );
  }

  factory ClusterModel.fromJson(final String source) =>
      ClusterModel.fromMap(json.decode(source));

  final String id;
  final String nameTC;
  final String nameSC;
  final String nameEN;
  final int clusterCode;

  ClusterModel copyWith({
    final String? id,
    final String? nameTC,
    final String? nameSC,
    final String? nameEN,
    final int? clusterCode,
  }) {
    return ClusterModel(
      id: id ?? this.id,
      nameTC: nameTC ?? this.nameTC,
      nameSC: nameSC ?? this.nameSC,
      nameEN: nameEN ?? this.nameEN,
      clusterCode: clusterCode ?? this.clusterCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nameTC': nameTC,
      'nameSC': nameSC,
      'nameEN': nameEN,
      'clusterCode': clusterCode,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'ClusterModel(id: $id, nameTC: $nameTC, nameSC: $nameSC, nameEN: $nameEN, clusterCode: $clusterCode)';
  }

  @override
  bool operator ==(final Object other) {
    if (identical(this, other)) return true;

    return other is ClusterModel &&
        other.id == id &&
        other.nameTC == nameTC &&
        other.nameSC == nameSC &&
        other.nameEN == nameEN &&
        other.clusterCode == clusterCode;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nameTC.hashCode ^
        nameSC.hashCode ^
        nameEN.hashCode ^
        clusterCode.hashCode;
  }

  String get clusterText {
    switch (LocaleSettings.currentLocale) {
      case AppLocale.zhHk:
        return nameTC;
      case AppLocale.zhCn:
        return nameSC;
      default:
        return nameEN;
    }
  }
}
