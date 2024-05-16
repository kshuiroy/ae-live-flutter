part of 'facility_soc_bloc.dart';

@immutable
sealed class FacilitySocState {}

final class FacilitySocInitial extends FacilitySocState {}

final class FacilitySocLoading extends FacilitySocState {}

final class FacilitySocSuccess extends FacilitySocState {
  FacilitySocSuccess({
    required this.facilitySocData,
  });

  final List<FacilitySocModel> facilitySocData;
}

final class FacilitySocFailed extends FacilitySocState {
  FacilitySocFailed(this.errorMessage);
  final String errorMessage;
}
