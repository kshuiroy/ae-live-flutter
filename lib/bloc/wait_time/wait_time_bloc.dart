import 'package:ae_live/data/enum/wait_time_sort_type.dart';
import 'package:ae_live/data/repositories/wait_time_repository.dart';
import 'package:ae_live/models/wait_time_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wait_time_event.dart';
part 'wait_time_state.dart';

class WaitTimeBloc extends Bloc<WaitTimeEvent, WaitTimeState> {
  WaitTimeBloc({
    required this.repository,
  }) : super(WaitTimeInitial()) {
    on<WaitTimeFetchRequested>(_onWaitTimeFetchRequested);
    on<WaitTimeDataFilter>(_onWaitTimeDataFilter);
    on<WaitTimeReset>(_onWaitTimeReset);
  }

  final WaitTimeRepository repository;
  late List<WaitTimeModel> _data;

  void _onWaitTimeFetchRequested(
      WaitTimeFetchRequested event, Emitter<WaitTimeState> emit) async {
    emit(WaitTimeLoading());

    try {
      _data = await repository.getWaitTimeData();
      _data.sort((a, b) => a.waitTimeValue.compareTo(b.waitTimeValue));
      emit(WaitTimeSuccess(waitTimeData: _data));
    } catch (error) {
      emit(WaitTimeFailed(error.toString()));
    }
  }

  void _onWaitTimeDataFilter(
      WaitTimeDataFilter event, Emitter<WaitTimeState> emit) {
    emit(WaitTimeLoading());

    final List<WaitTimeModel> processedData =
        repository.filterAndSortWaitTimeData(
      _data,
      name: event.name?.trim(),
      clusters: event.clusters,
      sortType: event.sortType,
    );

    emit(WaitTimeSuccess(waitTimeData: processedData));
  }

  void _onWaitTimeReset(WaitTimeReset event, Emitter<WaitTimeState> emit) {
    emit(WaitTimeInitial());
  }
}
