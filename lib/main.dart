import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:sys_gallery/firebase/firebase_options.dart';
import 'package:sys_gallery/src/common/navigation/go_router.dart';
import 'package:sys_gallery/src/common/navigation/providers.dart';
import 'package:sys_gallery/src/common/provider/handle_theme.dart';
import 'package:sys_gallery/src/constants/app_colors_constants.dart';
import 'package:sys_gallery/src/themes/dark_theme.dart';
import 'package:sys_gallery/src/themes/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables for dev
  await dotenv.load(fileName: '.env');

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // This initialize crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: kLightSilver,
      ),
    );

    return MultiProvider(
      providers: appProviders,
      child: Builder(builder: (context) {
        final themeProvider = Provider.of<HandleThemeProvider>(context);

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.themeMode,
          theme: themeProvider.themeMode == ThemeMode.light ? lightTheme : darkTheme,
          routerConfig: appRoutes,
        );
      }),
    );
  }
}
