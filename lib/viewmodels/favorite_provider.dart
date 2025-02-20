import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/favorite_model.dart';

class FavoriteProvider with ChangeNotifier {
  late Box<FavoriteModel> _favoritesBox;
  bool _isInitialized = false;

  FavoriteProvider() {
    _initHive();
  }

  Future<void> _initHive() async {
    if (!_isInitialized) {
      _favoritesBox = await Hive.openBox<FavoriteModel>('favorites');
      _isInitialized = true;
      notifyListeners();
    }
  }

  List<FavoriteModel> get favorites => _favoritesBox.values.toList();

  bool isFavorite(String title) {
    if (!_isInitialized) return false;
    return _favoritesBox.values.any((favorite) => favorite.title == title);
  }

  Future<void> toggleFavorite(FavoriteModel food) async {
    await _initHive();
    
    if (isFavorite(food.title)) {
      final foodToDelete = _favoritesBox.values
          .firstWhere((favorite) => favorite.title == food.title);
      await _favoritesBox.delete(foodToDelete.key);
    } else {
      await _favoritesBox.add(food);
    }
    notifyListeners();
  }
}