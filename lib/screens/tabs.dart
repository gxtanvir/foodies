import 'package:flutter/material.dart';
import 'package:foodies/screens/categories.dart';
import 'package:foodies/screens/meals.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() {
    return TabScreenState();
  }
}

class TabScreenState extends State<TabScreen> {
  int selectedIndex = 0;
  void _selectPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const CategoriesScreen();
    var activePageTitle = 'Category';

    if (selectedIndex == 1) {
      activePage ==
          const MealsScreen(
            title: 'Favorite',
            meals: [],
          );
      activePageTitle = 'Favortie';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Catogories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.amber,
      ),
    );
  }
}
