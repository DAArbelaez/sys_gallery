import 'package:flutter/material.dart';
import 'package:sys_gallery/src/constants/app_colors_constants.dart';

final lightTheme = ThemeData(
  fontFamily: 'Poppins',
  colorScheme: const ColorScheme.light(
    primary: kRoyalBluePrimary,
    secondary: kCharcoalPrimary,
    onPrimary: kWhite,
    onSecondary: kWhite,
    onTertiary: kWhite,
    surface: kLightSilver,
    onSurface: kCharcoalPrimary,
    surfaceTint: Colors.transparent,
  ),
);
