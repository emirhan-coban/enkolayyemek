import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/favorite_provider.dart';
import '../widgets/food_card.dart';
import '../models/favorite_model.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<FavoriteProvider>(
        builder: (context, favoriteProvider, child) {
          return FutureBuilder<List<FavoriteModel>>(
            future: Future.value(favoriteProvider.favorites),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.hasError) {
                return Center(
                  child: Text('Bir hata oluştu: ${snapshot.error}'),
                );
              }

              final favorites = snapshot.data ?? [];

              if (favorites.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite_border,
                        size: 64,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Henüz favori tarif eklemediniz.',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  final favorite = favorites[index];
                  return Dismissible(
                    key: Key(favorite.title),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      color: Colors.red,
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    onDismissed: (direction) {
                      favoriteProvider.toggleFavorite(favorite);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('${favorite.title} favorilerden kaldırıldı'),
                          action: SnackBarAction(
                            label: 'Geri Al',
                            onPressed: () {
                              favoriteProvider.toggleFavorite(favorite);
                            },
                          ),
                        ),
                      );
                    },
                    child: FoodCard(
                      title: favorite.title,
                      calories: favorite.calories,
                      time: favorite.time,
                      imagePath: favorite.imagePath,
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
