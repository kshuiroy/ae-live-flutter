part of 'facility_hospital_bloc.dart';

@immutable
sealed class FacilityHospitalState {}

final class FacilityHospitalInitial extends FacilityHospitalState {}

final class FacilityHospitalLoading extends FacilityHospitalState {}

final class FacilityHospitalSuccess extends FacilityHospitalState {
  FacilityHospitalSuccess({
    required this.facilityHospitalData,
  });

  final List<FacilityHospitalModel> facilityHospitalData;
}

final class FacilityHospitalFailed extends FacilityHospitalState {
  FacilityHospitalFailed(this.errorMessage);
  final String errorMessage;
}
