import 'package:delimeals/screens/categories_screen.dart';
import 'package:delimeals/screens/favorites_screen.dart';
import 'package:delimeals/widgets/drawer.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabsScreen({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, dynamic>> _pages;

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    //INDICE è passato da onTap
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {
        'page': const CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(
          favoriteMeals: widget.favoriteMeals,
        ),
        'title': 'Favorites',
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: _selectedPageIndex,
          // type: BottomNavigationBarType.shifting,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).colorScheme.primary,
                icon: const Icon(Icons.category),
                label: 'Categories'),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).colorScheme.primary,
                icon: Icon(Icons.star),
                label: 'Favorites'),
          ]),
    );
  }
}
