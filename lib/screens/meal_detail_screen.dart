import 'package:flutter/material.dart';

import '../data/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = 'routeNameMeal';
  Widget buildSectionTitle(String text) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(text,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }

  Widget buildSection(Widget widget) {
    return Container(
      height: 250,
      width: double.infinity,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: widget,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((element) => element.id == id);

    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle('Ingredients'),
            buildSection(ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx, index) => Card(
                      color: Colors.amber,
                      elevation: 5,
                      margin: EdgeInsets.all(5),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(selectedMeal.ingredients[index]),
                      ),
                    ))),
            buildSectionTitle('Steps'),
            buildSection((ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (ctx, index) => ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    )))),
          ],
        ),
      ),
    );
  }
}
