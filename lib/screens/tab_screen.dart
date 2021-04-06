import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/category_screen.dart';

import '../screens/favourite_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  final List<Map<String, Object>> _pages = [
    {'page': CategoryScreen(), 'title': 'Meal Categories'},
    {'page': FavouriteScreen(), 'title': 'Favourites'}
  ];

  int _selectedPageIndex = 0;

  void _selectHandler(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectHandler,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text('Categories')),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), title: Text('Favourites'))
        ],
      ),
    );
  }
}
