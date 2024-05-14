extension DateTimeExtension on DateTime {
  DateTime roundDown({final Duration delta = const Duration(minutes: 15)}) {
    return DateTime.fromMillisecondsSinceEpoch(
        millisecondsSinceEpoch - millisecondsSinceEpoch % delta.inMilliseconds,);
  }
}
