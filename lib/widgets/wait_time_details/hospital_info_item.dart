import 'package:ae_live/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HospitalInfoItem extends StatelessWidget {
  const HospitalInfoItem({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.trailing,
    this.onTap,
  });

  final String title;
  final String value;
  final IconData icon;
  final Widget? trailing;
  final void Function()? onTap;

  @override
  Widget build(final BuildContext context) {
    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        child: _getHospitalInfoWidget(context),
      );
    }

    return _getHospitalInfoWidget(context);
  }

  Widget _getHospitalInfoWidget(final BuildContext context) {
    // final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final double screenPaddingX = ResponsiveBreakpoints.of(context)
            .largerOrEqualTo(Constants.screenSizeKeyMedium)
        ? 24.0
        : 16.0;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenPaddingX,
        vertical: 8.0,
      ),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            // color: colorScheme.primary,
            size: 24.0,
            fill: 0.0,
            weight: 200.0,
            opticalSize: 24.0,
          ),
          const SizedBox(
            width: 16.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 2.0,
                ),
                Text(
                  value,
                  style: textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
