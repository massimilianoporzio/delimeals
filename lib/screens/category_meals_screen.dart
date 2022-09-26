import 'package:delimeals/widgets/meal_item.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "/category-meals";
  // final String categortId;
  // final String categoryTitle;
  final List<Meal> availableMeals;
  const CategoryMealsScreen({
    Key? key,
    required this.availableMeals,
  }) : super(key: key);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle = "";
  List<Meal> displayedMeals = [];
  var _loadedInitData = false;

  void _removeMeal(String mealId) {
    setState(() {
      //TENTA DI CAMBAIRE LA LISTA MA didChangeDepen lo sostituisce
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs = ModalRoute.of(context)!.settings.arguments
          as Map<String, String>; //CONTEXT IS AVAILABLE AFTER
      categoryTitle = routeArgs['title'] ?? 'Categoria';
      final categoryId = routeArgs['id'] ?? 'c1';

      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  void initState() {
    //prova
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
          itemBuilder: (ctx, index) {
            final meal = displayedMeals[index];
            return MealItem(
              id: meal.id,
              title: meal.title,
              imageUrl: meal.imageUrl,
              duration: meal.duration,
              complexity: meal.complexity,
              affordability: meal.affordability,
            );
          },
          itemCount: displayedMeals.length),
    );
  }
}
