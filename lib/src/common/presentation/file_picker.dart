import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sys_gallery/src/constants/app_colors_constants.dart';
import 'package:sys_gallery/src/constants/sg_icons.dart';
import 'package:sys_gallery/src/constants/text_constants.dart';
import 'package:sys_gallery/src/features/images/add_image/presentation/controller/add_image_controller.dart';

class FilePicker extends StatelessWidget {
  const FilePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddImageController>(context);

    return Visibility(
      visible: provider.imageBase64 == "",
      replacement: Image.memory(
        base64Decode(provider.imageBase64),
        height: 200,
        width: 200,
        fit: BoxFit.cover,
      ),
      child: GestureDetector(
        onTap: () => provider.pickFile(),
        child: Container(
          height: 150,
          width: double.infinity,
          color: kMediumDark,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              kAddDarkIcon,
              Text("Añadir imagen", style: kContentTextStyle.copyWith(color: kDark, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}
