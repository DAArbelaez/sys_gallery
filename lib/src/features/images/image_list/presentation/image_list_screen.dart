import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sys_gallery/src/constants/app_colors_constants.dart';
import 'package:sys_gallery/src/constants/cm_constants.dart';
import 'package:sys_gallery/src/constants/sg_icons.dart';
import 'package:sys_gallery/src/constants/text_constants.dart';
import 'package:sys_gallery/src/features/images/add_image/presentation/add_image_screen.dart';

class ImageListScreen extends StatelessWidget {
  const ImageListScreen({super.key});

  static const path = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kLightSilver,
        title: Text("Sys Gallery", style: kSubtitleTextStyle.copyWith(fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(AddImageScreen.path),
        backgroundColor: kRoyalBluePrimary,
        shape: const StadiumBorder(),
        child: kAddIcon,
      ),
      backgroundColor: kLightSilver,
      body: const Padding(
        padding: kPagePadding,
        child: Text('Image list screen'),
      ),
    );
  }
}