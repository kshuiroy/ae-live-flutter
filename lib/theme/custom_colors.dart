import 'package:flutter/material.dart';

/// Defines a set of custom colors, each comprised of 4 complementary tones.
///
/// See also:
///   * <https://m3.material.io/styles/color/the-color-system/custom-colors>
@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.sourceWaitQuick,
    required this.waitQuick,
    required this.onWaitQuick,
    required this.waitQuickContainer,
    required this.onWaitQuickContainer,
    required this.sourceWaitSlowest,
    required this.waitSlowest,
    required this.onWaitSlowest,
    required this.waitSlowestContainer,
    required this.onWaitSlowestContainer,
    required this.sourceWaitNormal,
    required this.waitNormal,
    required this.onWaitNormal,
    required this.waitNormalContainer,
    required this.onWaitNormalContainer,
    required this.sourceWaitSlow,
    required this.waitSlow,
    required this.onWaitSlow,
    required this.waitSlowContainer,
    required this.onWaitSlowContainer,
  });

  final Color sourceWaitQuick;
  final Color waitQuick;
  final Color onWaitQuick;
  final Color waitQuickContainer;
  final Color onWaitQuickContainer;
  final Color sourceWaitSlowest;
  final Color waitSlowest;
  final Color onWaitSlowest;
  final Color waitSlowestContainer;
  final Color onWaitSlowestContainer;
  final Color sourceWaitNormal;
  final Color waitNormal;
  final Color onWaitNormal;
  final Color waitNormalContainer;
  final Color onWaitNormalContainer;
  final Color sourceWaitSlow;
  final Color waitSlow;
  final Color onWaitSlow;
  final Color waitSlowContainer;
  final Color onWaitSlowContainer;

  @override
  CustomColors copyWith({
    final Color? sourceWaitQuick,
    final Color? waitQuick,
    final Color? onWaitQuick,
    final Color? waitQuickContainer,
    final Color? onWaitQuickContainer,
    final Color? sourceWaitSlowest,
    final Color? waitSlowest,
    final Color? onWaitSlowest,
    final Color? waitSlowestContainer,
    final Color? onWaitSlowestContainer,
    final Color? sourceWaitNormal,
    final Color? waitNormal,
    final Color? onWaitNormal,
    final Color? waitNormalContainer,
    final Color? onWaitNormalContainer,
    final Color? sourceWaitSlow,
    final Color? waitSlow,
    final Color? onWaitSlow,
    final Color? waitSlowContainer,
    final Color? onWaitSlowContainer,
  }) {
    return CustomColors(
      sourceWaitQuick: sourceWaitQuick ?? this.sourceWaitQuick,
      waitQuick: waitQuick ?? this.waitQuick,
      onWaitQuick: onWaitQuick ?? this.onWaitQuick,
      waitQuickContainer: waitQuickContainer ?? this.waitQuickContainer,
      onWaitQuickContainer: onWaitQuickContainer ?? this.onWaitQuickContainer,
      sourceWaitSlowest: sourceWaitSlowest ?? this.sourceWaitSlowest,
      waitSlowest: waitSlowest ?? this.waitSlowest,
      onWaitSlowest: onWaitSlowest ?? this.onWaitSlowest,
      waitSlowestContainer: waitSlowestContainer ?? this.waitSlowestContainer,
      onWaitSlowestContainer:
          onWaitSlowestContainer ?? this.onWaitSlowestContainer,
      sourceWaitNormal: sourceWaitNormal ?? this.sourceWaitNormal,
      waitNormal: waitNormal ?? this.waitNormal,
      onWaitNormal: onWaitNormal ?? this.onWaitNormal,
      waitNormalContainer: waitNormalContainer ?? this.waitNormalContainer,
      onWaitNormalContainer:
          onWaitNormalContainer ?? this.onWaitNormalContainer,
      sourceWaitSlow: sourceWaitSlow ?? this.sourceWaitSlow,
      waitSlow: waitSlow ?? this.waitSlow,
      onWaitSlow: onWaitSlow ?? this.onWaitSlow,
      waitSlowContainer: waitSlowContainer ?? this.waitSlowContainer,
      onWaitSlowContainer: onWaitSlowContainer ?? this.onWaitSlowContainer,
    );
  }

  @override
  CustomColors lerp(final ThemeExtension<CustomColors>? other, final double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      sourceWaitQuick: Color.lerp(sourceWaitQuick, other.sourceWaitQuick, t)!,
      waitQuick: Color.lerp(waitQuick, other.waitQuick, t)!,
      onWaitQuick: Color.lerp(onWaitQuick, other.onWaitQuick, t)!,
      waitQuickContainer:
          Color.lerp(waitQuickContainer, other.waitQuickContainer, t)!,
      onWaitQuickContainer:
          Color.lerp(onWaitQuickContainer, other.onWaitQuickContainer, t)!,
      sourceWaitSlowest:
          Color.lerp(sourceWaitSlowest, other.sourceWaitSlowest, t)!,
      waitSlowest: Color.lerp(waitSlowest, other.waitSlowest, t)!,
      onWaitSlowest: Color.lerp(onWaitSlowest, other.onWaitSlowest, t)!,
      waitSlowestContainer:
          Color.lerp(waitSlowestContainer, other.waitSlowestContainer, t)!,
      onWaitSlowestContainer:
          Color.lerp(onWaitSlowestContainer, other.onWaitSlowestContainer, t)!,
      sourceWaitNormal:
          Color.lerp(sourceWaitNormal, other.sourceWaitNormal, t)!,
      waitNormal: Color.lerp(waitNormal, other.waitNormal, t)!,
      onWaitNormal: Color.lerp(onWaitNormal, other.onWaitNormal, t)!,
      waitNormalContainer:
          Color.lerp(waitNormalContainer, other.waitNormalContainer, t)!,
      onWaitNormalContainer:
          Color.lerp(onWaitNormalContainer, other.onWaitNormalContainer, t)!,
      sourceWaitSlow: Color.lerp(sourceWaitSlow, other.sourceWaitSlow, t)!,
      waitSlow: Color.lerp(waitSlow, other.waitSlow, t)!,
      onWaitSlow: Color.lerp(onWaitSlow, other.onWaitSlow, t)!,
      waitSlowContainer:
          Color.lerp(waitSlowContainer, other.waitSlowContainer, t)!,
      onWaitSlowContainer:
          Color.lerp(onWaitSlowContainer, other.onWaitSlowContainer, t)!,
    );
  }
}
