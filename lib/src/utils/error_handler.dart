import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

class ErrorHandler {
  final FirebaseCrashlytics _firebaseCrashlytics = FirebaseCrashlytics.instance;

  void handleAndRecordError({
    required Object error,
    required String functionName,
    String? message,
  }) async {
    var logger = Logger();

    final errorMessage = _getErrorMessage(error, functionName, message);

    logger.e(errorMessage, error: error);

    _checkErrorTypeAndRecord(errorMessage: errorMessage);
  }

  /// Checks the type of error and records it with additional context in Firebase Crashlytics.
  Future<void> _checkErrorTypeAndRecord({required String errorMessage}) async {
    await _firebaseCrashlytics.log(errorMessage);
  }

  /// Takes an [Exception] and a [String] representing the function name where the error occurred.
  /// Differentiates error types and logs appropriate messages in Firebase Crashlytics.
  String _getErrorMessage(Object error, String functionName, String? customMessage) {
    String initialErrorMessage = 'Exception in $functionName.';
    String errorMessage = error.toString();

    switch (error) {
      case TypeError _:
        {
          errorMessage = 'TypeError in $functionName while mapping.';
        }
      case TimeoutException _:
        {
          errorMessage = 'TimeoutException in $functionName.';
        }
      case FirebaseException _:
        {
          errorMessage = 'FirebaseException in $functionName.';
          errorMessage = '${error.message}';
        }
      case PlatformException _:
        {
          initialErrorMessage = 'PlatformException in $functionName.';
          errorMessage = '${error.message}';
        }
    }
    var message = customMessage != null ? "\n\n$customMessage" : "";
    return "$initialErrorMessage Error: $errorMessage$message";
  }
}
