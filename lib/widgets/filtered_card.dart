import 'package:enkolayyemek/viewmodels/category_provider.dart';
import 'package:enkolayyemek/viewmodels/food_viewmodel.dart';
import 'package:enkolayyemek/widgets/food_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                description: food.description,
                category: food.category,
                ingredients: food.ingredients,
                steps: food.steps,
              );
            },
          );
        },
      ),
    );
  }
}
