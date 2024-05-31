import 'dart:math';

import 'package:ae_live/artworks/select_item_from_list.dart';
import 'package:ae_live/bloc/wait_time/wait_time_bloc.dart';
import 'package:ae_live/config/constants.dart';
import 'package:ae_live/data/enum/wait_time_sort_type.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/models/wait_time_model.dart';
import 'package:ae_live/screens/wait_time_details_screen.dart';
import 'package:ae_live/widgets/core/controlled_system_ui_container.dart';
import 'package:ae_live/widgets/core/frosted_glass_search_header.dart';
import 'package:ae_live/widgets/core/responsive_dialog.dart';
import 'package:ae_live/widgets/home_screen/cluster_options_modal.dart';
import 'package:ae_live/widgets/home_screen/region_options_modal.dart';
import 'package:ae_live/widgets/home_screen/sorting_options_modal.dart';
import 'package:ae_live/widgets/home_screen/wait_time_list_item.dart';
import 'package:ae_live/widgets/home_screen/wait_time_notice_item.dart';
import 'package:ae_live/widgets/shared/clear_filter_button.dart';
import 'package:ae_live/widgets/shared/filter_sort_button.dart';
import 'package:ae_live/widgets/shared/prompt_with_artwork.dart';
import 'package:ae_live/widgets/shared/search_text_field.dart';
import 'package:ae_live/widgets/shared/sliver_error_prompt.dart';
import 'package:ae_live/widgets/shared/sliver_loading_indicator.dart';
import 'package:ae_live/widgets/shared/sliver_no_data_prompt.dart';
import 'package:ae_live/widgets/shared/wait_time_data_remarks.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SharedPreferences _preferences;
  late EasyRefreshController _refreshController;
  WaitTimeModel? _selectedWaitTime;
  bool _isLoading = false;

  final TextEditingController _searchTextController = TextEditingController();
  String? _searchKeyword;
  late WaitTimeSortType _dataSortType;
  List<int> _dataClusters = <int>[1, 2, 3, 4, 5, 6, 7];
  List<int> _dataRegions = <int>[1, 2, 3, 4, 5];

  final ScrollController _filterOptionsController = ScrollController();
  final ScrollController _waitTimeListController = ScrollController();

  void _init() async {
    _preferences = await SharedPreferences.getInstance();
    setState(() {
      _dataSortType = toWaitTimeSortType(
        _preferences.getString(Constants.preferenceKeyDefaultSorting),
      );
    });
  }

  void _onRefreshWaitTimeData(final BuildContext context) {
    setState(() {
      _isLoading = true;
    });

    context.read<WaitTimeBloc>().add(
          WaitTimeFetchRequested(
            keyword: _searchKeyword,
            clusters: _dataClusters,
            sortType: _dataSortType,
            regions: _dataRegions,
            refreshController: _refreshController,
            onFinished: () {
              setState(() {
                _isLoading = false;
                _selectedWaitTime = null;
              });
            },
          ),
        );
  }

  void _onUpdateSearchResult(final BuildContext context) {
    context.read<WaitTimeBloc>().add(
          WaitTimeDataFilter(
            name: _searchKeyword,
            sortType: _dataSortType,
            clusters: _dataClusters,
            regions: _dataRegions,
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

  void _onClearFilter(final BuildContext context) {
    _searchTextController.clear();

    setState(() {
      _dataClusters = [1, 2, 3, 4, 5, 6, 7];
      _dataRegions = [1, 2, 3, 4, 5];
      _searchKeyword = null;
    });

    _onUpdateSearchResult(context);
  }

  @override
  void initState() {
    super.initState();
    _init();

    _refreshController = EasyRefreshController(
      controlFinishLoad: true,
      controlFinishRefresh: true,
    );

    WidgetsBinding.instance.addPostFrameCallback((final _) {
      final WaitTimeState blocState = context.read<WaitTimeBloc>().state;

      if (blocState is WaitTimeInitial) {
        // Fetch wait time data if there is no data stored befored.
        context.read<WaitTimeBloc>().add(
              WaitTimeFetchRequested(
                refreshController: _refreshController,
              ),
            );
      } else if (blocState is WaitTimeSuccess) {
        // Reset all filters and sorting to default after user go back from
        // other screens.
        context.read<WaitTimeBloc>().add(
              WaitTimeDataFilter(),
            );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    if (ResponsiveBreakpoints.of(context)
        .largerOrEqualTo(Constants.screenSizeKeyMedium)) {
      final bool isMediumSize = ResponsiveBreakpoints.of(context)
          .smallerOrEqualTo(Constants.screenSizeKeyMedium);

      return ControlledSystemUIContainer(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: isMediumSize ? 1 : 3,
              child: _buildWaitTimeListPane(context),
            ),
            const VerticalDivider(
              width: 1.0,
              thickness: 1.0,
            ),
            Expanded(
              flex: isMediumSize ? 1 : 4,
              child: _selectedWaitTime != null
                  ? WaitTimeDetailsScreen(
                      data: _selectedWaitTime!,
                    )
                  : CustomScrollView(
                      slivers: [
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: PromptWithArtwork(
                              artwork: SelectItemFromList(
                                height: isMediumSize ? 320.0 : 400.0,
                                width: isMediumSize ? 320.0 : 400.0,
                              ),
                              promptText: t.home.prompt.selectItem,
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      );
    }

    return ControlledSystemUIContainer(
      child: LayoutBuilder(
        builder:
            (final BuildContext context, final BoxConstraints constraints) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: min(constraints.maxWidth, 560.0),
                ),
                child: _buildWaitTimeListPane(context),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildWaitTimeListPane(final BuildContext context) {
    final Translations t = Translations.of(context);
    final bool isListFiltered = (_searchKeyword ?? '').isNotEmpty ||
        _dataClusters.length != 7 ||
        _dataRegions.length != 5;

    return EasyRefresh.builder(
      controller: _refreshController,
      triggerAxis: Axis.vertical,
      header: ClassicHeader(
        position: IndicatorPosition.locator,
        safeArea: false,
        triggerOffset: 80.0,
        processedDuration: const Duration(milliseconds: 300),
        dragText: t.home.refreshIndicator.pullToRefresh,
        armedText: t.home.refreshIndicator.releaseToRefresh,
        readyText: t.home.refreshIndicator.refreshing,
        processingText: t.home.refreshIndicator.refreshing,
        processedText: t.home.refreshIndicator.dataUpdated,
        failedText: t.home.refreshIndicator.failedToRefresh,
        messageText: t.home.refreshIndicator.lastUpdateAt,
      ),
      onRefresh: () => _onRefreshWaitTimeData(context),
      childBuilder: (final BuildContext context, final ScrollPhysics physics) {
        return Scrollbar(
          controller: _waitTimeListController,
          child: CustomScrollView(
            physics: physics,
            controller: _waitTimeListController,
            slivers: <Widget>[
              FrostedGlassSearchHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SearchTextField(
                      controller: _searchTextController,
                      hintText: t.home.actions.search,
                      enabled: !_isLoading,
                      onChange: (final String value) {
                        setState(() {
                          _searchKeyword = value;
                        });

                        _onUpdateSearchResult(context);
                      },
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: FadingEdgeScrollView.fromSingleChildScrollView(
                            gradientFractionOnStart: 0.2,
                            gradientFractionOnEnd: 0.2,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              controller: _filterOptionsController,
                              padding: isListFiltered
                                  ? const EdgeInsets.only(
                                      right: 8.0,
                                    )
                                  : null,
                              child: Row(
                                children: <Widget>[
                                  FilterSortButton(
                                    icon: Symbols.swap_vert_rounded,
                                    label: t.shared.filter.sorting.title,
                                    enabled: !_isLoading,
                                    onPressed: () {
                                      _showDataFilterSortModal(
                                        context,
                                        child: SortingOptionsModal(
                                          defaultOption: _dataSortType,
                                          onUpdate: (final WaitTimeSortType
                                              sortType) {
                                            setState(() {
                                              _dataSortType = sortType;
                                            });

                                            _onUpdateSearchResult(context);
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                  FilterSortButton(
                                    icon: Symbols.explore_rounded,
                                    label: t.shared.filter.hospitalCluster,
                                    enabled: !_isLoading,
                                    isHighlighted: _dataClusters.length != 7,
                                    onPressed: () {
                                      _showDataFilterSortModal(
                                        context,
                                        child: ClusterOptionsModal(
                                          defaultOptions: _dataClusters,
                                          onUpdate: (final List<int> clusters) {
                                            setState(() {
                                              _dataClusters = clusters;
                                            });

                                            _onUpdateSearchResult(context);
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                  FilterSortButton(
                                    icon: Symbols.travel_explore_rounded,
                                    label: t.shared.filter.region,
                                    enabled: !_isLoading,
                                    isHighlighted: _dataRegions.length != 5,
                                    onPressed: () {
                                      _showDataFilterSortModal(
                                        context,
                                        child: RegionOptionsModal(
                                          defaultOptions: _dataRegions,
                                          onUpdate: (final List<int> regions) {
                                            setState(() {
                                              _dataRegions = regions;
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
                          ),
                        ),
                        if (isListFiltered) ...[
                          SizedBox(
                            height: 28.0,
                            child: VerticalDivider(
                              thickness: 1.0,
                              width: 1.0,
                              color: Theme.of(context).colorScheme.outline,
                            ),
                          ),
                          ClearFilterButton(
                            onPressed: () => _onClearFilter(context),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              const HeaderLocator.sliver(),
              BlocConsumer<WaitTimeBloc, WaitTimeState>(
                listener:
                    (final BuildContext context, final WaitTimeState state) {
                  setState(() {
                    _isLoading = state is WaitTimeLoading;
                  });

                  if (state is WaitTimeLoading) {
                    setState(() {
                      _selectedWaitTime = null;
                    });
                  }
                },
                builder:
                    (final BuildContext context, final WaitTimeState state) {
                  // if (state is WaitTimeInitial) {
                  //   context.read<WaitTimeBloc>().add(WaitTimeFetchRequested());
                  // }

                  if (state is WaitTimeFailed) {
                    return SliverErrorPrompt(
                      promptText: state.errorMessage == '-1001'
                          ? t.home.prompt.noConnection
                          : t.home.prompt.serverError,
                      onPressRefresh: () {
                        context.read<WaitTimeBloc>().add(
                              WaitTimeFetchRequested(
                                keyword: _searchKeyword,
                                clusters: _dataClusters,
                                regions: _dataRegions,
                                sortType: _dataSortType,
                                refreshController: _refreshController,
                              ),
                            );
                      },
                    );
                  }

                  if (state is! WaitTimeSuccess) {
                    return const SliverLoadingIndicator();
                  }

                  if (state.waitTimeData.isEmpty) {
                    return SliverNoDataPrompt(
                      promptText: t.home.prompt.noSearchResult,
                    );
                  }

                  final double scrollViewPaddingX =
                      ResponsiveBreakpoints.of(context)
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
                      itemBuilder:
                          (final BuildContext context, final int index) {
                        if (index == 0) {
                          return const WaitTimeNoticeItem();
                        }

                        if (index == state.waitTimeData.length + 1) {
                          return const WaitTimeDataRemarks();
                        }

                        return WaitTimeListItem(
                          data: state.waitTimeData[index - 1],
                          onTapExpanded: (final WaitTimeModel data) {
                            setState(() {
                              _selectedWaitTime = data;
                            });
                          },
                        );
                      },
                      separatorBuilder: (final _, final __) {
                        return const SizedBox(
                          height: 16.0,
                        );
                      },
                      itemCount: state.waitTimeData.length + 2,
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
