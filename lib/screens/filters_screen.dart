import 'package:delimeals/widgets/drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = "/filters";
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Your Filters')),
        drawer: const MainDrawer(),
        body: const Center(child: Text('Filters')));
  }
}
