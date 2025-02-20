import 'package:enkolayyemek/viewmodels/category_provider.dart';
import 'package:enkolayyemek/widgets/category_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/food_viewmodel.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = ''; // Remove 'final' to allow changes

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 2.5,
                    )
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Tarif ara...',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _searchController.clear();
                            setState(() {
                              _searchQuery = '';
                            });
                          },
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
            ),
            
            // Category Buttons
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
            const SizedBox(height: 16),
            
            // Category Filter Buttons
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
            const SizedBox(height: 16),

            // Filtered Recipe List
            Expanded(
              child: Consumer2<FoodViewModel, CategoryProvider>(
                builder: (context, foodViewModel, categoryProvider, child) {
                  var foods = foodViewModel.foods;
                  
                  // Apply category filter
                  if (categoryProvider.selectedCategory.isNotEmpty) {
                    foods = foods.where((food) => 
                      food.category == categoryProvider.selectedCategory).toList();
                  }
                  
                  // Apply search filter
                  if (_searchQuery.isNotEmpty) {
                    foods = foods.where((food) => 
                      food.title.toLowerCase().contains(_searchQuery.toLowerCase())).toList();
                  }

                  if (foods.isEmpty) {
                    return const Center(
                      child: Text('Aradığınız tarif bulunamadı.'),
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: foods.length,
                    itemBuilder: (context, index) {
                      final food = foods[index];
                      return Card(
                        elevation: 2,
                        margin: const EdgeInsets.only(bottom: 16),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              food.imagePath,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            food.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Row(
                            children: [
                              Icon(
                                Icons.local_fire_department,
                                size: 16,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              Text(' ${food.calories}'),
                              const SizedBox(width: 16),
                              Icon(
                                Icons.access_time,
                                size: 16,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              Text(' ${food.time}'),
                            ],
                          ),
                          onTap: () {
                            // TODO: Navigate to recipe detail
                          },
                        ),
                      );
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
