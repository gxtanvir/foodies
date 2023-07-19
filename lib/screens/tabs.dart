import 'package:flutter/material.dart';
import 'package:foodies/screens/categories.dart';
import 'package:foodies/screens/filters.dart';
import 'package:foodies/screens/meals.dart';
import 'package:foodies/models/meal.dart';
import 'package:foodies/widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() {
    return TabScreenState();
  }
}

class TabScreenState extends State<TabScreen> {
  int _selectedIndex = 0;

  final List<Meal> _favoriteMeals = [];

  // Info Message
  void _showInfoMessage(String text) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  // Favorite Meal Add Remove
  void _toogleMealsFavoriteStatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);

    if (isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
      });
      _showInfoMessage('Item Removed from Favorite!');
    } else {
      setState(() {
        _favoriteMeals.add(meal);
      });
      _showInfoMessage('Added to Favorite!');
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Switching Screen
  void _selectScreen(String identifire) async {
    Navigator.of(context).pop();
    if (identifire == 'filters') {
      final result = await Navigator.push<Map<Filter, bool>>(
        context,
        MaterialPageRoute(builder: (ctx) => const FilterScreen()),
      );
      print(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      onToogleFavorite: _toogleMealsFavoriteStatus,
    );
    var activePageTitle = 'Category';

    if (_selectedIndex == 1) {
      activePage = MealsScreen(
        meals: _favoriteMeals,
        onToogleFavorite: _toogleMealsFavoriteStatus,
      );
      activePageTitle = 'Favortie';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _selectScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Catogories',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightGreen,
        onTap: _selectPage,
      ),
    );
  }
}
