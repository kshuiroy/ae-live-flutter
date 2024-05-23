import 'package:ae_live/theme/custom_colors_schemes.g.dart';
import 'package:ae_live/theme/custom_snack_bar_theme.dart';
import 'package:ae_live/theme/new_color_scheme/color_family.dart';
import 'package:ae_live/theme/new_color_scheme/extended_color.dart';
import 'package:ae_live/theme/new_color_scheme/material_scheme.dart';
import 'package:ae_live/theme/new_color_scheme/material_scheme_util.dart';
import 'package:flutter/material.dart';

class MaterialTheme {
  const MaterialTheme(this.textTheme);

  final TextTheme textTheme;

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff31628d),
      surfaceTint: Color(0xff31628d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffcfe5ff),
      onPrimaryContainer: Color(0xff001d34),
      secondary: Color(0xff526070),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffd5e4f7),
      onSecondaryContainer: Color(0xff0e1d2a),
      tertiary: Color(0xff695779),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xfff0dbff),
      onTertiaryContainer: Color(0xff231532),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      background: Color(0xffffffff),
      onBackground: Color(0xff181c20),
      surface: Color(0xfff7f9ff),
      // surface: Color(0xffffffff),
      onSurface: Color(0xff181c20),
      surfaceVariant: Color(0xffdee3eb),
      onSurfaceVariant: Color(0xff42474e),
      outline: Color(0xff72777f),
      outlineVariant: Color(0xffc2c7cf),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3135),
      inverseOnSurface: Color(0xffeff1f6),
      inversePrimary: Color(0xff9dcbfb),
      primaryFixed: Color(0xffcfe5ff),
      onPrimaryFixed: Color(0xff001d34),
      primaryFixedDim: Color(0xff9dcbfb),
      onPrimaryFixedVariant: Color(0xff124a73),
      secondaryFixed: Color(0xffd5e4f7),
      onSecondaryFixed: Color(0xff0e1d2a),
      secondaryFixedDim: Color(0xffb9c8da),
      onSecondaryFixedVariant: Color(0xff3a4857),
      tertiaryFixed: Color(0xfff0dbff),
      onTertiaryFixed: Color(0xff231532),
      tertiaryFixedDim: Color(0xffd4bee6),
      onTertiaryFixedVariant: Color(0xff504060),
      surfaceDim: Color(0xffd8dae0),
      surfaceBright: Color(0xfff7f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f3f9),
      surfaceContainer: Color(0xffeceef4),
      surfaceContainerHigh: Color(0xffe6e8ee),
      surfaceContainerHighest: Color(0xffe0e2e8),
    );
  }

  ThemeData light() {
    return theme(
      lightScheme().toColorScheme(),
      lightScheme().background,
    ).copyWith(
      extensions: [
        lightCustomColors,
      ],
    );
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff0b466f),
      surfaceTint: Color(0xff31628d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff4a78a4),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff364453),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff687686),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff4c3c5c),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff806d90),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfff7f9ff),
      onBackground: Color(0xff181c20),
      surface: Color(0xffffffff),
      onSurface: Color(0xff181c20),
      surfaceVariant: Color(0xffdee3eb),
      onSurfaceVariant: Color(0xff3e434a),
      outline: Color(0xff5a5f66),
      outlineVariant: Color(0xff767b82),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3135),
      inverseOnSurface: Color(0xffeff1f6),
      inversePrimary: Color(0xff9dcbfb),
      primaryFixed: Color(0xff4a78a4),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff2e5f8a),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff687686),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff4f5d6d),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff806d90),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff665577),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd8dae0),
      surfaceBright: Color(0xfff7f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f3f9),
      surfaceContainer: Color(0xffeceef4),
      surfaceContainerHigh: Color(0xffe6e8ee),
      surfaceContainerHighest: Color(0xffe0e2e8),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(
      lightMediumContrastScheme().toColorScheme(),
      lightMediumContrastScheme().background,
    ).copyWith(
      extensions: [
        lightCustomColors,
      ],
    );
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff00243e),
      surfaceTint: Color(0xff31628d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff0b466f),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff152331),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff364453),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff2a1c3a),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff4c3c5c),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfff7f9ff),
      onBackground: Color(0xff181c20),
      surface: Color(0xfff7f9ff),
      onSurface: Color(0xff000000),
      surfaceVariant: Color(0xffdee3eb),
      onSurfaceVariant: Color(0xff1f242a),
      outline: Color(0xff3e434a),
      outlineVariant: Color(0xff3e434a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3135),
      inverseOnSurface: Color(0xffffffff),
      inversePrimary: Color(0xffe0edff),
      primaryFixed: Color(0xff0b466f),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff002f4f),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff364453),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff202e3c),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff4c3c5c),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff352645),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd8dae0),
      surfaceBright: Color(0xfff7f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f3f9),
      surfaceContainer: Color(0xffeceef4),
      surfaceContainerHigh: Color(0xffe6e8ee),
      surfaceContainerHighest: Color(0xffe0e2e8),
    );
  }

  ThemeData lightHighContrast() {
    return theme(
      lightHighContrastScheme().toColorScheme(),
      lightHighContrastScheme().background,
    ).copyWith(
      extensions: [
        lightCustomColors,
      ],
    );
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xff9dcbfb),
      surfaceTint: Color(0xff9dcbfb),
      onPrimary: Color(0xff003355),
      primaryContainer: Color(0xff124a73),
      onPrimaryContainer: Color(0xffcfe5ff),
      secondary: Color(0xffb9c8da),
      onSecondary: Color(0xff243240),
      secondaryContainer: Color(0xff3a4857),
      onSecondaryContainer: Color(0xffd5e4f7),
      tertiary: Color(0xffd4bee6),
      onTertiary: Color(0xff392a49),
      tertiaryContainer: Color(0xff504060),
      onTertiaryContainer: Color(0xfff0dbff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      background: Color(0xff000000),
      onBackground: Color(0xffe0e2e8),
      surface: Color(0xff101418),
      // surface: Color(0xff000000),
      onSurface: Color(0xffe0e2e8),
      surfaceVariant: Color(0xff42474e),
      onSurfaceVariant: Color(0xffc2c7cf),
      outline: Color(0xff8c9199),
      outlineVariant: Color(0xff42474e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e2e8),
      inverseOnSurface: Color(0xff2d3135),
      inversePrimary: Color(0xff31628d),
      primaryFixed: Color(0xffcfe5ff),
      onPrimaryFixed: Color(0xff001d34),
      primaryFixedDim: Color(0xff9dcbfb),
      onPrimaryFixedVariant: Color(0xff124a73),
      secondaryFixed: Color(0xffd5e4f7),
      onSecondaryFixed: Color(0xff0e1d2a),
      secondaryFixedDim: Color(0xffb9c8da),
      onSecondaryFixedVariant: Color(0xff3a4857),
      tertiaryFixed: Color(0xfff0dbff),
      onTertiaryFixed: Color(0xff231532),
      tertiaryFixedDim: Color(0xffd4bee6),
      onTertiaryFixedVariant: Color(0xff504060),
      surfaceDim: Color(0xff101418),
      surfaceBright: Color(0xff36393e),
      surfaceContainerLowest: Color(0xff0b0e12),
      surfaceContainerLow: Color(0xff181c20),
      surfaceContainer: Color(0xff1d2024),
      surfaceContainerHigh: Color(0xff272a2f),
      surfaceContainerHighest: Color(0xff32353a),
    );
  }

  ThemeData dark() {
    return theme(
      darkScheme().toColorScheme(),
      darkScheme().background,
    ).copyWith(
      extensions: [
        darkCustomColors,
      ],
    );
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa2cfff),
      surfaceTint: Color(0xff9dcbfb),
      onPrimary: Color(0xff00182b),
      primaryContainer: Color(0xff6795c2),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffbeccdf),
      onSecondary: Color(0xff091725),
      secondaryContainer: Color(0xff8492a3),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffd8c3ea),
      onTertiary: Color(0xff1e0f2d),
      tertiaryContainer: Color(0xff9d89ae),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff000000),
      onBackground: Color(0xffe0e2e8),
      surface: Color(0xff000000),
      onSurface: Color(0xfffafaff),
      surfaceVariant: Color(0xff42474e),
      onSurfaceVariant: Color(0xffc6cbd3),
      outline: Color(0xff9ea3ab),
      outlineVariant: Color(0xff7f838b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e2e8),
      inverseOnSurface: Color(0xff272a2f),
      inversePrimary: Color(0xff144b75),
      primaryFixed: Color(0xffcfe5ff),
      onPrimaryFixed: Color(0xff001223),
      primaryFixedDim: Color(0xff9dcbfb),
      onPrimaryFixedVariant: Color(0xff00395e),
      secondaryFixed: Color(0xffd5e4f7),
      onSecondaryFixed: Color(0xff04121f),
      secondaryFixedDim: Color(0xffb9c8da),
      onSecondaryFixedVariant: Color(0xff2a3746),
      tertiaryFixed: Color(0xfff0dbff),
      onTertiaryFixed: Color(0xff190a27),
      tertiaryFixedDim: Color(0xffd4bee6),
      onTertiaryFixedVariant: Color(0xff3f2f4f),
      surfaceDim: Color(0xff101418),
      surfaceBright: Color(0xff36393e),
      surfaceContainerLowest: Color(0xff0b0e12),
      surfaceContainerLow: Color(0xff181c20),
      surfaceContainer: Color(0xff1d2024),
      surfaceContainerHigh: Color(0xff272a2f),
      surfaceContainerHighest: Color(0xff32353a),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(
      darkMediumContrastScheme().toColorScheme(),
      darkMediumContrastScheme().background,
    ).copyWith(
      extensions: [
        darkCustomColors,
      ],
    );
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffafaff),
      surfaceTint: Color(0xff9dcbfb),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffa2cfff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffafaff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffbeccdf),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffff9fc),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffd8c3ea),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff101418),
      onBackground: Color(0xffe0e2e8),
      surface: Color(0xff101418),
      onSurface: Color(0xffffffff),
      surfaceVariant: Color(0xff42474e),
      onSurfaceVariant: Color(0xfffafaff),
      outline: Color(0xffc6cbd3),
      outlineVariant: Color(0xffc6cbd3),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e2e8),
      inverseOnSurface: Color(0xff000000),
      inversePrimary: Color(0xff002c4b),
      primaryFixed: Color(0xffd7e9ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffa2cfff),
      onPrimaryFixedVariant: Color(0xff00182b),
      secondaryFixed: Color(0xffdae8fb),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffbeccdf),
      onSecondaryFixedVariant: Color(0xff091725),
      tertiaryFixed: Color(0xfff3e0ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffd8c3ea),
      onTertiaryFixedVariant: Color(0xff1e0f2d),
      surfaceDim: Color(0xff101418),
      surfaceBright: Color(0xff36393e),
      surfaceContainerLowest: Color(0xff0b0e12),
      surfaceContainerLow: Color(0xff181c20),
      surfaceContainer: Color(0xff1d2024),
      surfaceContainerHigh: Color(0xff272a2f),
      surfaceContainerHighest: Color(0xff32353a),
    );
  }

  ThemeData darkHighContrast() {
    return theme(
      darkHighContrastScheme().toColorScheme(),
      darkHighContrastScheme().background,
    ).copyWith(
      extensions: [
        darkCustomColors,
      ],
    );
  }

  ThemeData theme(
    final ColorScheme colorScheme,
    final Color backgroundColor,
  ) =>
      ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        snackBarTheme: customSnackBarTheme,
        scaffoldBackgroundColor: backgroundColor,
        canvasColor: colorScheme.surface,
      );

  /// Wait Quick
  static const waitQuick = ExtendedColor(
    seed: Color(0xff21b838),
    value: Color(0xff21b838),
    light: ColorFamily(
      color: Color(0xff3c6839),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffbdf0b3),
      onColorContainer: Color(0xff002203),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(0xff3c6839),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffbdf0b3),
      onColorContainer: Color(0xff002203),
    ),
    lightHighContrast: ColorFamily(
      color: Color(0xff3c6839),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffbdf0b3),
      onColorContainer: Color(0xff002203),
    ),
    dark: ColorFamily(
      color: Color(0xffa1d399),
      onColor: Color(0xff0b390f),
      colorContainer: Color(0xff245023),
      onColorContainer: Color(0xffbdf0b3),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(0xffa1d399),
      onColor: Color(0xff0b390f),
      colorContainer: Color(0xff245023),
      onColorContainer: Color(0xffbdf0b3),
    ),
    darkHighContrast: ColorFamily(
      color: Color(0xffa1d399),
      onColor: Color(0xff0b390f),
      colorContainer: Color(0xff245023),
      onColorContainer: Color(0xffbdf0b3),
    ),
  );

  /// Wait Slowest
  static const waitSlowest = ExtendedColor(
    seed: Color(0xffbd1313),
    value: Color(0xffbd1313),
    light: ColorFamily(
      color: Color(0xff904a42),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffffdad5),
      onColorContainer: Color(0xff3b0906),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(0xff904a42),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffffdad5),
      onColorContainer: Color(0xff3b0906),
    ),
    lightHighContrast: ColorFamily(
      color: Color(0xff904a42),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffffdad5),
      onColorContainer: Color(0xff3b0906),
    ),
    dark: ColorFamily(
      color: Color(0xffffb4aa),
      onColor: Color(0xff561e18),
      colorContainer: Color(0xff73342c),
      onColorContainer: Color(0xffffdad5),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(0xffffb4aa),
      onColor: Color(0xff561e18),
      colorContainer: Color(0xff73342c),
      onColorContainer: Color(0xffffdad5),
    ),
    darkHighContrast: ColorFamily(
      color: Color(0xffffb4aa),
      onColor: Color(0xff561e18),
      colorContainer: Color(0xff73342c),
      onColorContainer: Color(0xffffdad5),
    ),
  );

  /// Wait Normal
  static const waitNormal = ExtendedColor(
    seed: Color(0xff0c7bb3),
    value: Color(0xff0c7bb3),
    light: ColorFamily(
      color: Color(0xff28638a),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffcae6ff),
      onColorContainer: Color(0xff001e30),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(0xff28638a),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffcae6ff),
      onColorContainer: Color(0xff001e30),
    ),
    lightHighContrast: ColorFamily(
      color: Color(0xff28638a),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffcae6ff),
      onColorContainer: Color(0xff001e30),
    ),
    dark: ColorFamily(
      color: Color(0xff96ccf8),
      onColor: Color(0xff00344f),
      colorContainer: Color(0xff004b70),
      onColorContainer: Color(0xffcae6ff),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(0xff96ccf8),
      onColor: Color(0xff00344f),
      colorContainer: Color(0xff004b70),
      onColorContainer: Color(0xffcae6ff),
    ),
    darkHighContrast: ColorFamily(
      color: Color(0xff96ccf8),
      onColor: Color(0xff00344f),
      colorContainer: Color(0xff004b70),
      onColorContainer: Color(0xffcae6ff),
    ),
  );

  /// Wait Slow
  static const waitSlow = ExtendedColor(
    seed: Color(0xffbaae0b),
    value: Color(0xffbaae0b),
    light: ColorFamily(
      color: Color(0xff666014),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffefe58b),
      onColorContainer: Color(0xff1f1c00),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(0xff666014),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffefe58b),
      onColorContainer: Color(0xff1f1c00),
    ),
    lightHighContrast: ColorFamily(
      color: Color(0xff666014),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffefe58b),
      onColorContainer: Color(0xff1f1c00),
    ),
    dark: ColorFamily(
      color: Color(0xffd2c972),
      onColor: Color(0xff353100),
      colorContainer: Color(0xff4e4800),
      onColorContainer: Color(0xffefe58b),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(0xffd2c972),
      onColor: Color(0xff353100),
      colorContainer: Color(0xff4e4800),
      onColorContainer: Color(0xffefe58b),
    ),
    darkHighContrast: ColorFamily(
      color: Color(0xffd2c972),
      onColor: Color(0xff353100),
      colorContainer: Color(0xff4e4800),
      onColorContainer: Color(0xffefe58b),
    ),
  );

  List<ExtendedColor> get extendedColors => [
        waitQuick,
        waitSlowest,
        waitNormal,
        waitSlow,
      ];
}
