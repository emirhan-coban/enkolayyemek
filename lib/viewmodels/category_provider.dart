import 'package:flutter/foundation.dart';

class CategoryProvider extends ChangeNotifier {
  String _selectedCategory = '';

  String get selectedCategory => _selectedCategory;

  void selectCategory(String category) {
    // If same category is selected again, clear the selection
    if (_selectedCategory == category) {
      _selectedCategory = '';
    } else {
      _selectedCategory = category;
    }
    notifyListeners();
  }
}