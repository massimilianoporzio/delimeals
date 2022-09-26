import 'package:delimeals/screens/categories_screen.dart';
import 'package:delimeals/screens/favorites_screen.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabsScreen({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meals'),
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.category),
              text: 'Categories',
            ),
            Tab(
              icon: Icon(Icons.star),
              text: 'Favorites',
            )
          ]),
        ),
        body: TabBarView(
          children: [
            const CategoriesScreen(),
            FavoritesScreen(
              favoriteMeals: widget.favoriteMeals,
            )
          ],
        ),
      ),
    ); //scaffold to manage entire screen
  }
}
