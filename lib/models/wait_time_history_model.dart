import 'dart:convert';

import 'package:ae_live/utilities/date_time_converter.dart';

class WaitTimeHistoryModel {
  WaitTimeHistoryModel({
    required this.timestamp,
    this.waitTimeText,
    this.waitTimeValue,
  });

  final DateTime timestamp;
  final String? waitTimeText;
  final double? waitTimeValue;

  WaitTimeHistoryModel copyWith({
    DateTime? timestamp,
    String? waitTimeText,
    double? waitTimeValue,
  }) {
    return WaitTimeHistoryModel(
      timestamp: timestamp ?? this.timestamp,
      waitTimeText: waitTimeText,
      waitTimeValue: waitTimeValue,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'timestamp': timestamp.millisecondsSinceEpoch,
      'waitTimeText': waitTimeText,
      'waitTimeValue': waitTimeValue,
    };
  }

  factory WaitTimeHistoryModel.fromMap(Map<String, dynamic> map) {
    final bool waitTimeIsOverType =
        (map['topWait'] as String).startsWith('超過') ||
            (map['topWait'] as String).startsWith('超过') ||
            (map['topWait'] as String).startsWith('Over');

    return WaitTimeHistoryModel(
      timestamp: DateTimeConverter.convertWaitTime(map['updateTime'] ?? ''),
      waitTimeText: map['topWait'] ?? '',
      waitTimeValue: double.parse(
              (map['topWait'] as String).replaceAll(RegExp(r'[^0-9]'), '')) +
          (waitTimeIsOverType ? 0.5 : 0.0),
    );
  }

  String toJson() => json.encode(toMap());

  factory WaitTimeHistoryModel.fromJson(String source) =>
      WaitTimeHistoryModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'WaitTimeHistoryModel(timestamp: $timestamp, waitTimeText: $waitTimeText, waitTimeValue: $waitTimeValue)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WaitTimeHistoryModel &&
        other.timestamp == timestamp &&
        other.waitTimeText == waitTimeText &&
        other.waitTimeValue == waitTimeValue;
  }

  @override
  int get hashCode =>
      timestamp.hashCode ^ waitTimeText.hashCode ^ waitTimeValue.hashCode;
}
