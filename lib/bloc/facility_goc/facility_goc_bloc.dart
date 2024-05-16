import 'package:ae_live/data/repositories/facility_goc_repository.dart';
import 'package:ae_live/models/facility_goc_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'facility_goc_event.dart';
part 'facility_goc_state.dart';

class FacilityGocBloc extends Bloc<FacilityGocEvent, FacilityGocState> {
  FacilityGocBloc({
    required this.repository,
  }) : super(FacilityGocInitial()) {
    on<FacilityGocRequested>(_onFacilityGocRequested);
    on<FacilityGocDataFilter>(_onFacilityGocDataFilter);
    on<FacilityGocReset>(_onFacilityGocReset);
  }

  final FacilityGocRepository repository;
  late List<FacilityGocModel> _data;

  void _onFacilityGocRequested(
    final FacilityGocRequested event,
    final Emitter<FacilityGocState> emit,
  ) async {
    emit(FacilityGocLoading());

    _data = await repository.getFacilityGocData();

    emit(
      FacilityGocSuccess(
        facilityGocData: _data,
      ),
    );
  }

  void _onFacilityGocDataFilter(
    final FacilityGocDataFilter event,
    final Emitter<FacilityGocState> emit,
  ) {
    emit(FacilityGocLoading());

    final List<FacilityGocModel> processedData =
        repository.filterAndSortFacilityGocData(
      _data,
      keyword: event.keyword?.trim(),
      clusters: event.clusters,
    );

    emit(
      FacilityGocSuccess(
        facilityGocData: processedData,
      ),
    );
  }

  void _onFacilityGocReset(
    final FacilityGocReset event,
    final Emitter<FacilityGocState> emit,
  ) {
    emit(FacilityGocInitial());
  }
}
