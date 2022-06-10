import 'package:flutter/material.dart';
import 'package:meals/screens/meal_detail_screen.dart';

import './screens/categories_sceen.dart';
import './screens/category_meals_screen.dart';
import './screens/tabs_screen_top.dart';
import 'dummy_data.dart';
import 'models/meal.dart';
import 'screens/filter_screen.dart';
import 'screens/tabs_screen_bottom.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filtersValues = {
    'vegan': false,
    'vegetarian': false,
    'lactose': false,
    'gluten': false
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _toggleMeal(String mealId) {
    final index = _favoriteMeals.indexWhere((element) => element.id == mealId);
    if (index >= 0) {
      setState(() {
        _favoriteMeals.removeAt(index);
      });
      return;
    }
    setState(() {
      _favoriteMeals.add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
    });

  }

  bool isFavoriteMeal(String mealId) {
    return _favoriteMeals.any((element) => element.id == mealId);
  }
  void _saveFilters(Map<String, bool> filters) {
    setState(() {
      print('filters ${filters}');

      _filtersValues = filters;
      _availableMeals =  DUMMY_MEALS.where((element) {
        if (_filtersValues['gluten'] && !element.isGlutenFree) {
          return false;
        }
        if (_filtersValues['lactose'] && !element.isLactoseFree) {
          return false;
        }
        if (_filtersValues['vegan'] && !element.isVegan) {
          return false;
        }
        if (_filtersValues['vegetarian'] && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                subtitle1: TextStyle(
                    fontSize: 20,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold),
                subtitle2: TextStyle(fontFamily: 'Raleway'),
              )),
      routes: {
        '/': (ctx) => TabScreenBottom(_favoriteMeals),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleMeal, isFavoriteMeal),
        FilterScreen.routeName: (ctx) => FilterScreen(_saveFilters)
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
