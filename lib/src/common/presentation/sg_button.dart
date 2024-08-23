import 'package:flutter/material.dart';
import 'package:sys_gallery/src/constants/button_style_constants.dart';
import 'package:sys_gallery/src/constants/text_constants.dart';

class SGButton extends StatelessWidget {
  const SGButton({
    super.key,
    this.isEnabled = true,
    required this.txtLabel,
    required this.onPressed,
    this.buttonStyle,
    this.textStyle,
    this.icon,
  });

  final bool isEnabled;
  final String txtLabel;
  final VoidCallback onPressed;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: buttonStyle ?? kCustomButtonStyle,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: icon,
            ),
          Text(
            txtLabel,
            style: textStyle ?? AppStyles.customButtonTextStyle(),
          ),
        ],
      ),
    );
  }
}
