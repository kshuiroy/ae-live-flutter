part of 'facility_goc_bloc.dart';

@immutable
sealed class FacilityGocEvent {}

final class FacilityGocReset extends FacilityGocEvent {}

final class FacilityGocRequested extends FacilityGocEvent {}

final class FacilityGocDataFilter extends FacilityGocEvent {
  FacilityGocDataFilter({
    this.keyword,
    this.clusters,
    this.districts,
  });

  final String? keyword;
  final List<int>? clusters;
  final List<int>? districts;
}
