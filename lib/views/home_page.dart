import 'package:enkolayyemek/viewmodels/category_provider.dart';
import 'package:enkolayyemek/viewmodels/food_viewmodel.dart';
import 'package:enkolayyemek/widgets/category_button.dart';
import 'package:enkolayyemek/widgets/feature_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/food_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "Günün Tarifi",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const FeatureCard(),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "Popüler Tarifler",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const PopulerTarifler(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Kategoriler',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CategoryButton(
                  title: 'Kahvaltı',
                  icon: Icons.breakfast_dining,
                  onTap: () {
                    context.read<CategoryProvider>().selectCategory('Kahvaltı');
                  },
                ),
                CategoryButton(
                  title: 'Öğle',
                  icon: Icons.lunch_dining,
                  onTap: () {
                    context.read<CategoryProvider>().selectCategory('Öğle');
                  },
                ),
                CategoryButton(
                  title: 'Akşam',
                  icon: Icons.dinner_dining,
                  onTap: () {
                    context.read<CategoryProvider>().selectCategory('Akşam');
                  },
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
            const FilteredRecipes(),
          ],
        ),
      ),
    );
  }
}

class PopulerTarifler extends StatelessWidget {
  const PopulerTarifler({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Consumer<FoodViewModel>(
        builder: (context, foodViewModel, child) {
          final allFoods = foodViewModel.foods;

          return ListView.builder(
            itemCount: allFoods.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final food = allFoods[index];
              return FoodCard(
                title: food.title,
                calories: food.calories,
                time: food.time,
                imagePath: food.imagePath,
              );
            },
          );
        },
      ),
    );
  }
}

class FilteredRecipes extends StatelessWidget {
  const FilteredRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Consumer2<FoodViewModel, CategoryProvider>(
        builder: (context, foodViewModel, categoryProvider, child) {
          final filteredFoods =
              foodViewModel.getFilteredFoods(categoryProvider.selectedCategory);

          return ListView.builder(
            itemCount: filteredFoods.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final food = filteredFoods[index];
              return FoodCard(
                title: food.title,
                calories: food.calories,
                time: food.time,
                imagePath: food.imagePath,
              );
            },
          );
        },
      ),
    );
  }
}