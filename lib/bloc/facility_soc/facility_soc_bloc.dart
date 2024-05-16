import 'package:ae_live/data/repositories/facility_soc_repository.dart';
import 'package:ae_live/models/facility_soc_model.dart';
import 'package:ae_live/utilities/check_internet_connection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'facility_soc_event.dart';
part 'facility_soc_state.dart';

class FacilitySocBloc extends Bloc<FacilitySocEvent, FacilitySocState> {
  FacilitySocBloc({
    required this.repository,
  }) : super(FacilitySocInitial()) {
    on<FacilitySocRequested>(_onFacilitySocRequested);
    on<FacilitySocDataFilter>(_onFacilitySocDataFilter);
    on<FacilitySocReset>(_onFacilitySocReset);
  }

  final FacilitySocRepository repository;
  late List<FacilitySocModel> _data;

  void _onFacilitySocRequested(
    final FacilitySocRequested event,
    final Emitter<FacilitySocState> emit,
  ) async {
    emit(FacilitySocLoading());

    if (await isConnectedToInternet()) {
      try {
        _data = await repository.getFacilitySocData();

        emit(
          FacilitySocSuccess(
            facilitySocData: _data,
          ),
        );
      } catch (error) {
        emit(FacilitySocFailed(error.toString()));
      }
    } else {
      emit(FacilitySocFailed('-1001'));
    }
  }

  void _onFacilitySocDataFilter(
    final FacilitySocDataFilter event,
    final Emitter<FacilitySocState> emit,
  ) {
    emit(FacilitySocLoading());

    final List<FacilitySocModel> processedData =
        repository.filterAndSortFacilitySocData(
      _data,
      keyword: event.keyword?.trim(),
      clusters: event.clusters,
    );

    emit(
      FacilitySocSuccess(
        facilitySocData: processedData,
      ),
    );
  }

  void _onFacilitySocReset(
    final FacilitySocReset event,
    final Emitter<FacilitySocState> emit,
  ) {
    emit(FacilitySocInitial());
  }
}
