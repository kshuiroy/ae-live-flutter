import 'dart:io';

import 'package:ae_live/artworks/server_error.dart';
import 'package:ae_live/bloc/facility_hospital/facility_hospital_bloc.dart';
import 'package:ae_live/config/constants.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/models/facility_hospital_model.dart';
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

class FacilityHospitalScreen extends StatefulWidget {
  const FacilityHospitalScreen({super.key});

  @override
  State<FacilityHospitalScreen> createState() => _FacilityHospitalScreenState();
}

class _FacilityHospitalScreenState extends State<FacilityHospitalScreen> {
  final TextEditingController _searchTextController = TextEditingController();

  bool _isLoading = false;
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
      final FacilityHospitalState blocState =
          context.read<FacilityHospitalBloc>().state;

      if (blocState is FacilityHospitalInitial) {
        // Fetch wait time data if there is no data stored befored.
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
                    // left: isCompact ? 8.0 : 16.0,
                  ),
                  child: Row(
                    children: [
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
                      Expanded(
                        child: SearchTextField(
                          controller: _searchTextController,
                          hintText: t.lists.hospital.search,
                          enabled: !_isLoading,
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
                        label: t.lists.hospital.cluster,
                        enabled: !_isLoading,
                        onPressed: () {
                          _showDataFilterSortModal(
                            context,
                            child: ClusterOptionsModal(
                              defaultOptions: _searchClusters,
                              title: t.lists.hospital.cluster,
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
        body: BlocConsumer<FacilityHospitalBloc, FacilityHospitalState>(
          listener: (context, state) {
            setState(() {
              _isLoading = state is FacilityHospitalLoading;
            });
          },
          builder: (context, state) {
            if (state is FacilityHospitalFailed) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom,
                ),
                child: PromptWithArtwork(
                  artwork: ServerError(
                    height: isNarrow ? 320.0 : 400.0,
                    width: isNarrow ? 320.0 : 400.0,
                  ),
                  promptText: t.home.prompt.serverError,
                ),
              );
            }

            if (state is! FacilityHospitalSuccess) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
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
            );
          },
        ),
      ),
    );
  }
}
