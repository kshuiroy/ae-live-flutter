import 'package:ae_live/artworks/no_search_result.dart';
import 'package:ae_live/config/constants.dart';
import 'package:ae_live/widgets/shared/prompt_with_artwork.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class FacilityNoDataPrompt extends StatelessWidget {
  const FacilityNoDataPrompt({
    super.key,
    required this.promptText,
  });

  final String promptText;

  @override
  Widget build(BuildContext context) {
    final bool isSmallerThanMediumSize = ResponsiveBreakpoints.of(context)
        .smallerOrEqualTo(Constants.screenSizeKeyMedium);

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom,
      ),
      child: PromptWithArtwork(
        artwork: NoSearchResult(
          height: isSmallerThanMediumSize ? 320.0 : 400.0,
          width: isSmallerThanMediumSize ? 320.0 : 400.0,
        ),
        promptText: promptText,
      ),
    );
  }
}
