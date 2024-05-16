part of 'facility_goc_bloc.dart';

@immutable
sealed class FacilityGocState {}

final class FacilityGocInitial extends FacilityGocState {}

final class FacilityGocLoading extends FacilityGocState {}

final class FacilityGocSuccess extends FacilityGocState {
  FacilityGocSuccess({
    required this.facilityGocData,
  });

  final List<FacilityGocModel> facilityGocData;
}

final class FacilityGocFailed extends FacilityGocState {
  FacilityGocFailed(this.errorMessage);
  final String errorMessage;
}
