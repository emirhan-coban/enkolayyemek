import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/food_model.dart';
import '../models/favorite_model.dart';
import '../viewmodels/favorite_provider.dart';

class RecipeDetailPage extends StatelessWidget {
  final FoodModel recipe;

  const RecipeDetailPage({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    // Ekran genişliği ve yüksekliğini al
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leadingWidth: screenWidth * 0.18,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSecondary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back),
              ),
            ),
            // Add favorite button to AppBar actions
            actions: [
              Consumer<FavoriteProvider>(
                builder: (context, favoriteProvider, child) {
                  final isFavorite = favoriteProvider.isFavorite(recipe.title);
                  return IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.grey,
                    ),
                    onPressed: () async {
                      await favoriteProvider.toggleFavorite(
                        FavoriteModel(
                          title: recipe.title,
                          calories: recipe.calories,
                          time: recipe.time,
                          imagePath: recipe.imagePath,
                          category: recipe.category,
                          description: recipe.description,
                          steps: recipe.steps,
                          ingredients: recipe.ingredients,
                        ),
                      );
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              isFavorite
                                  ? '${recipe.title} favorilerden kaldırıldı'
                                  : '${recipe.title} favorilere eklendi',
                            ),
                            duration: const Duration(seconds: 2),
                            action: SnackBarAction(
                              label: 'Geri Al',
                              onPressed: () {
                                favoriteProvider.toggleFavorite(
                                  FavoriteModel(
                                    title: recipe.title,
                                    calories: recipe.calories,
                                    time: recipe.time,
                                    imagePath: recipe.imagePath,
                                    category: recipe.category,
                                    description: recipe.description,
                                    steps: recipe.steps,
                                    ingredients: recipe.ingredients,
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
              const SizedBox(width: 8),
            ],
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                recipe.imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // title
                  Text(
                    recipe.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Recipe Info Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InfoCard(
                        icon: Icons.local_fire_department,
                        title: 'Kalori',
                        value: recipe.calories,
                        screenHeight: screenHeight,
                      ),
                      InfoCard(
                        icon: Icons.timer,
                        title: 'Süre',
                        value: recipe.time,
                        screenHeight: screenHeight,
                      ),
                      InfoCard(
                        icon: Icons.category,
                        title: 'Kategori',
                        value: recipe.category,
                        screenHeight: screenHeight,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Description

                  const Text(
                    'Tarif Hakkında',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(recipe.description),
                  const SizedBox(height: 24),

                  // Ingredients
                  const Text(
                    'Malzemeler',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...recipe.ingredients.map((ingredient) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: [
                            const Icon(Icons.fiber_manual_record, size: 8),
                            const SizedBox(width: 8),
                            Text(ingredient),
                          ],
                        ),
                      )),
                  const SizedBox(height: 24),

                  // Steps
                  const Text(
                    'Hazırlanışı',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...recipe.steps.asMap().entries.map((entry) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 12,
                              child: Text('${entry.key + 1}'),
                            ),
                            const SizedBox(width: 8),
                            Expanded(child: Text(entry.value)),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final double screenHeight;

  const InfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: screenHeight * 0.02, // Dynamically adjusting padding
        ),
        child: Column(
          children: [
            Icon(icon),
            SizedBox(height: screenHeight * 0.005), // Adjust spacing
            Text(
              title,
              style: const TextStyle(fontSize: 12),
            ),
            SizedBox(height: screenHeight * 0.005), // Adjust spacing
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
