import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/models/settings_option_model.dart';
import 'package:ae_live/widgets/core/frosted_glass_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class SettingsOptionScreenBase<T> extends StatefulWidget {
  const SettingsOptionScreenBase({
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
  State<SettingsOptionScreenBase<T>> createState() =>
      _SettingsOptionScreenBaseState<T>();
}

class _SettingsOptionScreenBaseState<T>
    extends State<SettingsOptionScreenBase<T>> {
  late T _selectedOption;

  @override
  void initState() {
    super.initState();

    setState(() {
      _selectedOption = widget.defaultOption;
    });
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: FrostedGlassAppBar(
        title: Text(
          widget.title,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: _buildOptionsList(context),
    );
  }

  Widget _buildOptionsList(final BuildContext context) {
    final Translations t = Translations.of(context);

    return ListView.builder(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + kToolbarHeight,
        bottom: MediaQuery.of(context).padding.bottom + 16.0,
      ),
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
            onChanged: (final T? value) {
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
