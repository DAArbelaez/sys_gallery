import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:sys_gallery/src/common/presentation/custom_confirm_dialog.dart';
import 'package:sys_gallery/src/common/presentation/loading_dialog.dart';
import 'package:sys_gallery/src/constants/button_style_constants.dart';
import 'package:sys_gallery/src/constants/sg_icons.dart';
import 'package:sys_gallery/src/features/images/add_image/domain/image_data_model.dart';
import 'package:sys_gallery/src/utils/base_provider.dart';
import 'package:sys_gallery/src/utils/error_handler.dart';

class AddImageController extends BaseProvider {
  final ErrorHandler _errorHandler = ErrorHandler();

  final Logger _logger = Logger();

  final TextEditingController titleController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  String imageBase64 = "";

  Future<void> uploadImage(BuildContext context) async {
    if (!isValidImage()) {
      _logger.i("There are empty fields.");
      return;
    }

    const LoadingDialog()(context);

    try {
      final timestamp = DateTime.now().millisecondsSinceEpoch.toString();

      final ImageDataModel image = ImageDataModel(
        id: timestamp,
        title: titleController.text,
        description: descriptionController.text,
        imageBase64: imageBase64,
      );

      final FirebaseDatabase db = FirebaseDatabase.instance;

      DatabaseReference ref = db.ref();

      ref.child("images").child(timestamp).set(image.toJson()).then(
        (value) {
          context.pop();

          CustomConfirmDialog(
            context,
            icon: kCheckCircleIcon,
            buttonText: "Confirmar",
            message: "Imagen subida correctamente",
            onPressed: () => context.pop(),
          )();
        },
      ).catchError((error, __) {
        _handleError(context, error!);
      });

      if (isDisposed) return;
      setState(ProviderState.success);
    } catch (e) {
      _handleError(context, e);
    }
  }

  void _handleError(BuildContext context, Object e) {
    context.pop();

    CustomConfirmDialog(
      context,
      icon: kErrorIcon,
      buttonText: "Confirmar",
      message: "Ha ocurrido un error.",
    )();

    _errorHandler.handleAndRecordError(error: e, functionName: "uploadImage");

    if (isDisposed) return;
    setState(ProviderState.error);
  }

  bool isValidImage() {
    return titleController.text.isNotEmpty && descriptionController.text.isNotEmpty && imageBase64.isNotEmpty;
  }

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: kAllowedExtensions,
      allowMultiple: false,
      withData: true,
    );

    if (result != null) {
      File imageFile = File(result.files.single.path!);

      // Convert image to base64
      final bytes = await imageFile.readAsBytes();
      String imageBase64Converted = base64Encode(bytes);

      imageBase64 = imageBase64Converted;

      notifyListeners();
    } else {
      _logger.i('No file was selected.');
    }
  }
}
