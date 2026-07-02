import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  int _currentIndex = 0;
  String _selectedTab = 'ride'; // 'ride' or 'package'
  bool _isLoading = false;
  String? _errorMessage;

  int get currentIndex => _currentIndex;
  String get selectedTab => _selectedTab;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void setTab(String tab) {
    _selectedTab = tab;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setError(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
