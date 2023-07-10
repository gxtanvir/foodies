import 'package:flutter/material.dart';
import 'package:foodies/data/category_data.dart';
import 'package:foodies/screens/meals.dart';
import 'package:foodies/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) =>
              const MealsScreen(title: 'Some title here', meals: []),
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
              onselecCategory: () {
                _selectCategory(context);
              },
            )
        ],
      ),
    );
  }
}
