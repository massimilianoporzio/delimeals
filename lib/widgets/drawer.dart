import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, IconData icon) {
    //SE VOGLIO FARE BUILD O ACCEDERE A THEME ECC MEGLIO USARE WIDGET A PARTE SU FILE A PARTE SE NO PARTE IL BUILD DEL MAINDRAWER E NON SOLO DEL LISTTITLE
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
        Container(
          height: 120,
          width: double.infinity,
          color: Theme.of(context).colorScheme.secondary,
          padding:
              const EdgeInsets.only(top: 70, bottom: 10, left: 20, right: 20),
          alignment: Alignment.centerLeft,
          child: Text(
            'Cooking Up!',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 28,
                color: Theme.of(context).colorScheme.primary),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        buildListTile('Meals', Icons.restaurant),
        buildListTile('Filters', Icons.settings),
      ]),
    );
  }
}