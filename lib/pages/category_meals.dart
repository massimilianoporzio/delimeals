import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String categortId;
  final String categoryTitle;
  const CategoryMealsScreen(
      {Key? key, required this.categortId, required this.categoryTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: Center(
        child: Text("Ricette per la categoria  $categoryTitle"),
      ),
    );
  }
}
