import 'package:flutter/material.dart';

import '../dummy_data.dart';
import 'package:meals/widget/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  static final String text = '';
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map((item) => CategoryItem(item.id, item.title, item.color))
            .toList(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
    );
  }
}
