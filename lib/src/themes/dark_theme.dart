import 'package:flutter/material.dart';
import 'package:sys_gallery/src/constants/app_colors_constants.dart';

final darkTheme = ThemeData(
  fontFamily: 'Poppins',
  colorScheme: const ColorScheme.dark(
    primary: kRoyalBluePrimary,
    secondary: kCharcoalPrimary,
    onPrimary: kWhite,
    onSecondary: kWhite,
    onTertiary: kWhite,
    surface: kCharcoalPrimary,
    onSurface: kWhite,
    surfaceTint: Colors.transparent,
  ),
);
