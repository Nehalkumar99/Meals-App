import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/meals.dart';
import 'package:flutter_application_2/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  void mealTap(ctx) {
    Navigator.of(ctx).pushNamed(MealDetailScreen.routeName, arguments: id);
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem(
      {@required this.id,
      @required this.title,
      @required this.affordability,
      @required this.complexity,
      @required this.duration,
      @required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => mealTap(context),
        child: Card(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(children: [
                ClipRRect(
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      height: 250,
                      width: double.infinity,
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                Positioned(
                    bottom: 0,
                    child: Container(
                      color: Colors.black54,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Text(
                        title,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ))
              ]),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(
                          width: 6,
                        ),
                        Text('$duration min'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work),
                        SizedBox(
                          width: 6,
                        ),
                        Text(complexityText),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.money),
                        SizedBox(
                          width: 6,
                        ),
                        Text(affordabilityText),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
