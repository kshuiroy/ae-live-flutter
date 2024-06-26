import 'package:ae_live/artworks/server_error.dart';
import 'package:ae_live/config/constants.dart';
import 'package:ae_live/i18n/translations.g.dart';
import 'package:ae_live/widgets/shared/prompt_with_artwork.dart';
import 'package:ae_live/widgets/shared/themed_icon.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SliverErrorPrompt extends StatelessWidget {
  const SliverErrorPrompt({
    super.key,
    required this.promptText,
    required this.onPressRefresh,
  });

  final String promptText;
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
                promptText: promptText,
                removeCenterContainer: true,
              ),
              const SizedBox(
                height: 24.0,
              ),
              FilledButton.icon(
                onPressed: onPressRefresh,
                icon: const ThemedIcon(
                  Symbols.refresh_rounded,
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
