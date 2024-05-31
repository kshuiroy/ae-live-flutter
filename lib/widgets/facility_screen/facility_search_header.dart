import 'package:ae_live/config/constants.dart';
import 'package:ae_live/utilities/platform_helper.dart';
import 'package:ae_live/widgets/core/frosted_glass_search_header.dart';
import 'package:ae_live/widgets/core/responsive_dialog.dart';
import 'package:ae_live/widgets/home_screen/cluster_options_modal.dart';
import 'package:ae_live/widgets/shared/clear_filter_button.dart';
import 'package:ae_live/widgets/shared/filter_sort_button.dart';
import 'package:ae_live/widgets/shared/search_text_field.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:responsive_framework/responsive_framework.dart';

class FacilitySearchHeader extends StatefulWidget {
  const FacilitySearchHeader({
    super.key,
    required this.showBackButton,
    required this.keywordHintText,
    required this.enabled,
    this.onKeywordChange,
    required this.clusterButtonLabel,
    required this.clusterDefaultOptions,
    this.isClusterButtonHighlighted = false,
    this.onClusterChange,
    this.onClearFilter,
  });

  final bool showBackButton;
  final String keywordHintText;
  final bool enabled;
  final void Function(String keyword)? onKeywordChange;
  final String clusterButtonLabel;
  final List<int> clusterDefaultOptions;
  final bool isClusterButtonHighlighted;
  final void Function(List<int> clusters)? onClusterChange;
  final void Function()? onClearFilter;

  @override
  State<FacilitySearchHeader> createState() => _FacilitySearchHeaderState();
}

class _FacilitySearchHeaderState extends State<FacilitySearchHeader> {
  final TextEditingController _searchTextController = TextEditingController();
  final ScrollController _filterOptionsController = ScrollController();

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
  Widget build(BuildContext context) {
    final bool isCompactSize = ResponsiveBreakpoints.of(context)
        .smallerOrEqualTo(Constants.screenSizeKeyCompact);
    final bool isListFiltered = _searchTextController.text.isNotEmpty ||
        widget.isClusterButtonHighlighted;

    return FrostedGlassSearchHeader(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 8.0,
              right: isCompactSize ? 16.0 : 24.0,
              bottom: 8.0,
              left: widget.showBackButton
                  ? 0.0
                  : isCompactSize
                      ? 16.0
                      : 24.0,
            ),
            child: Row(
              children: [
                if (widget.showBackButton) ...[
                  IconButton(
                    padding: const EdgeInsets.all(16.0),
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      PlatformHelper.isApplePlatform
                          ? Symbols.arrow_back_ios_new
                          : Symbols.arrow_back,
                      size: 24.0,
                      fill: 0.0,
                      opticalSize: 24.0,
                    ),
                    tooltip:
                        MaterialLocalizations.of(context).backButtonTooltip,
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                ],
                Expanded(
                  child: SearchTextField(
                    controller: _searchTextController,
                    hintText: widget.keywordHintText,
                    enabled: widget.enabled,
                    onChange: widget.onKeywordChange,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: isCompactSize ? 16.0 : 24.0,
              bottom: 8.0,
              left: isCompactSize ? 16.0 : 24.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: FadingEdgeScrollView.fromSingleChildScrollView(
                    gradientFractionOnStart: 0.2,
                    gradientFractionOnEnd: 0.2,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      controller: _filterOptionsController,
                      child: Row(
                        children: [
                          FilterSortButton(
                            icon: Symbols.explore_rounded,
                            label: widget.clusterButtonLabel,
                            enabled: widget.enabled,
                            isHighlighted: widget.isClusterButtonHighlighted,
                            onPressed: () {
                              _showDataFilterSortModal(
                                context,
                                child: ClusterOptionsModal(
                                  defaultOptions: widget.clusterDefaultOptions,
                                  title: widget.clusterButtonLabel,
                                  onUpdate: widget.onClusterChange,
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
                    onPressed: () {
                      _searchTextController.clear();

                      if (widget.onClearFilter != null) {
                        widget.onClearFilter!();
                      }
                    },
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
