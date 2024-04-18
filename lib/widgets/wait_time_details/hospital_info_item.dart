import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        child: _getHospitalInfoWidget(context),
      );
    }

    return _getHospitalInfoWidget(context);
  }

  Widget _getHospitalInfoWidget(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: colorScheme.outline,
              ),
              borderRadius: BorderRadius.circular(40.0),
            ),
            width: 48.0,
            height: 48.0,
            child: Center(
              child: Icon(
                icon,
                color: colorScheme.primary,
                size: 24.0,
                fill: 0.0,
                weight: 200.0,
                opticalSize: 24.0,
              ),
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
