import 'package:ae_live/bloc/facility_soc/facility_soc_bloc.dart';
import 'package:ae_live/config/constants.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/models/facility_soc_model.dart';
import 'package:ae_live/utilities/filter_buttons.dart';
import 'package:ae_live/widgets/facility_screen/facility_item_card.dart';
import 'package:ae_live/widgets/facility_screen/facility_list_error_prompt.dart';
import 'package:ae_live/widgets/facility_screen/facility_list_screen_base.dart';
import 'package:ae_live/widgets/facility_screen/facility_search_header.dart';
import 'package:ae_live/widgets/shared/sliver_loading_indicator.dart';
import 'package:ae_live/widgets/shared/sliver_no_data_prompt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

class FacilitySocScreen extends StatefulWidget {
  const FacilitySocScreen({
    super.key,
    this.showBackButton = true,
  });

  final bool showBackButton;

  @override
  State<FacilitySocScreen> createState() => _FacilitySocScreenState();
}

class _FacilitySocScreenState extends State<FacilitySocScreen> {
  bool _disableFilter = false;
  String? _searchKeyword;
  List<int> _searchClusters = [1, 2, 3, 4, 5, 6, 7];

  void _onUpdateSearchResult(final BuildContext context) {
    context.read<FacilitySocBloc>().add(
          FacilitySocDataFilter(
            keyword: _searchKeyword,
            clusters: _searchClusters,
          ),
        );
  }

  void _onKeywordChange(final BuildContext context, final String keyword) {
    setState(() {
      _searchKeyword = keyword;
    });

    _onUpdateSearchResult(context);
  }

  void _onClusterChange(final BuildContext context, final List<int> clusters) {
    setState(() {
      _searchClusters = clusters;
    });

    _onUpdateSearchResult(context);
  }

  void _onClearFilter(final BuildContext context) {
    setState(() {
      _searchKeyword = null;
      _searchClusters = [1, 2, 3, 4, 5, 6, 7];
    });

    _onUpdateSearchResult(context);
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((final _) {
      final FacilitySocState blocState = context.read<FacilitySocBloc>().state;

      if (blocState is FacilitySocInitial || blocState is FacilitySocFailed) {
        // Fetch wait time data if there is no data stored befored.
        context.read<FacilitySocBloc>().add(FacilitySocRequested());
      } else if (blocState is FacilitySocSuccess) {
        // Reset all filters and sorting to default after user go back from
        // other screens.
        context.read<FacilitySocBloc>().add(
              FacilitySocDataFilter(),
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
        keywordHintText: t.lists.soc.search,
        enabled: !_disableFilter,
        filterButtons: const [FilterButtons.clusters],
        clusterButtonLabel: t.lists.soc.cluster,
        clusterDefaultOptions: _searchClusters,
        isClusterButtonHighlighted: _searchClusters.length != 7,
        onKeywordChange: (final String keyword) =>
            _onKeywordChange(context, keyword),
        onClusterChange: (final List<int> clusters) =>
            _onClusterChange(context, clusters),
        onClearFilter: () => _onClearFilter(context),
      ),
      body: BlocConsumer<FacilitySocBloc, FacilitySocState>(
        listener: (context, state) {
          setState(() {
            _disableFilter =
                state is FacilitySocLoading || state is FacilitySocFailed;
          });
        },
        builder: (context, state) {
          if (state is FacilitySocFailed) {
            return FacilityListErrorPrompt(
              errorMessage: state.errorMessage,
              onPressRefresh: () {
                context.read<FacilitySocBloc>().add(FacilitySocRequested());
              },
            );
          }

          if (state is! FacilitySocSuccess) {
            return const SliverLoadingIndicator();
          }

          if (state.facilitySocData.isEmpty) {
            return SliverNoDataPrompt(
              promptText: t.lists.soc.noSearchResult,
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
                final FacilitySocModel item = state.facilitySocData[index];

                return FacilityItemCard(
                  institutionName: item.institutionName,
                  address: item.address,
                  clusterCode: item.clusterCode,
                  latitude: item.latitude,
                  longitude: item.longitude,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 16.0,
              ),
              itemCount: state.facilitySocData.length,
            ),
          );
        },
      ),
    );
  }
}
