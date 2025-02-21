import 'package:hive/hive.dart';

part 'favorite_model.g.dart';

@HiveType(typeId: 0)
class FavoriteModel extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String calories;

  @HiveField(2)
  final String time;

  @HiveField(3)
  final String imagePath;

  @HiveField(4)
  final String category;

  @HiveField(5)
  final String description;

  @HiveField(6)
  final List<String> steps;

  @HiveField(7)
  final List<String> ingredients;

  FavoriteModel({
    required this.title,
    required this.calories,
    required this.time,
    required this.imagePath,
    this.category = 'Genel',
    this.description = 'Tarif açıklaması bulunmamaktadır.',
    this.steps = const ['Adım bilgisi bulunmamaktadır.'],
    this.ingredients = const ['Malzeme bilgisi bulunmamaktadır.'],
  });
}
