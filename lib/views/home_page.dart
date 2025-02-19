import 'package:enkolayyemek/viewmodels/category_provider.dart';
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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Theme.of(context).colorScheme.secondary,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onPressed: () {},
          ),
        ],
      ),
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
                child: const GununTarifi(),
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

class GununTarifi extends StatelessWidget {
  const GununTarifi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Avakoado Yumurtalı Ekmek',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                children: [
                  Text(
                    "Kahvaltıda yemek için\nharika bir tarif. Hem\nsağlıklı hem de lezzetli.",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 32),
                  Image.asset(
                    'assets/images/Image 5.png',
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              // ikon + süre + kalori
              Row(
                children: [
                  Icon(
                    Icons.local_fire_department,
                    size: 16,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  Text(
                    ' 350 kcal',
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
                    ' 15 dk',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
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

class CategoryButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const CategoryButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, categoryProvider, child) {
        final bool isSelected = categoryProvider.selectedCategory == title;
        
        return GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: isSelected 
                  ? Theme.of(context).colorScheme.primary // Yeşil (seçili)
                  : Colors.grey[300], // Gri (seçili değil)
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  color: isSelected 
                      ? Theme.of(context).colorScheme.onPrimary // Seçili ikon rengi
                      : Colors.grey[700], // Seçili değil ikon rengi
                  size: 24,
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: TextStyle(
                    color: isSelected 
                        ? Theme.of(context).colorScheme.onPrimary // Seçili yazı rengi
                        : Colors.grey[700], // Seçili değil yazı rengi
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
