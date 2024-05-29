import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.defaultValue,
    this.enabled,
    this.onChange,
  });

  final TextEditingController controller;
  final String? hintText;
  final String? defaultValue;
  final bool? enabled;
  final void Function(String value)? onChange;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  void initState() {
    super.initState();

    if (widget.defaultValue != null) {
      widget.controller.text = widget.defaultValue!;
    }
  }

  @override
  Widget build(final BuildContext context) {
    // final Translations t = Translations.of(context);

    return TextFormField(
      controller: widget.controller,
      enabled: widget.enabled,
      decoration: InputDecoration(
        isDense: true,
        prefixIcon: const Icon(
          Symbols.search_rounded,
          size: 24.0,
          fill: 0.0,
          weight: 200.0,
          opticalSize: 24.0,
        ),
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(40.0),
          ),
        ),
        hintText: widget.hintText,
      ),
      onChanged: widget.onChange,
      onTapOutside: (final PointerDownEvent event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      keyboardType: TextInputType.text,
    );
  }
}
