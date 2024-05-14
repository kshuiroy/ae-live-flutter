import 'dart:convert';

import 'package:ae_live/utilities/date_time_converter.dart';

class WaitTimeHistoryModel {
  WaitTimeHistoryModel({
    required this.timestamp,
    this.waitTimeText,
    this.waitTimeValue,
  });

  factory WaitTimeHistoryModel.fromMap(final Map<String, dynamic> map) {
    final bool waitTimeIsOverType =
        (map['topWait'] as String).startsWith('超過') ||
            (map['topWait'] as String).startsWith('超过') ||
            (map['topWait'] as String).startsWith('Over');

    return WaitTimeHistoryModel(
      timestamp: DateTimeConverter.convertWaitTime(map['updateTime'] ?? ''),
      waitTimeText: map['topWait'] ?? '',
      waitTimeValue: double.parse(
            (map['topWait'] as String).replaceAll(RegExp(r'[^0-9]'), ''),
          ) +
          (waitTimeIsOverType ? 0.5 : 0.0),
    );
  }

  factory WaitTimeHistoryModel.fromJson(final String source) =>
      WaitTimeHistoryModel.fromMap(json.decode(source));

  final DateTime timestamp;
  final String? waitTimeText;
  final double? waitTimeValue;

  WaitTimeHistoryModel copyWith({
    final DateTime? timestamp,
    final String? waitTimeText,
    final double? waitTimeValue,
  }) {
    return WaitTimeHistoryModel(
      timestamp: timestamp ?? this.timestamp,
      waitTimeText: waitTimeText,
      waitTimeValue: waitTimeValue,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'timestamp': timestamp.millisecondsSinceEpoch,
      'waitTimeText': waitTimeText,
      'waitTimeValue': waitTimeValue,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'WaitTimeHistoryModel(timestamp: $timestamp, waitTimeText: $waitTimeText, waitTimeValue: $waitTimeValue)';

  @override
  bool operator ==(final Object other) {
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
