part of 'facility_hospital_bloc.dart';

@immutable
sealed class FacilityHospitalEvent {}

final class FacilityHospitalReset extends FacilityHospitalEvent {}

final class FacilityHospitalRequested extends FacilityHospitalEvent {}

final class FacilityHospitalDataFilter extends FacilityHospitalEvent {
  FacilityHospitalDataFilter({
    this.keyword,
    this.clusters,
  });

  final String? keyword;
  final List<int>? clusters;
}
