import 'package:flutter/material.dart';
import 'package:sys_gallery/src/common/presentation/sg_button.dart';
import 'package:sys_gallery/src/constants/app_colors_constants.dart';
import 'package:sys_gallery/src/constants/button_style_constants.dart';
import 'package:sys_gallery/src/constants/text_constants.dart';

class CustomConfirmDialog extends StatelessWidget {
  final String message;
  final String buttonText;
  final Widget icon;
  final Function()? onPressed;
  final BuildContext buildContext;
  final bool barrierDismissible;
  final TextAlign textAlign;

  const CustomConfirmDialog(
    this.buildContext, {
    super.key,
    required this.message,
    required this.buttonText,
    required this.icon,
    this.onPressed,
    this.textAlign = TextAlign.center,
    this.barrierDismissible = true,
  });

  Future<void> call() => showDialog(
        context: buildContext,
        barrierColor: Colors.black12,
        barrierDismissible: barrierDismissible,
        barrierLabel: '',
        builder: (_) => this,
      );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      backgroundColor: kWhite,
      child: SizedBox(
        width: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 11.0, right: 11.0),
              child: barrierDismissible ? kCloseIconButton(context) : const SizedBox(height: 10),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 25),
              child: Column(
                children: [
                  SizedBox(height: 42, width: 42, child: icon),
                  const SizedBox(height: 20),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Text(message, style: AppStyles.subtitleTextStyle(context).copyWith(fontWeight: FontWeight.w300, color: kCharcoalPrimary))),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: SizedBox(
                      width: double.infinity,
                      child: SGButton(
                        txtLabel: buttonText,
                        onPressed: () {
                          Navigator.pop(context);
                          if (onPressed != null) {
                            onPressed?.call();
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
