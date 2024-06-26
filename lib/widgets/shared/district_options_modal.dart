import 'package:ae_live/config/districts_list.dart';
import 'package:ae_live/config/regions_list.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/models/district_model.dart';
import 'package:ae_live/widgets/shared/themed_icon.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class DistrictOptionsModal extends StatefulWidget {
  const DistrictOptionsModal({
    super.key,
    required this.defaultOptions,
    this.title,
    this.onUpdate,
  });

  final List<int> defaultOptions;
  final String? title;
  final void Function(List<int> districts)? onUpdate;

  @override
  State<DistrictOptionsModal> createState() => _DistrictOptionsModalState();
}

class _DistrictOptionsModalState extends State<DistrictOptionsModal> {
  late List<int> _selectedOptions;

  final Map<int, List<DistrictModel>> _districtGroupedOptions =
      groupBy<DistrictModel, int>(
    districtsList,
    (final DistrictModel option) => option.regionCode,
  );

  final ScrollController _districtOptionsListController = ScrollController();

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedOptions = widget.defaultOptions;
    });
  }

  @override
  Widget build(final BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Translations t = Translations.of(context);

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 16.0,
              right: 16.0,
              bottom: 12.0,
              left: 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Text(
                    t.shared.filter.district,
                    style: textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            indent: 16.0,
            endIndent: 16.0,
            height: 8.0,
          ),
          Expanded(
            child: _buildDistrictOptionsModal(context),
          ),
          _buildModalButtonSection(context),
          const SizedBox(
            height: 16.0,
          ),
        ],
      ),
    );
  }

  Widget _buildDistrictOptionsModal(final BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scrollbar(
      controller: _districtOptionsListController,
      child: ListView.builder(
        controller: _districtOptionsListController,
        itemCount: regionsList.length,
        itemBuilder: (context, regionIndex) {
          final List<DistrictModel> districtOptions =
              _districtGroupedOptions[regionsList[regionIndex].regionCode]!;

          final List<int> allDistrictCodes =
              districtOptions.map((option) => option.districtCode).toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Region header
              CheckboxListTile.adaptive(
                dense: true,
                title: Text(
                  regionsList[regionIndex].regionName,
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                value: allDistrictCodes
                        .every((code) => _selectedOptions.contains(code))
                    ? true
                    : _selectedOptions
                            .any((code) => allDistrictCodes.contains(code))
                        ? null
                        : false,
                tristate: true,
                onChanged: (final bool? isChecked) {
                  debugPrint('Region isChecked: $isChecked');
                  if (isChecked == null) {
                    setState(() {
                      _selectedOptions.removeWhere(
                        (code) => allDistrictCodes.contains(code),
                      );
                    });
                  } else {
                    final Set<int> updatedSelectedOptions =
                        Set<int>.from(_selectedOptions);
                    updatedSelectedOptions.addAll(allDistrictCodes);

                    setState(() {
                      _selectedOptions = updatedSelectedOptions.toList();
                    });
                  }
                },
              ),

              /// District options belong to the region
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 16.0),
                itemCount: districtOptions.length,
                itemBuilder: (context, districtIndex) {
                  final DistrictModel districtOption =
                      districtOptions[districtIndex];

                  return CheckboxListTile.adaptive(
                    dense: true,
                    title: Padding(
                      padding: const EdgeInsets.only(left: 32.0),
                      child: Text(
                        districtOption.districtName,
                        style: textTheme.bodyLarge,
                      ),
                    ),
                    value:
                        _selectedOptions.contains(districtOption.districtCode),
                    onChanged: (final bool? isChecked) {
                      if (isChecked!) {
                        setState(() {
                          _selectedOptions = <int>[
                            ..._selectedOptions,
                            districtOption.districtCode,
                          ];
                        });
                      } else {
                        setState(() {
                          _selectedOptions = <int>[..._selectedOptions]
                              .where(
                                (final int element) =>
                                    element != districtOption.districtCode,
                              )
                              .toList();
                        });
                      }
                    },
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildModalButtonSection(final BuildContext context) {
    final Translations t = Translations.of(context);

    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        right: 16.0,
        left: 16.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {
                /// Reset to select all options.
                setState(() {
                  _selectedOptions = districtsList
                      .map((final DistrictModel option) => option.districtCode)
                      .toList();
                });
              },
              icon: const ThemedIcon(
                Symbols.close_rounded,
              ),
              label: Text(
                t.shared.filter.actions.reset,
              ),
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: FilledButton.icon(
              onPressed: () {
                if (widget.onUpdate != null) {
                  widget.onUpdate!(_selectedOptions);
                }

                // Dismiss the modal
                Navigator.of(context).pop();
              },
              icon: const ThemedIcon(
                Symbols.save_rounded,
              ),
              label: Text(
                t.shared.filter.actions.apply,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
