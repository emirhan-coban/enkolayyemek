import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/favorite_model.dart';

class FavoriteProvider with ChangeNotifier {
  Box<FavoriteModel>? _favoritesBox;
  bool _isInitialized = false;

  FavoriteProvider() {
    _initHive();
  }

  Future<void> _initHive() async {
    if (!_isInitialized) {
      try {
        if (!Hive.isBoxOpen('favorites')) {
          _favoritesBox = await Hive.openBox<FavoriteModel>('favorites');
        } else {
          _favoritesBox = Hive.box<FavoriteModel>('favorites');
        }
        _isInitialized = true;
        notifyListeners();
      } catch (e) {
        debugPrint('Error initializing Hive: $e');
        // Attempt to delete corrupted box and retry
        await Hive.deleteBoxFromDisk('favorites');
        try {
          _favoritesBox = await Hive.openBox<FavoriteModel>('favorites');
          _isInitialized = true;
          notifyListeners();
        } catch (e) {
          debugPrint('Fatal error initializing Hive: $e');
        }
      }
    }
  }

  List<FavoriteModel> get favorites {
    if (!_isInitialized || _favoritesBox == null) return [];
    return _favoritesBox!.values.toList();
  }

  bool isFavorite(String title) {
    if (!_isInitialized || _favoritesBox == null) return false;
    return _favoritesBox!.values.any((favorite) => favorite.title == title);
  }

  Future<void> toggleFavorite(FavoriteModel food) async {
    await _initHive();
    
    if (_favoritesBox == null) {
      debugPrint('Favorites box is not initialized');
      return;
    }

    try {
      if (isFavorite(food.title)) {
        final foodToDelete = _favoritesBox!.values
            .firstWhere((favorite) => favorite.title == food.title);
        await foodToDelete.delete();
      } else {
        await _favoritesBox!.add(food);
      }
      notifyListeners();
    } catch (e) {
      debugPrint('Error toggling favorite: $e');
    }
  }
}