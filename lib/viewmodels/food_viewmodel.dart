import 'package:flutter/material.dart';
import '../models/food_model.dart';

class FoodViewModel with ChangeNotifier {
  final List<FoodModel> _foods = [
    FoodModel(
      title: "Sağlıklı Tavuk Burger",
      calories: "380 kcal",
      time: "30 dakika",
      imagePath: "assets/images/Food 1.png",
      category: "Akşam",
    ),
    FoodModel(
      title: "Tavuklu Sebzeli Doyurucu Bowl",
      calories: "200 kcal",
      time: "25 dakika",
      imagePath: "assets/images/Food 2.png",
      category: "Kahvaltı",
    ),
    FoodModel(
      title: "Spesiyal Sos Eşliğinde Tavuk Kanat",
      calories: "350 kcal",
      time: "35 dakika",
      imagePath: "assets/images/Food 3.png",
      category: "Öğle",
    ),
    FoodModel(
      title: "Yaban Mersinli, Limonlu Krep",
      calories: "220 kcal",
      time: "25 dakika",
      imagePath: "assets/images/Food 4.png",
      category: "Kahvaltı",
    ),
    FoodModel(
      title: "Tavuklu, Makarnalı Karbonhidrat Deposu Bowl",
      calories: "375 kcal",
      time: "45 dakika",
      imagePath: "assets/images/Food 5.png",
      category: "Akşam",
    ),
    FoodModel(
      title: "Avokadolu Yumurtalı Tost Eşliğinde Sağlıklı Bowl",
      calories: "450 kcal",
      time: "30 dakika",
      imagePath: "assets/images/Food 6.png",
      category: "Kahvaltı",
    ),
    FoodModel(
      title: "Farklı Soslar Eşliğinde Hamburger Menü ve Patates Kızartması",
      calories: "500 kcal",
      time: "50 dakika",
      imagePath: "assets/images/Food 7.png",
      category: "Akşam",
    ),
    FoodModel(
      title: "Çilekli Hızlı Kahvaltı",
      calories: "200 kcal",
      time: "15 dakika",
      imagePath: "assets/images/Food 8.png",
      category: "Kahvaltı",
    ),
    FoodModel(
      title: "Tavuk Şiş Eşliğinde Pirinçli, Sebzeli Bowl",
      calories: "450 kcal",
      time: "45 dakika",
      imagePath: "assets/images/Food 9.png",
      category: "Akşam",
    ),
  ];

  List<FoodModel> get foods => _foods;

  // Add this method for filtering
  List<FoodModel> getFilteredFoods(String category) {
    if (category.isEmpty) return _foods;
    return _foods.where((food) => food.category == category).toList();
  }
}
