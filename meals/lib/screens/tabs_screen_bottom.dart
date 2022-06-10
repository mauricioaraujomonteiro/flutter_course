import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widget/main_drawer.dart';
import 'categories_sceen.dart';
import 'favorite_screen.dart';

class TabScreenBottom extends StatefulWidget {

  final List<Meal> favoriteMeals;
  TabScreenBottom(this.favoriteMeals);
  @override
  _TabScreenBottomState createState() => _TabScreenBottomState();
}

class _TabScreenBottomState extends State<TabScreenBottom> {
  List<Map<String, dynamic>> _pages;

  @override
  void initState() {
    _pages = [
    {
    'page': CategoriesScreen(),
    'title' : 'Categories'
    },
    {
    'page': FavoriteScreen(widget.favoriteMeals),
    'title': 'Favorite'
    },
    ];
  }

  int _selectedPageIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectedPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
        ],
      ),
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]['title'],
          style: TextStyle(fontFamily: 'Raleway'),
        ),
      ),
    );
  }
}
