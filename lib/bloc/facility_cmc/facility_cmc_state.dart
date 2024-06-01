part of 'facility_cmc_bloc.dart';

@immutable
sealed class FacilityCmcState {}

final class FacilityCmcInitial extends FacilityCmcState {}

final class FacilityCmcLoading extends FacilityCmcState {}

final class FacilityCmcSuccess extends FacilityCmcState {
  FacilityCmcSuccess({
    required this.facilityCmcData,
  });

  final List<FacilityCmcModel> facilityCmcData;
}

final class FacilityCmcFailed extends FacilityCmcState {
  FacilityCmcFailed(this.errorMessage);
  final String errorMessage;
}
