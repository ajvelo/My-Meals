import 'package:app/dummy_data.dart';
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget buildSectionTitle(String text, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child, double deviceHeight, double deviceWidth) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(16.0)),
        margin: EdgeInsets.all(16.0),
        padding: EdgeInsets.all(16.0),
        height: deviceHeight * 0.2,
        width: deviceWidth * 0.8,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text(selectedMeal.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: deviceHeight * 0.3,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle('Ingredients', context),
              buildContainer(
                  ListView.builder(
                    itemBuilder: (context, index) => Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(selectedMeal.ingredients[index]),
                      ),
                    ),
                    itemCount: selectedMeal.ingredients.length,
                  ),
                  deviceHeight,
                  deviceWidth),
              buildSectionTitle('Steps', context),
              buildContainer(
                  ListView.builder(
                      itemCount: selectedMeal.steps.length,
                      itemBuilder: (ctx, index) => Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  child: Text('# ${index + 1}'),
                                ),
                                title: Text(selectedMeal.steps[index]),
                              ),
                              Divider()
                            ],
                          )),
                  deviceHeight,
                  deviceWidth)
            ],
          ),
        ));
  }
}
