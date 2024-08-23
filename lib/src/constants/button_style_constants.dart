import 'package:flutter/material.dart';
import 'package:sys_gallery/src/constants/app_colors_constants.dart';
import 'package:sys_gallery/src/constants/sg_icons.dart';

final kCustomButtonStyle = TextButton.styleFrom(
  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3))),
  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
  disabledBackgroundColor: kLightSilver,
  backgroundColor: kRoyalBluePrimary,
);

// Extensions allowed in the pick file feature
const List<String> kAllowedExtensions = ['png', 'jpg', 'pdf', 'jpeg'];

///Use this IconButton for each dialog for close button
Widget kCloseIconButton(BuildContext context) => Align(
  alignment: Alignment.topRight,
  child: IconButton(
    constraints: const BoxConstraints(
      minHeight: 0,
    ),
    padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
    onPressed: () => Navigator.pop(context),
    icon: kCloseIcon,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    hoverColor: Colors.transparent,
  ),
);

