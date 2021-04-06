import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/category_meals_screen.dart';
import 'package:flutter_application_2/screens/meal_detail_screen.dart';
import 'package:flutter_application_2/screens/tab_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabScreen(),
      theme: ThemeData(accentColor: Colors.blue),
      routes: {
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen()
      },
    );
  }
}
