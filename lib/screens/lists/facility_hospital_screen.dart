import 'package:ae_live/bloc/facility_hospital/facility_hospital_bloc.dart';
import 'package:ae_live/config/constants.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/models/facility_hospital_model.dart';
import 'package:ae_live/widgets/facility_screen/facility_item_card.dart';
import 'package:ae_live/widgets/facility_screen/facility_list_error_prompt.dart';
import 'package:ae_live/widgets/facility_screen/facility_list_screen_base.dart';
import 'package:ae_live/widgets/facility_screen/facility_search_header.dart';
import 'package:ae_live/widgets/shared/sliver_loading_indicator.dart';
import 'package:ae_live/widgets/shared/sliver_no_data_prompt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

class FacilityHospitalScreen extends StatefulWidget {
  const FacilityHospitalScreen({
    super.key,
    this.showBackButton = true,
  });

  final bool showBackButton;

  @override
  State<FacilityHospitalScreen> createState() => _FacilityHospitalScreenState();
}

class _FacilityHospitalScreenState extends State<FacilityHospitalScreen> {
  bool _disableFilter = false;
  String? _searchKeyword;
  List<int> _searchClusters = [1, 2, 3, 4, 5, 6, 7];

  void _onUpdateSearchResult(final BuildContext context) {
    context.read<FacilityHospitalBloc>().add(
          FacilityHospitalDataFilter(
            keyword: _searchKeyword,
            clusters: _searchClusters,
          ),
        );
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((final _) {
      final FacilityHospitalState blocState =
          context.read<FacilityHospitalBloc>().state;

      if (blocState is FacilityHospitalInitial ||
          blocState is FacilityHospitalFailed) {
        // Fetch hospital/institution data if there is no data stored befored.
        context.read<FacilityHospitalBloc>().add(FacilityHospitalRequested());
      } else if (blocState is FacilityHospitalSuccess) {
        // Reset all filters and sorting to default after user go back from
        // other screens.
        context.read<FacilityHospitalBloc>().add(
              FacilityHospitalDataFilter(),
            );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Translations t = Translations.of(context);

    return FacilityListScreenBase(
      searchFilterHeader: FacilitySearchHeader(
        showBackButton: widget.showBackButton,
        keywordHintText: t.lists.hospital.search,
        enabled: !_disableFilter,
        clusterButtonLabel: t.lists.hospital.cluster,
        clusterDefaultOptions: _searchClusters,
        onKeywordChange: (final String keyword) {
          setState(() {
            _searchKeyword = keyword;
          });

          _onUpdateSearchResult(context);
        },
        onClusterChange: (final List<int> clusters) {
          setState(() {
            _searchClusters = clusters;
          });

          _onUpdateSearchResult(context);
        },
      ),
      body: BlocConsumer<FacilityHospitalBloc, FacilityHospitalState>(
        listener: (context, state) {
          setState(() {
            _disableFilter = state is FacilityHospitalLoading ||
                state is FacilityHospitalFailed;
          });
        },
        builder: (context, state) {
          if (state is FacilityHospitalFailed) {
            return FacilityListErrorPrompt(
              errorMessage: state.errorMessage,
              onPressRefresh: () {
                context
                    .read<FacilityHospitalBloc>()
                    .add(FacilityHospitalRequested());
              },
            );
          }

          if (state is! FacilityHospitalSuccess) {
            return const SliverLoadingIndicator();
          }

          if (state.facilityHospitalData.isEmpty) {
            return SliverNoDataPrompt(
              promptText: t.lists.hospital.noSearchResult,
            );
          }

          final double scrollViewPaddingX = ResponsiveBreakpoints.of(context)
                  .largerOrEqualTo(Constants.screenSizeKeyMedium)
              ? 24.0
              : 16.0;

          return SliverPadding(
            padding: EdgeInsets.only(
              // top: 16.0,
              right: scrollViewPaddingX,
              bottom: MediaQuery.of(context).padding.bottom + 16.0,
              left: scrollViewPaddingX,
            ),
            sliver: SliverList.separated(
              itemBuilder: (context, index) {
                final FacilityHospitalModel item =
                    state.facilityHospitalData[index];

                return FacilityItemCard(
                  institutionName: item.institutionName,
                  address: item.address,
                  clusterCode: item.clusterCode,
                  withAEService: item.withAEService,
                  latitude: item.latitude,
                  longitude: item.longitude,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 16.0,
              ),
              itemCount: state.facilityHospitalData.length,
            ),
          );
        },
      ),
    );
  }
}
