import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sys_gallery/src/constants/text_constants.dart';
import 'package:sys_gallery/src/features/common/domain/image_data_model.dart';
import 'package:sys_gallery/src/features/images/image_detail/presentation/image_detail_screen.dart';

class ImageCard extends StatelessWidget {
  const ImageCard(this.image, {super.key});

  final ImageDataModel image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(ImageDetailScreen.path, extra: image),
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
            style: AppStyles.contentTextStyle(context).copyWith(fontWeight: FontWeight.w500),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            image.description,
            style: AppStyles.captionTextStyle(context),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
