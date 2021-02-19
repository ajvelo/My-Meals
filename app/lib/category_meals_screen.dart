import 'package:app/cateory_item.dart';
import 'package:app/models/category.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs['title']),
      ),
      body: Center(
        child: Text('Recipes'),
      ),
    );
  }
}
