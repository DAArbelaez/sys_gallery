import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sys_gallery/src/constants/text_constants.dart';
import 'package:sys_gallery/src/features/common/domain/image_data_model.dart';

class ImageCard extends StatelessWidget {
  const ImageCard(this.image, {super.key});

  final ImageDataModel image;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.memory(
              base64Decode(image.imageBase64),
              fit: BoxFit.cover,
            ),
          ),
          Text(
            image.title,
            style: kContentTextStyle.copyWith(fontWeight: FontWeight.w500),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            image.description,
            style: kCaptionTextStyle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
