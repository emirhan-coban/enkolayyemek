class FoodModel {
  final String title;
  final String calories;
  final String time;
  final String imagePath;
  final String category; // Add this line

  FoodModel({
    required this.title,
    required this.calories,
    required this.time,
    required this.imagePath,
    required this.category, // Add this line
  });
}