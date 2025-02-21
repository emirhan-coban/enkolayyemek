class FoodModel {
  final String title;
  final String calories;
  final String time;
  final String imagePath;
  final String category;
  final String description;     // Add description field
  final List<String> steps;     // Add cooking steps
  final List<String> ingredients; // Add ingredients

  FoodModel({
    required this.title,
    required this.calories,
    required this.time,
    required this.imagePath,
    required this.category,
    required this.description,
    required this.steps,
    required this.ingredients,
  });
}