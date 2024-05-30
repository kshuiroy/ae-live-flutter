import 'package:ae_live/config/clusters.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/models/cluster_model.dart';
import 'package:ae_live/models/filter_options_model.dart';
import 'package:ae_live/widgets/core/filter_options_modal_base.dart';
import 'package:flutter/material.dart';

class ClusterOptionsModal extends StatefulWidget {
  const ClusterOptionsModal({
    super.key,
    required this.defaultOptions,
    this.title,
    this.onUpdate,
  });

  final List<int> defaultOptions;
  final String? title;
  final void Function(List<int> clusters)? onUpdate;

  @override
  State<ClusterOptionsModal> createState() => _ClusterOptionsModalState();
}

class _ClusterOptionsModalState extends State<ClusterOptionsModal> {
  // late List<int> _selectedOptions;

  final List<FilterOptionsModel<int>> _clusterOptions = clusters
      .map(
        (ClusterModel option) => FilterOptionsModel(
          title: option.clusterText,
          value: option.clusterCode,
        ),
      )
      .toList();

  @override
  Widget build(final BuildContext context) {
    return FilterOptionsModalBase(
      title: widget.title ?? t.home.filter.cluster,
      options: _clusterOptions,
      defaultOptions: widget.defaultOptions,
      onUpdate: widget.onUpdate,
    );
  }
}
