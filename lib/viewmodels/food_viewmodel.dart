import 'package:flutter/material.dart';
import '../models/food_model.dart';

class FoodViewModel with ChangeNotifier {
  final List<FoodModel> _foods = [
    FoodModel(
      title: 'Sağlıklı Bowl',
      calories: '155 kcal',
      time: '15 min',
      imagePath: 'assets/images/Image 2.png',
      category: 'Öğle',
    ),
    FoodModel(
      title: 'Vegan Hamburger & Patates',
      calories: '300 kcal',
      time: '45 min',
      imagePath: 'assets/images/Image 3.png',
      category: 'Akşam',
    ),
    FoodModel(
      title: 'Avakadolu Omlet',
      calories: '300 kcal',
      time: '20 min',
      imagePath: 'assets/images/Image 4.png',
      category: 'Kahvaltı',
    ),
    FoodModel(
      title: 'Biftek Izgara',
      calories: '450 kcal',
      time: '30 min',
      imagePath: 'assets/images/Image 5.png',
      category: 'Akşam',
    ),
  ];

  List<FoodModel> get foods => _foods;

  // Add this method for filtering
  List<FoodModel> getFilteredFoods(String category) {
    if (category.isEmpty) return _foods;
    return _foods.where((food) => food.category == category).toList();
  }
}
