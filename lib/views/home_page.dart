import 'package:enkolayyemek/viewmodels/food_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/food_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Consumer<FoodViewModel>(
                builder: (context, viewModel, child) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: ListView.builder(
                      itemCount: viewModel.foods.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final food = viewModel.foods[index];
                        return FoodCard(
                          title: food.title,
                          calories: food.calories,
                          time: food.time,
                          imagePath: food.imagePath,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            // Buraya diğer widget'lar eklenebilir
          ],
        ),
      ),
    );
  }
}
