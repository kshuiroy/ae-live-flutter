import 'package:ae_live/config/constants.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/models/settings_option_model.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ResponsiveSettingsPane<T> extends StatefulWidget {
  const ResponsiveSettingsPane({
    super.key,
    required this.title,
    required this.options,
    required this.defaultOption,
    this.onSave,
  });

  final String title;
  final List<SettingsOptionModel<T>> options;
  final T defaultOption;
  final void Function(T value)? onSave;

  @override
  State<ResponsiveSettingsPane<T>> createState() =>
      _ResponsiveSettingsPaneState<T>();
}

class _ResponsiveSettingsPaneState<T> extends State<ResponsiveSettingsPane<T>> {
  late T _selectedOption;

  @override
  void initState() {
    super.initState();

    setState(() {
      _selectedOption = widget.defaultOption;
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final TextTheme textTheme = Theme.of(context).textTheme;

    if (ResponsiveBreakpoints.of(context)
        .largerOrEqualTo(Constants.screenSizeKeyExpanded)) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            t.settings.appearance.theme.title,
          ),
        ),
        body: SafeArea(
          child: _buildOptionsList(context),
        ),
      );
    }

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 16.0,
              right: 16.0,
              bottom: 12.0,
              left: 16.0,
            ),
            child: Text(
              widget.title,
              style: textTheme.titleLarge,
            ),
          ),
          const Divider(
            indent: 16.0,
            endIndent: 16.0,
            height: 8.0,
          ),
          _buildOptionsList(context),
          const SizedBox(
            height: 16.0,
          ),
        ],
      ),
    );
  }

  Widget _buildOptionsList(BuildContext context) {
    final t = Translations.of(context);

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        if (index == widget.options.length) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 16.0,
              right: 16.0,
              left: 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: FilledButton.tonalIcon(
                    onPressed: () {
                      if (widget.onSave != null) {
                        widget.onSave!(_selectedOption);
                      }
                    },
                    icon: const Icon(
                      Symbols.save_rounded,
                      size: 24.0,
                      fill: 0.0,
                      weight: 200.0,
                      opticalSize: 24.0,
                    ),
                    label: Text(
                      t.settings.save,
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        final SettingsOptionModel<T> option = widget.options[index];

        return ListTile(
          contentPadding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
          ),
          title: Text(option.title),
          trailing: Radio(
            groupValue: _selectedOption,
            value: option.value,
            onChanged: (T? value) {
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
      itemCount: widget.options.length + 1,
    );
  }
}
