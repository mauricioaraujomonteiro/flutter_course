import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widget/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    favoriteMeals.forEach((element) {
      print(element.title);
    });
    return SingleChildScrollView(
        child: Container(
          height: 600,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: favoriteMeals.length,
            itemBuilder: (context, index) {
              var meal = favoriteMeals[index];
              return MealItem(
                title: meal.title,
                imageUrl: meal.imageUrl,
                id: meal.id,
                duration: meal.duration,
                complexity: meal.complexity,
                affordability: meal.affordability,
                removeItem: () {},
              );
            },
      ),
        ),
    );
  }
}
