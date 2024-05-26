import 'package:ae_live/artworks/server_error.dart';
import 'package:ae_live/config/constants.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/widgets/shared/prompt_with_artwork.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:responsive_framework/responsive_framework.dart';

class FacilityErrorPrompt extends StatelessWidget {
  const FacilityErrorPrompt({
    super.key,
    required this.errorMessage,
    required this.onPressRefresh,
  });

  final String errorMessage;
  final void Function() onPressRefresh;

  @override
  Widget build(BuildContext context) {
    final Translations t = Translations.of(context);
    final bool isSmallerThanMediumSize = ResponsiveBreakpoints.of(context)
        .smallerOrEqualTo(Constants.screenSizeKeyMedium);

    return SliverFillRemaining(
      hasScrollBody: false,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PromptWithArtwork(
                artwork: ServerError(
                  height: isSmallerThanMediumSize ? 320.0 : 400.0,
                  width: isSmallerThanMediumSize ? 320.0 : 400.0,
                ),
                promptText: errorMessage == '-1001'
                    ? t.lists.prompt.noConnection
                    : t.lists.prompt.serverError,
                removeCenterContainer: true,
              ),
              const SizedBox(
                height: 24.0,
              ),
              FilledButton.icon(
                onPressed: onPressRefresh,
                icon: const Icon(
                  Symbols.refresh_rounded,
                  size: 24.0,
                  fill: 0.0,
                  weight: 200.0,
                  opticalSize: 24.0,
                ),
                label: Text(t.lists.refresh),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
