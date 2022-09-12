import 'package:delimeals/widgets/category_item.dart';
import 'package:delimeals/dummy_data.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('DeliMeals ciao Tere, Giovanni e Lollo'),
      // ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisExtent: 100,
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES.map((category) {
          return CategoryItem(
            id: category.id,
            color: category.color,
            title: category.title,
          );
        }).toList(),
      ),
    );
  }
}
