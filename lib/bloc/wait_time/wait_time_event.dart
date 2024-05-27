part of 'wait_time_bloc.dart';

@immutable
sealed class WaitTimeEvent {}

final class WaitTimeReset extends WaitTimeEvent {}

final class WaitTimeFetchRequested extends WaitTimeEvent {
  WaitTimeFetchRequested({
    this.keyword,
    this.clusters,
    this.sortType,
    required this.refreshController,
    this.onFinished,
  });

  final String? keyword;
  final List<int>? clusters;
  final WaitTimeSortType? sortType;
  final EasyRefreshController refreshController;
  final void Function()? onFinished;
}

final class WaitTimeDataFilter extends WaitTimeEvent {
  WaitTimeDataFilter({
    this.name,
    this.clusters,
    this.sortType,
  });

  final String? name;
  final List<int>? clusters;
  final WaitTimeSortType? sortType;
}
