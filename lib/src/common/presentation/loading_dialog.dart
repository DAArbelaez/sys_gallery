import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sys_gallery/src/utils/utils.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) => PopScope(
    canPop: false,
    child: Center(
      child: Lottie.asset(
        'assets/images/loading.json',
        height: heightScreen(context) * 0.40,
      ),
    ),
  );

  Future<void> call(BuildContext context) => showGeneralDialog(
    context: context,
    barrierColor: Colors.black12,
    barrierDismissible: false,
    barrierLabel: '',
    pageBuilder: (_, __, ___) => this,
  );
}
