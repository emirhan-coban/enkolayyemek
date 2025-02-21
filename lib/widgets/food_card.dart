import 'package:enkolayyemek/models/food_model.dart';
import 'package:enkolayyemek/viewmodels/favorite_provider.dart';
import 'package:enkolayyemek/views/recipe_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/favorite_model.dart';

class FoodCard extends StatelessWidget {
  final String title;
  final String calories;
  final String time;
  final String imagePath;
  final String? category;
  final String? description;
  final List<String>? steps;
  final List<String>? ingredients;

  const FoodCard({
    super.key,
    required this.title,
    required this.calories,
    required this.time,
    required this.imagePath,
    this.category,
    this.description,
    this.steps,
    this.ingredients,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final foodModel = FoodModel(
          title: title,
          calories: calories,
          time: time,
          imagePath: imagePath,
          category: category ?? 'Genel',
          description: description ?? 'Tarif açıklaması bulunmamaktadır.',
          steps: steps ?? ['Adım bilgisi bulunmamaktadır.'],
          ingredients: ingredients ?? ['Malzeme bilgisi bulunmamaktadır.'],
        );

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RecipeDetailPage(
              recipe: foodModel,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 16),
        width: MediaQuery.of(context).size.width * 0.5,
        height:
            MediaQuery.of(context).size.height * 0.3, // Sabit yükseklik ekleyin
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image
                  Expanded(
                    flex: 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        imagePath,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Title
                  Expanded(
                    flex: 1,
                    child: Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Info Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.local_fire_department,
                            color: Theme.of(context).colorScheme.secondary,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            calories,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.timer,
                            color: Theme.of(context).colorScheme.secondary,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            time,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Favorite Button
            Positioned(
              top: 8,
              right: 8,
              child: Consumer<FavoriteProvider>(
                builder: (context, favoriteProvider, child) {
                  return IconButton(
                    icon: Icon(
                      favoriteProvider.isFavorite(title)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: favoriteProvider.isFavorite(title)
                          ? Colors.red
                          : Colors.grey,
                    ),
                    onPressed: () async {
                      try {
                        await favoriteProvider.toggleFavorite(
                          FavoriteModel(

                            title: title,
                            calories: calories,
                            time: time,
                            imagePath: imagePath,
                            category: category ?? 'Genel',
                            description: description ?? 'Tarif açıklaması bulunmamaktadır.',
                            steps: steps ?? ['Adım bilgisi bulunmamaktadır.'],
                            ingredients: ingredients ?? ['Malzeme bilgisi bulunmamaktadır.'],
                          ),
                        );
                      } catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Hata: $e'),
                            ),
                          );
                        }
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
