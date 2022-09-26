import 'package:delimeals/widgets/drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

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
        appBar: AppBar(title: const Text('Your Filters')),
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
