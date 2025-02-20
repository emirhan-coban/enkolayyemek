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

  FavoriteModel({
    required this.title,
    required this.calories,
    required this.time,
    required this.imagePath,
  });
}
