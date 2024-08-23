import 'package:flutter/material.dart';
import 'package:sys_gallery/src/constants/app_colors_constants.dart';
import 'package:sys_gallery/src/constants/text_constants.dart';

final lightTheme = ThemeData(
  fontFamily: 'Poppins',
  navigationBarTheme: NavigationBarThemeData(
    labelTextStyle: WidgetStateProperty.resolveWith((state) {
      return kCaptionTextStyle.copyWith(
        fontWeight: FontWeight.w600,
        color: kWhite,
      );
    }),
  ),
  colorScheme: const ColorScheme.light(
    primary: kRoyalBluePrimary,
    secondary: kCharcoalPrimary,
    onPrimary: kWhite,
    onSecondary: kWhite,
    onTertiary: kWhite,
    surface: kWhite,
    onSurface: kCharcoalPrimary,
    surfaceTint: Colors.transparent,
  ),
);
