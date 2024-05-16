import 'package:ae_live/data/repositories/facility_hospital_repository.dart';
import 'package:ae_live/models/facility_hospital_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'facility_hospital_event.dart';
part 'facility_hospital_state.dart';

class FacilityHospitalBloc
    extends Bloc<FacilityHospitalEvent, FacilityHospitalState> {
  FacilityHospitalBloc({
    required this.repository,
  }) : super(FacilityHospitalInitial()) {
    on<FacilityHospitalRequested>(_onFacilityHospitalRequested);
    on<FacilityHospitalDataFilter>(_onFacilityHospitalDataFilter);
    on<FacilityHospitalReset>(_onFacilityHospitalReset);
  }

  final FacilityHospitalRepository repository;
  late List<FacilityHospitalModel> _data;

  void _onFacilityHospitalRequested(
    final FacilityHospitalRequested event,
    final Emitter<FacilityHospitalState> emit,
  ) async {
    emit(FacilityHospitalLoading());

    _data = await repository.getFacilityHospitalData();

    emit(
      FacilityHospitalSuccess(
        facilityHospitalData: _data,
      ),
    );
  }

  void _onFacilityHospitalDataFilter(
    final FacilityHospitalDataFilter event,
    final Emitter<FacilityHospitalState> emit,
  ) {
    emit(FacilityHospitalLoading());

    final List<FacilityHospitalModel> processedData =
        repository.filterAndSortFacilityHospitalData(
      _data,
      keyword: event.keyword?.trim(),
      clusters: event.clusters,
    );

    emit(
      FacilityHospitalSuccess(
        facilityHospitalData: processedData,
      ),
    );
  }

  void _onFacilityHospitalReset(
    final FacilityHospitalReset event,
    final Emitter<FacilityHospitalState> emit,
  ) {
    emit(FacilityHospitalInitial());
  }
}
