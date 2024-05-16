enum WaitTimeSortType {
  timeInAsd,
  timeInDesc,
  nameInAsd,
  nameInDesc,
}

WaitTimeSortType toWaitTimeSortType(final String? typeString) {
  if (typeString == null || typeString.isEmpty) {
    return WaitTimeSortType.timeInAsd;
  }

  return WaitTimeSortType.values.firstWhere(
    (final WaitTimeSortType element) =>
        element.toString().split('.').last == typeString,
    orElse: () => WaitTimeSortType.timeInAsd,
  );
}

String waitTimeSortTypeToString(final WaitTimeSortType sortType) {
  return sortType.toString().split('.').last;
}
