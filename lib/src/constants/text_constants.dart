import 'package:flutter/material.dart';
import 'package:sys_gallery/src/constants/app_colors_constants.dart';
import 'package:sys_gallery/src/constants/int_constants.dart';

//Text Style

class AppStyles {
  static TextStyle titleTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: kTextTitleSize,
      color: Theme.of(context).colorScheme.onSurface,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle mediumTitleTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: kTextMediumTitleSize,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle subtitleTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: kTextSubtitleSize,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle contentTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: kTextContentSize,
      color: Theme.of(context).colorScheme.onSurface,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle captionTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: kTextCaptionSize,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle customButtonTextStyle() {
    return const TextStyle(
      fontSize: kTextContentSize,
      color: kWhite,
      fontWeight: FontWeight.w600,
    );
  }

  static InputDecoration textFieldInputDecoration(BuildContext context) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.onSurface,
          width: 1.3,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.onSurface,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface),
      labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
    );
  }
}