import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = '/category-meals/meal-detail';
  final Function toggleMeal;
  final Function isFavoriteMeal;

  MealDetailScreen(this.toggleMeal, this.isFavoriteMeal);

  Widget buildContainerItems(BuildContext context, Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width,
      child: child,
    );
  }

  Widget buildContainerTitle(BuildContext buildContext, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(buildContext).textTheme.subtitle1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final title = args['title'];
    final mealId = args['id'];
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedMeal.title,
          style: TextStyle(fontFamily: 'Raleway'),
        ),
      ),
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
            buildContainerTitle(context, "Ingredientes"),
            buildContainerItems(
              context,
              ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (something, index) {
                    return Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(
                          selectedMeal.ingredients[index],
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    );
                  }),
            ),
            buildContainerTitle(context, "Steps"),
            buildContainerItems(
              context,
              ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                child: Text('# ${index + 1}'),
                              ),
                              title: Text(selectedMeal.steps[index]),
                            ),
                          ],
                        ),
                        Divider(),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavoriteMeal(mealId) ? Icons.star: Icons.star_border,
        ),
        onPressed: () {
          toggleMeal(mealId);
        },
      ),
    );
  }
}
