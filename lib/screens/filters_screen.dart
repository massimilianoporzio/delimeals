import 'package:delimeals/widgets/drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  const FiltersScreen(
      {super.key, required this.saveFilters, required this.currentFilters});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    super.initState();
  }

  Widget _buildSwitchListTitle(String title, String subtitle, bool currentValue,
      Function(bool) updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: currentValue,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
          actions: [
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegetarian': _vegetarian,
                    'vegan': _vegan
                  };
                  widget.saveFilters(selectedFilters);
                },
                icon: const Icon(Icons.save)),
            IconButton(
                onPressed: () {
                  setState(() {
                    _glutenFree = false;
                    _lactoseFree = false;
                    _vegan = false;
                    _vegetarian = false;
                  });
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegetarian': _vegetarian,
                    'vegan': _vegan
                  };
                  widget.saveFilters(selectedFilters);
                },
                icon: const Icon(Icons.clear)),
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Adjust your meal selection',
                  style: Theme.of(context).textTheme.headline6,
                )),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchListTitle("Gluten-Free",
                    "Only include gluten-free meals.", _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchListTitle(
                    "Lactose-Free",
                    "Only include lactose-free meals.",
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                _buildSwitchListTitle(
                    "Vegeterian", "Only include vegetarian meals.", _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                _buildSwitchListTitle(
                    "Vegan", "Only include vegan meals.", _vegan, (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                })
              ],
            )),
          ],
        ));
  }
}
