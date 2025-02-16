import 'package:flutter/material.dart';
import '../models/food_model.dart';

class FoodViewModel with ChangeNotifier {
  final List<FoodModel> _foods = [
    FoodModel(
      title: 'Healthy Bowl',
      calories: '350 kcal',
      time: '30 min',
      imagePath: 'assets/images/Image 2.png',
    ),
    FoodModel(
      title: 'Hamburger & Fries',
      calories: '400 kcal',
      time: '25 min',
      imagePath: 'assets/images/Image 3.png',
    ),
    FoodModel(
      title: 'Omlette', 
      calories: '450 kcal',
      time: '35 min',
      imagePath: 'assets/images/Image 4.png',
    ),
    FoodModel(
      title: 'Steak',
      calories: '300 kcal',
      time: '20 min',
      imagePath: 'assets/images/Image 5.png',
    ),
  ];

  List<FoodModel> get foods => _foods;
  
  // İleride eklenebilecek metodlar:
  // void addFood(FoodModel food) { ... }
  // void removeFood(int index) { ... }
  // void updateFood(int index, FoodModel food) { ... }
}