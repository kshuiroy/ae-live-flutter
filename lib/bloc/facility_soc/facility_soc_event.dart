part of 'facility_soc_bloc.dart';

@immutable
sealed class FacilitySocEvent {}

final class FacilitySocReset extends FacilitySocEvent {}

final class FacilitySocRequested extends FacilitySocEvent {}

final class FacilitySocDataFilter extends FacilitySocEvent {
  FacilitySocDataFilter({
    this.keyword,
    this.clusters,
  });

  final String? keyword;
  final List<int>? clusters;
}
