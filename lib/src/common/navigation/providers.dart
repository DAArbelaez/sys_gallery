
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sys_gallery/src/common/provider/handle_theme.dart';
import 'package:sys_gallery/src/features/images/image_list/presentation/controller/image_list_controller.dart';

/// Get the provider used in the app
List<SingleChildWidget> get appProviders => [
  ChangeNotifierProvider(create: (_) => ImageListController()),
  ChangeNotifierProvider(create: (_) => HandleThemeProvider()),
];
