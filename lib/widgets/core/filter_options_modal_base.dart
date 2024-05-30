import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/models/filter_options_model.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class FilterOptionsModalBase<T> extends StatefulWidget {
  const FilterOptionsModalBase({
    super.key,
    required this.title,
    required this.options,
    required this.defaultOptions,
    this.onUpdate,
  });

  final String title;
  final List<FilterOptionsModel<T>> options;
  final List<T> defaultOptions;
  final void Function(List<T> options)? onUpdate;

  @override
  State<FilterOptionsModalBase<T>> createState() =>
      _FilterOptionsModalBaseState<T>();
}

class _FilterOptionsModalBaseState<T> extends State<FilterOptionsModalBase<T>> {
  late List<T> _selectedOptions;

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedOptions = widget.defaultOptions;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    widget.title,
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
          _buildFilterOptionsList(context),
          const SizedBox(
            height: 16.0,
          ),
        ],
      ),
    );
  }

  Widget _buildFilterOptionsList(final BuildContext context) {
    final Translations t = Translations.of(context);

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (final BuildContext context, final int index) {
        if (index == widget.options.length) {
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

        final FilterOptionsModel<T> option = widget.options[index];

        return CheckboxListTile.adaptive(
          // key: Key(option.id),
          title: Text(option.title),
          value: _selectedOptions.contains(option.value),
          onChanged: (final bool? isChecked) {
            if (isChecked!) {
              setState(() {
                _selectedOptions = <T>[
                  ..._selectedOptions,
                  option.value,
                ];
              });
            } else {
              setState(() {
                _selectedOptions = <T>[..._selectedOptions]
                    .where((final T element) => element != option.value)
                    .toList();
              });
            }
          },
        );
      },
      itemCount: widget.options.length + 1,
    );
  }
}
