import 'package:firebase_database/firebase_database.dart';
import 'package:sys_gallery/src/features/common/domain/image_data_model.dart';
import 'package:sys_gallery/src/utils/base_provider.dart';
import 'package:sys_gallery/src/utils/error_handler.dart';

class ImageListController extends BaseProvider {
  final ErrorHandler _errorHandler = ErrorHandler();

  List<ImageDataModel> imageList = [];

  List<ImageDataModel> imageListFiltered = [];

  Future<void> fetchImages() async {
    try {
      setState(ProviderState.loading);

      final FirebaseDatabase db = FirebaseDatabase.instance;
      DatabaseReference imagesRef = db.ref().child('images');

      DataSnapshot snapshot = await imagesRef.get();

      if (snapshot.exists) {
        final Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;

        final list = data.entries.map((entry) {
          final key = entry.key;
          final value = entry.value as Map<dynamic, dynamic>;

          return ImageDataModel.fromJson({
            'id': key,
            ...value,
          });
        }).toList();

        imageList = [...list];
        imageListFiltered = [...list];

        if (isDisposed) return;
        setState(ProviderState.success);
      } else {
        imageList = [];
        imageListFiltered = [];

        if (isDisposed) return;
        setState(ProviderState.dataNotFound);
      }
    } catch (e) {
      imageList = [];
      imageListFiltered = [];

      _errorHandler.handleAndRecordError(error: e, functionName: "fetchImages");
    }
  }

  void filterImagesByTitle(String query) {
    // FIXME: Add debouncer
    imageListFiltered = imageList.where((image) => image.title.toLowerCase().contains(query.toLowerCase())).toList();
    notifyListeners();
  }
}
