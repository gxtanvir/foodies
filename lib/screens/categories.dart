import 'package:flutter/material.dart';
import 'package:foodies/data/category_data.dart';
import 'package:foodies/screens/meals.dart';
import 'package:foodies/widgets/category_grid_item.dart';
import 'package:foodies/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    final filteredCategory = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) =>
              MealsScreen(title: category.title, meals: filteredCategory),
        ));
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select your Category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 3 / 2,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onselectCategory: () {
                _selectCategory(context, category);
              },
            )
        ],
      ),
    );
  }
}
