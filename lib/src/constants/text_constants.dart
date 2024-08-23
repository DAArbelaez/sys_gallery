import 'package:flutter/material.dart';
import 'package:sys_gallery/src/constants/app_colors_constants.dart';
import 'package:sys_gallery/src/constants/int_constants.dart';

//Text Style

const kTitleTextStyle = TextStyle(
  fontSize: kTextTitleSize,
  color: kCharcoalPrimary,
  fontWeight: FontWeight.w700,
);

const kMediumTitleTextStyle = TextStyle(
  fontSize: kTextMediumTitleSize,
  color: kCharcoalPrimary,
);

const kSubtitleTextStyle = TextStyle(
  fontSize: kTextSubtitleSize,
  color: kCharcoalPrimary,
);

const kContentTextStyle = TextStyle(
  fontSize: kTextContentSize,
  color: kCharcoalPrimary,
  fontWeight: FontWeight.w300,
);

const kCaptionTextStyle = TextStyle(
  fontSize: kTextCaptionSize,
  color: kCharcoalPrimary,
);

//Buttons
const kCustomButtonTextStyle = TextStyle(
  fontSize: kTextContentSize,
  color: kWhite,
  fontWeight: FontWeight.w600,
);

//TextField
final kTextFieldInputDecoration = InputDecoration(
  border: const OutlineInputBorder(borderRadius: _borderRadius),
  focusedBorder: const OutlineInputBorder(borderSide: _borderSideFocused, borderRadius: _borderRadius),
  enabledBorder: const OutlineInputBorder(borderSide: _borderSide, borderRadius: _borderRadius),
  floatingLabelBehavior: FloatingLabelBehavior.auto,
  hintStyle: kCaptionTextStyle.copyWith(color: kSilver),
  labelStyle: kCaptionTextStyle,
  contentPadding: const EdgeInsets.symmetric(horizontal: 15),
);

const _borderRadius = BorderRadius.all(Radius.circular(5));
const _borderSide = BorderSide(color: kSilver);
const _borderSideFocused = BorderSide(color: kRoyalBluePrimary, width: 1.3);


