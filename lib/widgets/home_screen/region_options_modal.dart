import 'package:ae_live/config/regions_list.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/models/filter_options_model.dart';
import 'package:ae_live/models/region_model.dart';
import 'package:ae_live/widgets/core/filter_options_modal_base.dart';
import 'package:flutter/material.dart';

class RegionOptionsModal extends StatefulWidget {
  const RegionOptionsModal({
    super.key,
    required this.defaultOptions,
    this.title,
    this.onUpdate,
  });

  final List<int> defaultOptions;
  final String? title;
  final void Function(List<int> regions)? onUpdate;

  @override
  State<RegionOptionsModal> createState() => _RegionOptionsModalState();
}

class _RegionOptionsModalState extends State<RegionOptionsModal> {
  final List<FilterOptionsModel<int>> _regionOptions = regionsList
      .map(
        (RegionModel option) => FilterOptionsModel(
          title: option.regionName,
          value: option.regionCode,
        ),
      )
      .toList();

  @override
  Widget build(final BuildContext context) {
    final Translations t = Translations.of(context);

    return FilterOptionsModalBase<int>(
      title: widget.title ?? t.shared.filter.region,
      options: _regionOptions,
      defaultOptions: widget.defaultOptions,
      onUpdate: widget.onUpdate,
    );
  }
}
