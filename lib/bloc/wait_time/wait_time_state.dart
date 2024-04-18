part of 'wait_time_bloc.dart';

@immutable
sealed class WaitTimeState {}

final class WaitTimeInitial extends WaitTimeState {}

final class WaitTimeLoading extends WaitTimeState {}

final class WaitTimeSuccess extends WaitTimeState {
  final List<WaitTimeModel> waitTimeData;

  WaitTimeSuccess({required this.waitTimeData});
}

final class WaitTimeFailed extends WaitTimeState {
  final String errorMessage;

  WaitTimeFailed(this.errorMessage);
}
