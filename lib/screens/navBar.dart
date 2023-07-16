import 'package:flutter/material.dart';

class NavTest extends StatefulWidget {
  const NavTest({super.key});

  @override
  State<NavTest> createState() {
    return _NavTestState();
  }
}

class _NavTestState extends State<NavTest> {
  static TextStyle optionStyle = const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  final List<Widget> optionList = [
    Text(
      'Option 1: Home',
      style: optionStyle,
    ),
    Text(
      'Option 2: Buisness',
      style: optionStyle,
    ),
    Text(
      'Option 3: School',
      style: optionStyle,
    ),
    Text(
      'Option 4: Settings',
      style: optionStyle,
    ),
  ];

  var _selectedIndex = 0;

  void _onSelectItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Bar Example'),
      ),
      body: Center(
        child: optionList[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Buisness',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.blueAccent,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onSelectItem,
        selectedItemColor: Colors.amber,
      ),
    );
  }
}
