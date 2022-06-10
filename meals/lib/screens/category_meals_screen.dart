import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../models/meal.dart';
import '../widget/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const String routeName = '/category-meals';

  List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  List<Meal> _categoryMeals;
  String _categoryTitle;
  String _id;
  bool _wasInitializedBefore = false;

  @override
  void didChangeDependencies() {
    if (!_wasInitializedBefore) {
      final args = ModalRoute.of(context).settings.arguments as Map<String, String>;
      _categoryTitle = args['title'];
      _id = args['id'];
        _categoryMeals = widget.availableMeals.where((meal) {
          return meal.categories.contains(_id);
        }).toList();
      _categoryMeals.forEach((element) {print(element.title);});

      _wasInitializedBefore = true;
    }
    super.didChangeDependencies();


  }
  void _removeMeal(String id) {
    setState(() {
      _categoryMeals.removeWhere((element) => element.id == id);

    });
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: Text(
            _categoryTitle,
            style: TextStyle(fontFamily: 'Raleway'),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: _categoryMeals[index].id,
              title: _categoryMeals[index].title,
              affordability: _categoryMeals[index].affordability,
              complexity: _categoryMeals[index].complexity,
              duration: _categoryMeals[index].duration,
              imageUrl: _categoryMeals[index].imageUrl,
              removeItem: _removeMeal,

            );
          },
          itemCount: _categoryMeals.length,
        ));
  }
}
