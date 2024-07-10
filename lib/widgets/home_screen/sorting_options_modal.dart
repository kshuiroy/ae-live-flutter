import 'package:ae_live/data/enum/wait_time_sort_type.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/widgets/shared/themed_filled_button_icon.dart';
import 'package:ae_live/widgets/shared/themed_icon.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class SortingOptionsModal extends StatefulWidget {
  const SortingOptionsModal({
    super.key,
    required this.defaultOption,
    this.onUpdate,
  });

  final WaitTimeSortType defaultOption;
  final void Function(WaitTimeSortType sortType)? onUpdate;

  @override
  State<SortingOptionsModal> createState() => _SortingOptionsModalState();
}

class _SortingOptionsModalState extends State<SortingOptionsModal> {
  late WaitTimeSortType _selectedOption;

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedOption = widget.defaultOption;
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
                    t.shared.filter.sorting.title,
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
          _buildSortingOptionsList(context),
          const SizedBox(
            height: 16.0,
          ),
        ],
      ),
    );
  }

  Widget _buildSortingOptionsList(final BuildContext context) {
    final Translations t = Translations.of(context);
    final List<_SortingOptionModel> options = <_SortingOptionModel>[
      _SortingOptionModel(
        title: t.shared.filter.sorting.timeInAsd,
        value: WaitTimeSortType.timeInAsd,
      ),
      _SortingOptionModel(
        title: t.shared.filter.sorting.timeInDesc,
        value: WaitTimeSortType.timeInDesc,
      ),
      _SortingOptionModel(
        title: t.shared.filter.sorting.nameInAsd,
        value: WaitTimeSortType.nameInAsd,
      ),
      _SortingOptionModel(
        title: t.shared.filter.sorting.nameInDesc,
        value: WaitTimeSortType.nameInDesc,
      ),
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (final BuildContext context, final int index) {
        if (index == options.length) {
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
                  child: ThemedFilledButtonIcon(
                    onPressed: () {
                      if (widget.onUpdate != null) {
                        widget.onUpdate!(_selectedOption);
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

        final _SortingOptionModel option = options[index];
        return ListTile(
          contentPadding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
          ),
          title: Text(option.title),
          trailing: Radio(
            groupValue: _selectedOption,
            value: option.value,
            onChanged: (final WaitTimeSortType? value) {
              if (value != null) {
                setState(() {
                  _selectedOption = value;
                });
              }
            },
          ),
          onTap: () {
            setState(() {
              _selectedOption = option.value;
            });
          },
        );
      },
      itemCount: options.length + 1,
    );
  }
}

class _SortingOptionModel {
  _SortingOptionModel({
    required this.title,
    required this.value,
  });

  final String title;
  final WaitTimeSortType value;
}
