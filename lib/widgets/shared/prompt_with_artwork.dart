import 'package:ae_live/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PromptWithArtwork extends StatelessWidget {
  const PromptWithArtwork({
    super.key,
    required this.artwork,
    this.promptText,
    this.promptTextStyle,
  });

  final Widget artwork;
  final String? promptText;
  final TextStyle? promptTextStyle;

  @override
  Widget build(final BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveBreakpoints.of(context)
                  .largerOrEqualTo(Constants.screenSizeKeyMedium)
              ? 24.0
              : 16.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            artwork,
            if (promptText != null) ...<Widget>[
              const SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      promptText!,
                      style: promptTextStyle ??
                          Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
