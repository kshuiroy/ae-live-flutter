import 'package:ae_live/bloc/facility_cmc/facility_cmc_bloc.dart';
import 'package:ae_live/config/constants.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/models/facility_cmc_model.dart';
import 'package:ae_live/utilities/filter_buttons.dart';
import 'package:ae_live/widgets/facility_screen/facility_item_card.dart';
import 'package:ae_live/widgets/facility_screen/facility_list_error_prompt.dart';
import 'package:ae_live/widgets/facility_screen/facility_list_screen_base.dart';
import 'package:ae_live/widgets/facility_screen/facility_search_header.dart';
import 'package:ae_live/widgets/shared/sliver_loading_indicator.dart';
import 'package:ae_live/widgets/shared/sliver_no_data_prompt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

class FacilityCmcScreen extends StatefulWidget {
  const FacilityCmcScreen({
    super.key,
    this.showBackButton = true,
  });

  final bool showBackButton;

  @override
  State<FacilityCmcScreen> createState() => _FacilityCmcScreenState();
}

class _FacilityCmcScreenState extends State<FacilityCmcScreen> {
  bool _disableFilter = false;
  String? _searchKeyword;
  List<int> _searchRegions = [1, 2, 3, 4, 5];

  void _onUpdateSearchResult(final BuildContext context) {
    context.read<FacilityCmcBloc>().add(
          FacilityCmcDataFilter(
            keyword: _searchKeyword,
            regions: _searchRegions,
          ),
        );
  }

  void _onKeywordChange(final BuildContext context, final String keyword) {
    setState(() {
      _searchKeyword = keyword;
    });

    _onUpdateSearchResult(context);
  }

  void _onClusterChange(final BuildContext context, final List<int> regions) {
    setState(() {
      _searchRegions = regions;
    });

    _onUpdateSearchResult(context);
  }

  void _onClearFilter(final BuildContext context) {
    setState(() {
      _searchKeyword = null;
      _searchRegions = [1, 2, 3, 4, 5];
    });

    _onUpdateSearchResult(context);
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((final _) {
      final FacilityCmcState blocState = context.read<FacilityCmcBloc>().state;

      if (blocState is FacilityCmcInitial || blocState is FacilityCmcFailed) {
        // Fetch data if there is no data stored befored.
        context.read<FacilityCmcBloc>().add(FacilityCmcRequested());
      } else if (blocState is FacilityCmcSuccess) {
        // Reset all filters and sorting to default after user go back from
        // other screens.
        context.read<FacilityCmcBloc>().add(
              FacilityCmcDataFilter(),
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
        keywordHintText: t.lists.cmc.search,
        enabled: !_disableFilter,
        filterButtons: const [FilterButtons.regions],
        regionButtonLabel: t.lists.cmc.region,
        regionDefaultOptions: _searchRegions,
        isRegionButtonHighlighted: _searchRegions.length != 5,
        onKeywordChange: (final String keyword) =>
            _onKeywordChange(context, keyword),
        onRegionChange: (final List<int> regions) =>
            _onClusterChange(context, regions),
        onClearFilter: () => _onClearFilter(context),
      ),
      body: BlocConsumer<FacilityCmcBloc, FacilityCmcState>(
        listener: (context, state) {
          setState(() {
            _disableFilter =
                state is FacilityCmcLoading || state is FacilityCmcFailed;
          });
        },
        builder: (context, state) {
          if (state is FacilityCmcFailed) {
            return FacilityListErrorPrompt(
              errorMessage: state.errorMessage,
              onPressRefresh: () {
                context.read<FacilityCmcBloc>().add(FacilityCmcRequested());
              },
            );
          }

          if (state is! FacilityCmcSuccess) {
            return const SliverLoadingIndicator();
          }

          if (state.facilityCmcData.isEmpty) {
            return SliverNoDataPrompt(
              promptText: t.lists.goc.noSearchResult,
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
                final FacilityCmcModel item = state.facilityCmcData[index];

                return FacilityItemCard(
                  institutionName: item.institutionName,
                  address: item.address,
                  // clusterCode: item.clusterCode,
                  latitude: item.latitude,
                  longitude: item.longitude,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 16.0,
              ),
              itemCount: state.facilityCmcData.length,
            ),
          );
        },
      ),
    );
  }
}
