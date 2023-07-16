import 'package:flutter/material.dart';
import 'package:foodies/models/meal.dart';
import 'package:foodies/screens/meal_details.dart';
import 'package:foodies/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    required this.onToogleFavorite,
  });

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToogleFavorite;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(meal: meal, onToogleFavorite: onToogleFavorite,),
      ),
    );
  }

  @override
  Widget build(context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) => MealItem(
          meal: meals[index],
          onselectMeal: (meal) {
            _selectMeal(context, meal);
          }),
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            'No Category Found!',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Try selecting differnt Category.',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          )
        ]),
      );
    }
    if (title == null) {
      return Container(
        padding: const EdgeInsets.all(6),
        child: content,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: Container(
        padding: const EdgeInsets.all(6),
        child: content,
      ),
    );
  }
}
