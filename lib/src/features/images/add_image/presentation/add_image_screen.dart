import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sys_gallery/src/common/presentation/file_picker.dart';
import 'package:sys_gallery/src/common/presentation/sg_button.dart';
import 'package:sys_gallery/src/common/presentation/text_field/text_field.dart';
import 'package:sys_gallery/src/constants/app_colors_constants.dart';
import 'package:sys_gallery/src/constants/sg_icons.dart';
import 'package:sys_gallery/src/constants/text_constants.dart';
import 'package:sys_gallery/src/features/images/add_image/presentation/controller/add_image_controller.dart';

class AddImageScreen extends StatelessWidget {
  const AddImageScreen({super.key});

  static const name = 'addImage';
  static const path = '/$name';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddImageController(),
      builder: (context, child) {
        final provider = Provider.of<AddImageController>(context);

        return Scaffold(
          appBar: AppBar(backgroundColor: kLightSilver),
          backgroundColor: kLightSilver,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Añade una nueva imagen", style: kSubtitleTextStyle.copyWith(fontWeight: FontWeight.w600)),
                    Text(
                      "Mejora tu galería incorporando imágenes que cuenten historias y capturen momentos especiales.",
                      style: kCaptionTextStyle.copyWith(color: kDark),
                    ),
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.center,
                      child: FilePicker(),
                    ),
                    const SizedBox(height: 20),
                    Text("Título", style: kContentTextStyle.copyWith(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 5),
                    TextCustomTextField(
                      hintText: "Vacaciones en la montaña...",
                      controller: provider.titleController,
                      textCapitalization: TextCapitalization.sentences,
                    ),
                    const SizedBox(height: 20),
                    Text("Descripción", style: kContentTextStyle.copyWith(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 5),
                    TextCustomTextField(
                      hintText: "Día soleado en la montaña con amigos...",
                      controller: provider.descriptionController,
                      textCapitalization: TextCapitalization.sentences,
                    ),
                    const SizedBox(height: 40),
                    SGButton(
                      icon: kAddIcon,
                      txtLabel: "Añadir",
                      onPressed: () => provider.uploadImage(context),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
