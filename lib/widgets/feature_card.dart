import 'package:enkolayyemek/models/food_model.dart';
import 'package:enkolayyemek/views/recipe_detail_page.dart';
import 'package:flutter/material.dart';

class FeatureCard extends StatelessWidget {
  const FeatureCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final foodModel = FoodModel(
          title: "Yaban Mersinli, Limonlu Krep",
          calories: "220 kcal",
          time: "25 dakika",
          imagePath: "assets/images/Food 4.png",
          category: "Kahvaltı",
          description:
              "Yaban mersinli, limonlu krep tarifi. Sağlıklı ve lezzetli bir kahvaltı alternatifi.",
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
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Yaban Mersinli, Limonlu Krep',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Kahvaltıda yemek için harika bir tarif. Hem sağlıklı hem de lezzetli.",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        Icons.local_fire_department,
                        size: 16,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                      Text(
                        ' 220 kcal',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Icon(
                        Icons.access_time,
                        size: 16,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                      Text(
                        ' 25 dakika',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.02),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/Food 4.png',
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height * 0.15,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
