import 'package:ae_live/config/constants.dart';
import 'package:ae_live/data/enum/wait_time_sort_type.dart';
import 'package:ae_live/data/repositories/wait_time_repository.dart';
import 'package:ae_live/models/wait_time_model.dart';
import 'package:ae_live/utilities/check_internet_connection.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  List<WaitTimeModel>? _data;

  void _onWaitTimeFetchRequested(
    final WaitTimeFetchRequested event,
    final Emitter<WaitTimeState> emit,
  ) async {
    if (_data == null) {
      emit(WaitTimeLoading());
    }

    if (await isConnectedToInternet()) {
      try {
        _data = await repository.getWaitTimeData();
        final SharedPreferences preferences =
            await SharedPreferences.getInstance();

        final List<WaitTimeModel> processedData =
            repository.filterAndSortWaitTimeData(
          _data!,
          keyword: event.keyword?.trim(),
          clusters: event.clusters,
          regions: event.regions,
          sortType: event.sortType ??
              toWaitTimeSortType(
                preferences.getString(Constants.preferenceKeyDefaultSorting),
              ),
        );

        emit(
          WaitTimeSuccess(
            waitTimeData: processedData,
          ),
        );
      } catch (error) {
        emit(WaitTimeFailed(error.toString()));
      }
    } else {
      emit(WaitTimeFailed('-1001'));
    }

    event.refreshController.finishRefresh();
    if (event.onFinished != null) {
      event.onFinished!();
    }
  }

  void _onWaitTimeDataFilter(
    final WaitTimeDataFilter event,
    final Emitter<WaitTimeState> emit,
  ) async {
    // emit(WaitTimeLoading());

    try {
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();

      final List<WaitTimeModel> processedData =
          repository.filterAndSortWaitTimeData(
        _data!,
        keyword: event.name?.trim(),
        clusters: event.clusters,
        sortType: event.sortType ??
            toWaitTimeSortType(
              preferences.getString(Constants.preferenceKeyDefaultSorting),
            ),
        regions: event.regions,
      );

      emit(
        WaitTimeSuccess(
          // filterKeyword: filterKeyword,
          // filterClusters: filterClusters,
          // filterSortType: filterSortType,
          waitTimeData: processedData,
        ),
      );
    } catch (error) {
      emit(
        WaitTimeFailed(
          error.toString(),
        ),
      );
    }
  }

  void _onWaitTimeReset(
    final WaitTimeReset event,
    final Emitter<WaitTimeState> emit,
  ) {
    emit(WaitTimeInitial());
  }
}
