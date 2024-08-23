import 'package:go_router/go_router.dart';
import 'package:sys_gallery/src/features/images/add_image/presentation/add_image_screen.dart';
import 'package:sys_gallery/src/features/images/image_list/presentation/image_list_screen.dart';

/// Get the routes used by navigate in the app
var appRoutes = GoRouter(
  initialLocation: ImageListScreen.path,
  routes: [
    GoRoute(
      path: ImageListScreen.path,
      pageBuilder: (_, __) => const NoTransitionPage(child: ImageListScreen()),
    ),
    GoRoute(
      path: AddImageScreen.path,
      pageBuilder: (_, __) => const NoTransitionPage(child: AddImageScreen()),
    ),
  ],
);
