part of 'facility_cmc_bloc.dart';

@immutable
sealed class FacilityCmcEvent {}

final class FacilityCmcReset extends FacilityCmcEvent {}

final class FacilityCmcRequested extends FacilityCmcEvent {}

final class FacilityCmcDataFilter extends FacilityCmcEvent {
  FacilityCmcDataFilter({
    this.keyword,
    this.regions,
    this.districts,
  });

  final String? keyword;
  final List<int>? regions;
  final List<int>? districts;
}
