import 'package:flutter/material.dart';

enum ProviderState { initial, loading, success, error, dataNotFound }

class BaseProvider with ChangeNotifier {
  ProviderState _currentState = ProviderState.initial;
  ProviderState get getCurrentState => _currentState;
  void setState(ProviderState newState) {
    _currentState = newState;
    notifyListeners();
  }

  bool _isDisposed = false;
  bool get isDisposed => _isDisposed;

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}
