import 'package:app/screens/filters_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        '$title',
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 112,
            color: Theme.of(context).primaryColor,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 56.0, left: 48.0),
              child: Text(
                'Cooking up!',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          buildListTile("Meals", Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile("Filters", Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          })
        ],
      ),
    );
  }
}
