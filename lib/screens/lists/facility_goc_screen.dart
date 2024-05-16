import 'dart:io';

import 'package:ae_live/artworks/no_search_result.dart';
import 'package:ae_live/artworks/server_error.dart';
import 'package:ae_live/bloc/facility_goc/facility_goc_bloc.dart';
import 'package:ae_live/config/constants.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/models/facility_goc_model.dart';
import 'package:ae_live/widgets/core/frosted_glass_search_header.dart';
import 'package:ae_live/widgets/core/responsive_dialog.dart';
import 'package:ae_live/widgets/facility_screen/facility_item_card.dart';
import 'package:ae_live/widgets/home_screen/cluster_options_modal.dart';
import 'package:ae_live/widgets/home_screen/filter_sort_button.dart';
import 'package:ae_live/widgets/shared/prompt_with_artwork.dart';
import 'package:ae_live/widgets/shared/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
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
  final TextEditingController _searchTextController = TextEditingController();

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

  void _showDataFilterSortModal(
    final BuildContext context, {
    required final Widget child,
  }) {
    if (ResponsiveBreakpoints.of(context)
        .largerOrEqualTo(Constants.screenSizeKeyMedium)) {
      showDialog(
        context: context,
        useRootNavigator: true,
        builder: (final BuildContext context) {
          return ResponsiveDialog(
            child: child,
          );
        },
      );
    } else {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        useRootNavigator: true,
        builder: (final BuildContext context) {
          return child;
        },
      );
    }
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
    final bool isCompact = ResponsiveBreakpoints.of(context)
        .smallerOrEqualTo(Constants.screenSizeKeyCompact);
    final bool isNarrow = ResponsiveBreakpoints.of(context)
        .smallerOrEqualTo(Constants.screenSizeKeyMedium);

    return Material(
      child: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
          FrostedGlassSearchHeader(
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 8.0,
                    right: isCompact ? 16.0 : 24.0,
                    bottom: 8.0,
                    left: widget.showBackButton
                        ? 0.0
                        : isCompact
                            ? 16.0
                            : 24.0,
                  ),
                  child: Row(
                    children: [
                      if (widget.showBackButton) ...[
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: Icon(
                            Platform.isIOS || Platform.isMacOS
                                ? Symbols.arrow_back_ios_new
                                : Symbols.arrow_back,
                            size: 24.0,
                            fill: 0.0,
                            opticalSize: 24.0,
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                      ],
                      Expanded(
                        child: SearchTextField(
                          controller: _searchTextController,
                          hintText: t.lists.goc.search,
                          enabled: !_disableFilter,
                          onChange: (final String value) {
                            setState(() {
                              _searchKeyword = value;
                            });

                            _onUpdateSearchResult(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: isCompact ? 16.0 : 24.0,
                    bottom: 8.0,
                    left: isCompact ? 16.0 : 24.0,
                  ),
                  child: Row(
                    children: [
                      FilterSortButton(
                        icon: Symbols.filter_list_rounded,
                        label: t.lists.goc.cluster,
                        enabled: !_disableFilter,
                        onPressed: () {
                          _showDataFilterSortModal(
                            context,
                            child: ClusterOptionsModal(
                              defaultOptions: _searchClusters,
                              title: t.lists.goc.cluster,
                              onUpdate: (final List<int> clusters) {
                                setState(() {
                                  _searchClusters = clusters;
                                });

                                _onUpdateSearchResult(context);
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
        body: BlocConsumer<FacilityGocBloc, FacilityGocState>(
          listener: (context, state) {
            setState(() {
              _disableFilter =
                  state is FacilityGocLoading || state is FacilityGocFailed;
            });
          },
          builder: (context, state) {
            if (state is FacilityGocFailed) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom,
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PromptWithArtwork(
                        artwork: ServerError(
                          height: isNarrow ? 320.0 : 400.0,
                          width: isNarrow ? 320.0 : 400.0,
                        ),
                        promptText: state.errorMessage == '-1001'
                            ? t.home.prompt.noConnection
                            : t.home.prompt.serverError,
                        removeCenterContainer: true,
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      FilledButton.icon(
                        onPressed: () {
                          context
                              .read<FacilityGocBloc>()
                              .add(FacilityGocRequested());
                        },
                        icon: const Icon(
                          Symbols.refresh_rounded,
                          size: 24.0,
                          fill: 0.0,
                          weight: 200.0,
                          opticalSize: 24.0,
                        ),
                        label: Text(t.lists.refresh),
                      ),
                    ],
                  ),
                ),
              );
            }

            if (state is! FacilityGocSuccess) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }

            if (state.facilityGocData.isEmpty) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom,
                ),
                child: PromptWithArtwork(
                  artwork: NoSearchResult(
                    height: isNarrow ? 320.0 : 400.0,
                    width: isNarrow ? 320.0 : 400.0,
                  ),
                  promptText: t.lists.goc.noSearchResult,
                ),
              );
            }

            final double scrollViewPaddingX = ResponsiveBreakpoints.of(context)
                    .largerOrEqualTo(Constants.screenSizeKeyMedium)
                ? 24.0
                : 16.0;

            return ListView.separated(
              padding: EdgeInsets.only(
                // top: 16.0,
                right: scrollViewPaddingX,
                bottom: MediaQuery.of(context).padding.bottom + 16.0,
                left: scrollViewPaddingX,
              ),
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
            );
          },
        ),
      ),
    );
  }
}
