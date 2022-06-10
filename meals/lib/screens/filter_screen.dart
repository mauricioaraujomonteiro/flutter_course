import 'package:flutter/material.dart';

import '../widget/main_drawer.dart';
import 'categories_sceen.dart';

class FilterScreen extends StatefulWidget {
  static const String routeName = 'filter';
  //final Map<String, bool> filtersValues;
  final Function saveFunction;

  const FilterScreen(this.saveFunction);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isGutlenFree = false;
  bool _isVegetarian = false;
  bool _isVegan = false;
  bool _isLactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed:(){
              Map<String, bool> filters = {
                'vegan': _isVegan,
                'vegetarian': _isVegetarian,
                'lactose': _isLactoseFree,
                'gluten': _isGutlenFree,
              };
              widget.saveFunction(filters);
            },


          )
        ],
        title: Text(
          'Filter',
          style: TextStyle(
              fontFamily: Theme.of(context).textTheme.subtitle2.fontFamily),
        ),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile(
                  'Gluten-free',
                  'Only includes glute-free meals',
                  _isGutlenFree, (newValue) {
                setState(() {
                  _isGutlenFree = newValue;
                });
              }),
              buildSwitchListTile(
                  'Vegan', 'Only includes vegan meals', _isVegan, (newValue) {
                setState(() {
                  _isVegan = newValue;
                });
              }),
              buildSwitchListTile(
                'Vegetarian',
                'Only includes vegetarian meals',
                _isVegetarian,
                (newValue) {
                  setState(() {
                    _isVegetarian = newValue;
                  });
                },
              ),
              buildSwitchListTile(
                  'Lactose-free',
                  'Only includes lactose-free meals',
                  _isLactoseFree, (newValue) {
                setState(() {
                  _isLactoseFree = newValue;
                });
              }),
            ],
          )),
        ],
      ),
    );
  }

  Widget buildSwitchListTile(
      String title, String subtitle, bool value, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        value: value,
        subtitle: Text(subtitle),
        onChanged: updateValue);
  }
}
