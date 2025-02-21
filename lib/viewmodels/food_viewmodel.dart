import 'package:flutter/material.dart';
import '../models/food_model.dart';

class FoodViewModel with ChangeNotifier {
  final List<FoodModel> _foods = [
    FoodModel(
      title: "Sağlıklı Tavuk Burger",
      calories: "350 kcal",
      time: "30 dakika",
      imagePath: "assets/images/Food 1.png",
      category: "Öğle",
      description: "Sağlıklı ve lezzetli bir tavuk burger tarifi. Düşük kalorili ve protein açısından zengin.",
      ingredients: [
        "2 adet tavuk göğsü",
        "2 adet tam buğday burger ekmeği",
        "1 adet domates",
        "1 adet marul",
        "Yarım soğan",
        "Az yağlı mayonez",
      ],
      steps: [
        "Tavuk göğsünü marine edin",
        "Izgarada veya tavada pişirin",
        "Sebzeleri yıkayıp dilimleyin",
        "Ekmeği ısıtın",
        "Malzemeleri sırasıyla dizin",
      ],
    ),
    FoodModel(
      title: "Tavuklu Sebzeli Doyurucu Bowl",
      calories: "200 kcal",
      time: "25 dakika",
      imagePath: "assets/images/Food 2.png",
      category: "Kahvaltı",
      description: "Tavuklu, sebzeli ve doyurucu bir kahvaltılık bowl tarifi. İçeriğindeki sebzelerle vitamin ve mineral açısından zengin.",
      steps: [
        "Tavukları marine edin",
        "Sebzeleri doğrayın",
        "Tavayı ısıtın",
        "Tavukları pişirin",
        "Sebzeleri ekleyin",
      ],
      ingredients: [
        "2 adet tavuk göğsü",
        "1 adet havuç",
        "1 adet kabak",
        "1 adet biber",
        "1 adet domates",
        "1 adet yumurta",
      ],
    ),
    FoodModel(
      title: "Spesiyal Sos Eşliğinde Tavuk Kanat",
      calories: "350 kcal",
      time: "35 dakika",
      imagePath: "assets/images/Food 3.png",
      category: "Öğle",
      description: "Spesiyal sos eşliğinde tavuk kanat tarifi. Lezzetli ve doyurucu bir öğle yemeği alternatifi.",
      steps: [
        "Tavuk kanatları marine edin",
        "Fırında pişirin",
        "Sosu hazırlayın",
        "Sosu tavuk kanatlarına sürün",
      ],
      ingredients: [
        "6 adet tavuk kanat",
        "1 yemek kaşığı zeytinyağı",
        "1 yemek kaşığı bal",
        "1 yemek kaşığı soya sosu",
        "1 diş sarımsak",
        "1 çay kaşığı karabiber",
      ],
    ),
    FoodModel(
      title: "Yaban Mersinli, Limonlu Krep",
      calories: "220 kcal",
      time: "25 dakika",
      imagePath: "assets/images/Food 4.png",
      category: "Kahvaltı",
      description: "Yaban mersinli, limonlu krep tarifi. Sağlıklı ve lezzetli bir kahvaltı alternatifi.",
      steps: [
        "Krep hamurunu hazırlayın",
        "Krep tavasında pişirin",
        "Yaban mersinlerini ekleyin",
        "Limon suyu sıkın",
      ],
      ingredients: [
        "1 su bardağı tam buğday unu",
        "1 adet yumurta",
        "1 su bardağı süt",
        "1 yemek kaşığı yaban mersini",
        "1 adet limon",
        "1 yemek kaşığı bal",
      ],
    ),
    FoodModel(
      title: "Tavuklu, Makarnalı Karbonhidrat Deposu Bowl",
      calories: "375 kcal",
      time: "45 dakika",
      imagePath: "assets/images/Food 5.png",
      category: "Akşam",
      description: "Tavuklu, makarnalı karbonhidrat deposu bowl tarifi. Protein ve karbonhidrat açısından zengin bir akşam yemeği alternatifi.",
      steps: [
        "Makarnayı haşlayın",
        "Tavukları marine edin",
        "Tavayı ısıtın",
        "Tavukları pişirin",
        "Malzemeleri karıştırın",
      ],
      ingredients: [
        "1 su bardağı makarna",
        "2 adet tavuk göğsü",
        "1 adet domates",
        "1 adet biber",
        "1 adet soğan",
        "1 yemek kaşığı zeytinyağı",
      ],

    ),
    FoodModel(
      title: "Avokadolu Yumurtalı Tost Eşliğinde Sağlıklı Bowl",
      calories: "450 kcal",
      time: "30 dakika",
      imagePath: "assets/images/Food 6.png",
      category: "Kahvaltı",
      description: "Avokadolu yumurtalı tost eşliğinde sağlıklı bowl tarifi. Sağlıklı ve doyurucu bir kahvaltı alternatifi.",
      steps: [
        "Avokadoyu ezin",
        "Yumurtayı kırın",
        "Tost ekmeğini ısıtın",
        "Malzemeleri karıştırın",
      ],
      ingredients: [
        "1 adet avokado",
        "2 adet yumurta",
        "2 dilim tam buğday tost ekmeği",
        "1 adet domates",
        "1 adet salatalık",
        "1 adet limon",
      ],

    ),
    FoodModel(
      title: "Farklı Soslar Eşliğinde Hamburger Menü ve Patates Kızartması",
      calories: "500 kcal",
      time: "50 dakika",
      imagePath: "assets/images/Food 7.png",
      category: "Akşam",
      description: "Farklı soslar eşliğinde hamburger menü ve patates kızartması tarifi. Lezzetli ve doyurucu bir akşam yemeği alternatifi.",
      steps: [
        "Hamburger köftelerini hazırlayın",
        "Patatesleri doğrayın",
        "Fırında pişirin",
        "Sosları hazırlayın",
        "Malzemeleri sırasıyla dizin",
      ],
      ingredients: [
        "2 adet hamburger köftesi",
        "2 adet hamburger ekmeği",
        "2 adet dilimlenmiş peynir",
        "1 adet patates",
        "1 yemek kaşığı zeytinyağı",
        "1 yemek kaşığı ketçap",
      ],

    ),
    FoodModel(
      title: "Çilekli Hızlı Kahvaltı",
      calories: "200 kcal",
      time: "15 dakika",
      imagePath: "assets/images/Food 8.png",
      category: "Kahvaltı",
      description: "Çilekli hızlı kahvaltı tarifi. Sağlıklı ve lezzetli bir kahvaltı alternatifi.",
      steps: [
        "Çilekleri yıkayın",
        "Yoğurdu ekleyin",
        "Bal ekleyin",
        "Malzemeleri karıştırın",
      ],
      ingredients: [
        "1 su bardağı çilek",
        "1 su bardağı yoğurt",
        "1 yemek kaşığı bal",
      ],
    ),
    FoodModel(
      title: "Tavuk Şiş Eşliğinde Pirinçli, Sebzeli Bowl",
      calories: "450 kcal",
      time: "45 dakika",
      imagePath: "assets/images/Food 9.png",
      category: "Akşam",
      description: "Tavuk şiş eşliğinde pirinçli, sebzeli bowl tarifi. Protein ve karbonhidrat açısından zengin bir akşam yemeği alternatifi.",
      steps: [
        "Tavukları marine edin",
        "Pirinci haşlayın",
        "Sebzeleri doğrayın",
        "Tavayı ısıtın",
        "Tavukları pişirin",
        "Malzemeleri karıştırın",
      ],
      ingredients: [
        "2 adet tavuk göğsü",
        "1 su bardağı pirinç",
        "1 adet domates",
        "1 adet biber",
        "1 adet soğan",
        "1 yemek kaşığı zeytinyağı",
      ],
    ),
  ];

  List<FoodModel> get foods => _foods;

  // Add this method for filtering
  List<FoodModel> getFilteredFoods(String category) {
    if (category.isEmpty) return _foods;
    return _foods.where((food) => food.category == category).toList();
  }
}
