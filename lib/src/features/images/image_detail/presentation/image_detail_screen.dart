import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sys_gallery/src/constants/app_colors_constants.dart';
import 'package:sys_gallery/src/constants/sg_icons.dart';
import 'package:sys_gallery/src/constants/text_constants.dart';
import 'package:sys_gallery/src/features/common/domain/image_data_model.dart';

class ImageDetailScreen extends StatelessWidget {
  const ImageDetailScreen({super.key, required this.image});

  final ImageDataModel image;

  static const name = 'imageDetail';
  static const path = '/$name';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kLightSilver,
          forceMaterialTransparency: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.5),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: kArrowBackIcon,
          ),
        ),
        extendBodyBehindAppBar: true,
        backgroundColor: kLightSilver,
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.memory(
                base64Decode(image.imageBase64),
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(image.title, style: kMediumTitleTextStyle.copyWith(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 10),
                    Text(image.description, style: kSubtitleTextStyle.copyWith(fontWeight: FontWeight.w400)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
