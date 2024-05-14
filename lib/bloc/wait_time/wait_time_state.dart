part of 'wait_time_bloc.dart';

@immutable
sealed class WaitTimeState {}

final class WaitTimeInitial extends WaitTimeState {}

final class WaitTimeLoading extends WaitTimeState {}

final class WaitTimeSuccess extends WaitTimeState {
  WaitTimeSuccess({
    this.filterKeyword,
    required this.filterClusters,
    required this.filterSortType,
    required this.waitTimeData,
  });

  final String? filterKeyword;
  final List<int> filterClusters;
  final WaitTimeSortType filterSortType;
  final List<WaitTimeModel> waitTimeData;
}

final class WaitTimeFailed extends WaitTimeState {

  WaitTimeFailed(this.errorMessage);
  final String errorMessage;
}
