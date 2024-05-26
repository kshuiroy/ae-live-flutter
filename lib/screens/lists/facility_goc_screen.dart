import 'package:ae_live/bloc/facility_goc/facility_goc_bloc.dart';
import 'package:ae_live/config/constants.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/models/facility_goc_model.dart';
import 'package:ae_live/widgets/facility_screen/facility_error_prompt.dart';
import 'package:ae_live/widgets/facility_screen/facility_item_card.dart';
import 'package:ae_live/widgets/facility_screen/facility_list_screen_base.dart';
import 'package:ae_live/widgets/facility_screen/facility_loading_indicator.dart';
import 'package:ae_live/widgets/facility_screen/facility_no_data_prompt.dart';
import 'package:ae_live/widgets/facility_screen/facility_search_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

class FacilityGocScreen extends StatefulWidget {
  const FacilityGocScreen({
    super.key,
    this.showBackButton = true,
  });

  final bool showBackButton;

  @override
  State<FacilityGocScreen> createState() => _FacilityGocScreenState();
}

class _FacilityGocScreenState extends State<FacilityGocScreen> {
  // final TextEditingController _searchTextController = TextEditingController();

  bool _disableFilter = false;
  String? _searchKeyword;
  List<int> _searchClusters = [1, 2, 3, 4, 5, 6, 7];

  void _onUpdateSearchResult(final BuildContext context) {
    context.read<FacilityGocBloc>().add(
          FacilityGocDataFilter(
            keyword: _searchKeyword,
            clusters: _searchClusters,
          ),
        );
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((final _) {
      final FacilityGocState blocState = context.read<FacilityGocBloc>().state;

      if (blocState is FacilityGocInitial || blocState is FacilityGocFailed) {
        // Fetch wait time data if there is no data stored befored.
        context.read<FacilityGocBloc>().add(FacilityGocRequested());
      } else if (blocState is FacilityGocSuccess) {
        // Reset all filters and sorting to default after user go back from
        // other screens.
        context.read<FacilityGocBloc>().add(
              FacilityGocDataFilter(),
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
        keywordHintText: t.lists.goc.search,
        enabled: !_disableFilter,
        clusterButtonLabel: t.lists.goc.cluster,
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
      body: BlocConsumer<FacilityGocBloc, FacilityGocState>(
        listener: (context, state) {
          setState(() {
            _disableFilter =
                state is FacilityGocLoading || state is FacilityGocFailed;
          });
        },
        builder: (context, state) {
          if (state is FacilityGocFailed) {
            return FacilityErrorPrompt(
              errorMessage: state.errorMessage,
              onPressRefresh: () {
                context.read<FacilityGocBloc>().add(FacilityGocRequested());
              },
            );
          }

          if (state is! FacilityGocSuccess) {
            return const FacilityLoadingIndicator();
          }

          if (state.facilityGocData.isEmpty) {
            return FacilityNoDataPrompt(
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
                final FacilityGocModel item = state.facilityGocData[index];

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
              itemCount: state.facilityGocData.length,
            ),
          );
        },
      ),
    );
  }
}
