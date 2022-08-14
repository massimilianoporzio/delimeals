import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String categortId;
  // final String categoryTitle;
  const CategoryMealsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'] ?? 'Categoria';
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: Center(
        child: Text("Ricette per la categoria  $categoryTitle"),
      ),
    );
  }
}
