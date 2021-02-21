import 'package:app/screens/categories_screen.dart';
import 'package:app/screens/favorites_screen.dart';
import 'package:app/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatelessWidget {
  Widget menu(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      height: deviceHeight * 0.1,
      color: Theme.of(context).primaryColor,
      child: TabBar(
        tabs: [
          Tab(
            icon: Icon(Icons.category),
            text: 'Categories',
          ),
          Tab(icon: Icon(Icons.favorite), text: 'Favorites')
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('My Meals'),
          ),
          drawer: Drawer(
            child: MainDrawer(),
          ),
          bottomNavigationBar: menu(context),
          body: TabBarView(
            children: [
              CategoriesScreen(),
              FavoritesScreen(),
            ],
          ),
        ));
  }
}
