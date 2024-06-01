import 'package:ae_live/data/repositories/facility_cmc_repository.dart';
import 'package:ae_live/models/facility_cmc_model.dart';
import 'package:ae_live/utilities/check_internet_connection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'facility_cmc_event.dart';
part 'facility_cmc_state.dart';

class FacilityCmcBloc extends Bloc<FacilityCmcEvent, FacilityCmcState> {
  FacilityCmcBloc({
    required this.repository,
  }) : super(FacilityCmcInitial()) {
    on<FacilityCmcRequested>(_onFacilityCmcRequested);
    on<FacilityCmcDataFilter>(_onFacilityCmcDataFilter);
    on<FacilityCmcReset>(_onFacilityCmcReset);
  }

  final FacilityCmcRepository repository;
  late List<FacilityCmcModel> _data;

  void _onFacilityCmcRequested(
    final FacilityCmcRequested event,
    final Emitter<FacilityCmcState> emit,
  ) async {
    emit(FacilityCmcLoading());

    if (await isConnectedToInternet()) {
      try {
        _data = await repository.getFacilityCmcData();

        emit(
          FacilityCmcSuccess(
            facilityCmcData: _data,
          ),
        );
      } catch (error) {
        emit(FacilityCmcFailed(error.toString()));
      }
    } else {
      emit(FacilityCmcFailed('-1001'));
    }
  }

  void _onFacilityCmcDataFilter(
    final FacilityCmcDataFilter event,
    final Emitter<FacilityCmcState> emit,
  ) {
    emit(FacilityCmcLoading());

    final List<FacilityCmcModel> processedData =
        repository.filterAndSortFacilityCmcData(
      _data,
      keyword: event.keyword?.trim(),
      regions: event.regions,
      districts: event.districts,
    );

    emit(
      FacilityCmcSuccess(
        facilityCmcData: processedData,
      ),
    );
  }

  void _onFacilityCmcReset(
    final FacilityCmcReset event,
    final Emitter<FacilityCmcState> emit,
  ) {
    emit(FacilityCmcInitial());
  }
}
