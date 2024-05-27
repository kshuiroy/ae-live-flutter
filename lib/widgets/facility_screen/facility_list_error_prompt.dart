import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/widgets/shared/sliver_error_prompt.dart';
import 'package:flutter/material.dart';

class FacilityListErrorPrompt extends StatelessWidget {
  const FacilityListErrorPrompt({
    super.key,
    required this.errorMessage,
    required this.onPressRefresh,
  });

  final String errorMessage;
  final void Function() onPressRefresh;

  @override
  Widget build(BuildContext context) {
    final Translations t = Translations.of(context);

    return SliverErrorPrompt(
      promptText: errorMessage == '-1001'
          ? t.lists.prompt.noConnection
          : t.lists.prompt.serverError,
      onPressRefresh: onPressRefresh,
    );
  }
}
