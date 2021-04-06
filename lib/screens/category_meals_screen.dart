import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/meal_item.dart';
import '../data/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = 'routeName';
  @override
  Widget build(BuildContext context) {
    final routesData =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final title = routesData['title'];
    final id = routesData['id'];
    final categoryMeals = DUMMY_MEALS.where((element) {
      return element.categories.contains(id);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: categoryMeals[index].id,
                title: categoryMeals[index].title,
                affordability: categoryMeals[index].affordability,
                complexity: categoryMeals[index].complexity,
                duration: categoryMeals[index].duration,
                imageUrl: categoryMeals[index].imageUrl);
          },
          itemCount: categoryMeals.length,
        ));
  }
}
