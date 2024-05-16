import 'package:ae_live/config/clusters.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/models/cluster_model.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

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
  late List<int> _selectedOptions;

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

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
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
                    widget.title ?? t.home.filter.cluster,
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
          _buildClusterOptionsList(context),
          const SizedBox(
            height: 16.0,
          ),
        ],
      ),
    );
  }

  Widget _buildClusterOptionsList(final BuildContext context) {
    final Translations t = Translations.of(context);

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (final BuildContext context, final int index) {
        if (index == clusters.length) {
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
                  child: FilledButton.icon(
                    onPressed: () {
                      if (widget.onUpdate != null) {
                        widget.onUpdate!(_selectedOptions);
                      }

                      // Dismiss the modal
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Symbols.save_rounded,
                      size: 24.0,
                      fill: 0.0,
                      weight: 200.0,
                      opticalSize: 24.0,
                    ),
                    label: Text(
                      t.home.filter.submit,
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        final ClusterModel option = clusters[index];
        final AppLocale currentLocale = LocaleSettings.currentLocale;

        return CheckboxListTile.adaptive(
          // key: Key(option.id),
          title: Text(
            currentLocale == AppLocale.zhHk
                ? option.nameTC
                : currentLocale == AppLocale.zhCn
                    ? option.nameSC
                    : option.nameEN,
          ),
          value: _selectedOptions.contains(option.clusterCode),
          onChanged: (final bool? isChecked) {
            if (isChecked!) {
              setState(() {
                _selectedOptions = <int>[
                  ..._selectedOptions,
                  option.clusterCode
                ];
              });
            } else {
              setState(() {
                _selectedOptions = <int>[..._selectedOptions]
                    .where((final int element) => element != option.clusterCode)
                    .toList();
              });
            }
          },
        );
      },
      itemCount: clusters.length + 1,
    );
  }
}
