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
import 'package:ae_live/widgets/home_screen/filter_sort_button.dart';
import 'package:ae_live/widgets/home_screen/sorting_options_modal.dart';
import 'package:ae_live/widgets/home_screen/wait_time_list_item.dart';
import 'package:ae_live/widgets/shared/prompt_with_artwork.dart';
import 'package:ae_live/widgets/shared/search_text_field.dart';
import 'package:ae_live/widgets/shared/sliver_error_prompt.dart';
import 'package:ae_live/widgets/shared/sliver_loading_indicator.dart';
import 'package:ae_live/widgets/shared/sliver_no_data_prompt.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

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

  void _init() async {
    _preferences = await SharedPreferences.getInstance();
    setState(() {
      _dataSortType = toWaitTimeSortType(
        _preferences.getString(Constants.preferenceKeyDefaultSorting),
      );
    });
  }

  void _onUpdateSearchResult(final BuildContext context) {
    context.read<WaitTimeBloc>().add(
          WaitTimeDataFilter(
            name: _searchKeyword,
            sortType: _dataSortType,
            clusters: _dataClusters,
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
                  : PromptWithArtwork(
                      artwork: SelectItemFromList(
                        height: isMediumSize ? 320.0 : 400.0,
                        width: isMediumSize ? 320.0 : 400.0,
                      ),
                      promptText: t.home.prompt.selectItem,
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
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    // final bool isSmallerThanMediumSize = ResponsiveBreakpoints.of(context)
    //     .smallerOrEqualTo(Constants.screenSizeKeyMedium);

    return EasyRefresh(
      clipBehavior: Clip.none,
      controller: _refreshController,
      header: ClassicHeader(
        position: IndicatorPosition.locator,
        safeArea: false,
        triggerOffset: 80.0,
        dragText: t.home.refreshIndicator.pullToRefresh,
        armedText: t.home.refreshIndicator.releaseToRefresh,
        readyText: t.home.refreshIndicator.refreshing,
        processingText: t.home.refreshIndicator.refreshing,
        processedText: t.home.refreshIndicator.dataUpdated,
        failedText: t.home.refreshIndicator.failedToRefresh,
        messageText: t.home.refreshIndicator.lastUpdateAt,
      ),
      onRefresh: () {
        context.read<WaitTimeBloc>().add(
              WaitTimeFetchRequested(
                keyword: _searchKeyword,
                clusters: _dataClusters,
                sortType: _dataSortType,
                refreshController: _refreshController,
              ),
            );
        // _refreshController.finishRefresh();
      },
      // onLoad: () => IndicatorResult.noMore,
      child: CustomScrollView(
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
                Wrap(
                  children: <Widget>[
                    FilterSortButton(
                      icon: Symbols.sort_rounded,
                      label: t.home.filter.sorting.title,
                      enabled: !_isLoading,
                      onPressed: () {
                        _showDataFilterSortModal(
                          context,
                          child: SortingOptionsModal(
                            defaultOption: _dataSortType,
                            onUpdate: (final WaitTimeSortType sortType) {
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
                      icon: Symbols.filter_list_rounded,
                      label: t.home.filter.cluster,
                      enabled: !_isLoading,
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
                  ],
                ),
              ],
            ),
          ),
          const HeaderLocator.sliver(),
          BlocConsumer<WaitTimeBloc, WaitTimeState>(
            listener: (final BuildContext context, final WaitTimeState state) {
              setState(() {
                _isLoading = state is WaitTimeLoading;
              });

              if (state is WaitTimeLoading) {
                setState(() {
                  _selectedWaitTime = null;
                });
              }
            },
            builder: (final BuildContext context, final WaitTimeState state) {
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
                            sortType: _dataSortType,
                            refreshController: _refreshController,
                          ),
                        );
                  },
                );
                // return Padding(
                //   padding: EdgeInsets.only(
                //     bottom: MediaQuery.of(context).padding.bottom,
                //   ),
                //   child: Center(
                //     child: Column(
                //       mainAxisSize: MainAxisSize.min,
                //       children: [
                //         PromptWithArtwork(
                //           artwork: ServerError(
                //             height: isSmallerThanMediumSize ? 320.0 : 400.0,
                //             width: isSmallerThanMediumSize ? 320.0 : 400.0,
                //           ),
                //           promptText: state.errorMessage == '-1001'
                //               ? t.home.prompt.noConnection
                //               : t.home.prompt.serverError,
                //           removeCenterContainer: true,
                //         ),
                //         const SizedBox(
                //           height: 24.0,
                //         ),
                //         FilledButton.icon(
                //           onPressed: () {
                //             context.read<WaitTimeBloc>().add(
                //                   WaitTimeFetchRequested(
                //                     keyword: _searchKeyword,
                //                     clusters: _dataClusters,
                //                     sortType: _dataSortType,
                //                   ),
                //                 );
                //           },
                //           icon: const Icon(
                //             Symbols.refresh_rounded,
                //             size: 24.0,
                //             fill: 0.0,
                //             weight: 200.0,
                //             opticalSize: 24.0,
                //           ),
                //           label: Text(t.home.actions.refresh),
                //         ),
                //       ],
                //     ),
                //   ),
                // );
              }

              if (state is! WaitTimeSuccess) {
                return const SliverLoadingIndicator();
                // return Padding(
                //   padding: EdgeInsets.only(
                //     bottom: MediaQuery.of(context).padding.bottom,
                //   ),
                //   child: const Center(
                //     child: CircularProgressIndicator.adaptive(),
                //   ),
                // );
              }

              if (state.waitTimeData.isEmpty) {
                return SliverNoDataPrompt(
                  promptText: t.home.prompt.noSearchResult,
                );
                // return Padding(
                //   padding: EdgeInsets.only(
                //     bottom: MediaQuery.of(context).padding.bottom,
                //   ),
                //   child: PromptWithArtwork(
                //     artwork: NoSearchResult(
                //       height: isSmallerThanMediumSize ? 320.0 : 400.0,
                //       width: isSmallerThanMediumSize ? 320.0 : 400.0,
                //     ),
                //     promptText: t.home.prompt.noSearchResult,
                //   ),
                // );
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
                  itemBuilder: (final BuildContext context, final int index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Symbols.info_rounded,
                              color: colorScheme.error,
                              size: 24.0,
                              fill: 0.0,
                              weight: 200.0,
                              opticalSize: 24.0,
                            ),
                            const SizedBox(
                              width: 16.0,
                            ),
                            Expanded(
                              child: Text(
                                t.home.badgeText,
                                style: textTheme.bodyLarge?.copyWith(
                                  color: colorScheme.error,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    if (index == state.waitTimeData.length + 1) {
                      return Text.rich(
                        t.main.dataRemarks.content(
                          tapPCD: (final String text) => TextSpan(
                            text: text,
                            style: TextStyle(
                              color: colorScheme.primary,
                              decoration: TextDecoration.underline,
                              decorationColor: colorScheme.primary,
                              decorationThickness: 2.0,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                await launchUrl(
                                  Uri.parse(t.main.dataRemarks.pcdUrl),
                                  mode: LaunchMode.inAppBrowserView,
                                );
                              },
                          ),
                          tapHKD: (final String text) => TextSpan(
                            text: text,
                            style: TextStyle(
                              color: colorScheme.primary,
                              decoration: TextDecoration.underline,
                              decorationColor: colorScheme.primary,
                              decorationThickness: 2.0,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                await launchUrl(
                                  Uri.parse(t.main.dataRemarks.hkdUrl),
                                  mode: LaunchMode.inAppBrowserView,
                                );
                              },
                          ),
                        ),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.color
                                  ?.withAlpha(160),
                            ),
                      );
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

    // return NestedScrollView(
    //   floatHeaderSlivers: true,
    //   headerSliverBuilder:
    //       (final BuildContext context, final bool innerBoxIsScrolled) =>
    //           <Widget>[
    //     FrostedGlassSearchHeader(
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         mainAxisSize: MainAxisSize.min,
    //         children: <Widget>[
    //           SearchTextField(
    //             controller: _searchTextController,
    //             hintText: t.home.actions.search,
    //             enabled: !_isLoading,
    //             onChange: (final String value) {
    //               setState(() {
    //                 _searchKeyword = value;
    //               });

    //               _onUpdateSearchResult(context);
    //             },
    //           ),
    //           const SizedBox(
    //             height: 8.0,
    //           ),
    //           Wrap(
    //             children: <Widget>[
    //               FilterSortButton(
    //                 icon: Symbols.sort_rounded,
    //                 label: t.home.filter.sorting.title,
    //                 enabled: !_isLoading,
    //                 onPressed: () {
    //                   _showDataFilterSortModal(
    //                     context,
    //                     child: SortingOptionsModal(
    //                       defaultOption: _dataSortType,
    //                       onUpdate: (final WaitTimeSortType sortType) {
    //                         setState(() {
    //                           _dataSortType = sortType;
    //                         });

    //                         _onUpdateSearchResult(context);
    //                       },
    //                     ),
    //                   );
    //                 },
    //               ),
    //               FilterSortButton(
    //                 icon: Symbols.filter_list_rounded,
    //                 label: t.home.filter.cluster,
    //                 enabled: !_isLoading,
    //                 onPressed: () {
    //                   _showDataFilterSortModal(
    //                     context,
    //                     child: ClusterOptionsModal(
    //                       defaultOptions: _dataClusters,
    //                       onUpdate: (final List<int> clusters) {
    //                         setState(() {
    //                           _dataClusters = clusters;
    //                         });

    //                         _onUpdateSearchResult(context);
    //                       },
    //                     ),
    //                   );
    //                 },
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ],
    //   body: BlocConsumer<WaitTimeBloc, WaitTimeState>(
    //     listener: (final BuildContext context, final WaitTimeState state) {
    //       setState(() {
    //         _isLoading = state is WaitTimeLoading;
    //       });

    //       if (state is WaitTimeLoading) {
    //         setState(() {
    //           _selectedWaitTime = null;
    //         });
    //       }
    //     },
    //     builder: (final BuildContext context, final WaitTimeState state) {
    //       // if (state is WaitTimeInitial) {
    //       //   context.read<WaitTimeBloc>().add(WaitTimeFetchRequested());
    //       // }

    //       if (state is WaitTimeFailed) {
    //         return Padding(
    //           padding: EdgeInsets.only(
    //             bottom: MediaQuery.of(context).padding.bottom,
    //           ),
    //           child: Center(
    //             child: Column(
    //               mainAxisSize: MainAxisSize.min,
    //               children: [
    //                 PromptWithArtwork(
    //                   artwork: ServerError(
    //                     height: isSmallerThanMediumSize ? 320.0 : 400.0,
    //                     width: isSmallerThanMediumSize ? 320.0 : 400.0,
    //                   ),
    //                   promptText: state.errorMessage == '-1001'
    //                       ? t.home.prompt.noConnection
    //                       : t.home.prompt.serverError,
    //                   removeCenterContainer: true,
    //                 ),
    //                 const SizedBox(
    //                   height: 24.0,
    //                 ),
    //                 FilledButton.icon(
    //                   onPressed: () {
    //                     context.read<WaitTimeBloc>().add(
    //                           WaitTimeFetchRequested(
    //                             keyword: _searchKeyword,
    //                             clusters: _dataClusters,
    //                             sortType: _dataSortType,
    //                           ),
    //                         );
    //                   },
    //                   icon: const Icon(
    //                     Symbols.refresh_rounded,
    //                     size: 24.0,
    //                     fill: 0.0,
    //                     weight: 200.0,
    //                     opticalSize: 24.0,
    //                   ),
    //                   label: Text(t.home.actions.refresh),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         );
    //       }

    //       if (state is! WaitTimeSuccess) {
    //         return Padding(
    //           padding: EdgeInsets.only(
    //             bottom: MediaQuery.of(context).padding.bottom,
    //           ),
    //           child: const Center(
    //             child: CircularProgressIndicator.adaptive(),
    //           ),
    //         );
    //       }

    //       if (state.waitTimeData.isEmpty) {
    //         return Padding(
    //           padding: EdgeInsets.only(
    //             bottom: MediaQuery.of(context).padding.bottom,
    //           ),
    //           child: PromptWithArtwork(
    //             artwork: NoSearchResult(
    //               height: isSmallerThanMediumSize ? 320.0 : 400.0,
    //               width: isSmallerThanMediumSize ? 320.0 : 400.0,
    //             ),
    //             promptText: t.home.prompt.noSearchResult,
    //           ),
    //         );
    //       }

    //       final double scrollViewPaddingX = ResponsiveBreakpoints.of(context)
    //               .largerOrEqualTo(Constants.screenSizeKeyMedium)
    //           ? 24.0
    //           : 16.0;

    //       return EasyRefresh(
    //         clipBehavior: Clip.none,
    //         controller: _refreshController,
    //         header: ClassicHeader(
    //           dragText: t.home.refreshIndicator.pullToRefresh,
    //           armedText: t.home.refreshIndicator.releaseToRefresh,
    //           readyText: t.home.refreshIndicator.refreshing,
    //           processingText: t.home.refreshIndicator.refreshing,
    //           processedText: t.home.refreshIndicator.dataUpdated,
    //           failedText: t.home.refreshIndicator.failedToRefresh,
    //           messageText: t.home.refreshIndicator.lastUpdateAt,
    //         ),
    //         onRefresh: () {
    //           context.read<WaitTimeBloc>().add(
    //                 WaitTimeFetchRequested(
    //                   keyword: _searchKeyword,
    //                   clusters: _dataClusters,
    //                   sortType: _dataSortType,
    //                 ),
    //               );
    //           _refreshController.finishRefresh();
    //         },
    //         child: ListView.separated(
    //           padding: EdgeInsets.only(
    //             // top: 16.0,
    //             right: scrollViewPaddingX,
    //             bottom: MediaQuery.of(context).padding.bottom + 16.0,
    //             left: scrollViewPaddingX,
    //           ),
    //           itemBuilder: (final BuildContext context, final int index) {
    //             if (index == 0) {
    //               return Padding(
    //                 padding: const EdgeInsets.symmetric(
    //                   horizontal: 16.0,
    //                   vertical: 8.0,
    //                 ),
    //                 child: Row(
    //                   children: <Widget>[
    //                     Icon(
    //                       Symbols.info_rounded,
    //                       color: colorScheme.error,
    //                       size: 24.0,
    //                       fill: 0.0,
    //                       weight: 200.0,
    //                       opticalSize: 24.0,
    //                     ),
    //                     const SizedBox(
    //                       width: 16.0,
    //                     ),
    //                     Expanded(
    //                       child: Text(
    //                         t.home.badgeText,
    //                         style: textTheme.bodyLarge?.copyWith(
    //                           color: colorScheme.error,
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               );
    //             }

    //             if (index == state.waitTimeData.length + 1) {
    //               return Text.rich(
    //                 t.main.dataRemarks.content(
    //                   tapPCD: (final String text) => TextSpan(
    //                     text: text,
    //                     style: TextStyle(
    //                       color: colorScheme.primary,
    //                       decoration: TextDecoration.underline,
    //                       decorationColor: colorScheme.primary,
    //                       decorationThickness: 2.0,
    //                     ),
    //                     recognizer: TapGestureRecognizer()
    //                       ..onTap = () async {
    //                         await launchUrl(
    //                           Uri.parse(t.main.dataRemarks.pcdUrl),
    //                           mode: LaunchMode.inAppBrowserView,
    //                         );
    //                       },
    //                   ),
    //                   tapHKD: (final String text) => TextSpan(
    //                     text: text,
    //                     style: TextStyle(
    //                       color: colorScheme.primary,
    //                       decoration: TextDecoration.underline,
    //                       decorationColor: colorScheme.primary,
    //                       decorationThickness: 2.0,
    //                     ),
    //                     recognizer: TapGestureRecognizer()
    //                       ..onTap = () async {
    //                         await launchUrl(
    //                           Uri.parse(t.main.dataRemarks.hkdUrl),
    //                           mode: LaunchMode.inAppBrowserView,
    //                         );
    //                       },
    //                   ),
    //                 ),
    //                 style: Theme.of(context).textTheme.bodyMedium?.copyWith(
    //                       color: Theme.of(context)
    //                           .textTheme
    //                           .bodyMedium
    //                           ?.color
    //                           ?.withAlpha(160),
    //                     ),
    //               );
    //             }
    //             return WaitTimeListItem(
    //               data: state.waitTimeData[index - 1],
    //               onTapExpanded: (final WaitTimeModel data) {
    //                 setState(() {
    //                   _selectedWaitTime = data;
    //                 });
    //               },
    //             );
    //           },
    //           separatorBuilder: (final _, final __) {
    //             return const SizedBox(
    //               height: 16.0,
    //             );
    //           },
    //           itemCount: state.waitTimeData.length + 2,
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
