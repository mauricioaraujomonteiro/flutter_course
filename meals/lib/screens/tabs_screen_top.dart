import 'package:flutter/material.dart';

import 'categories_sceen.dart';
import 'favorite_screen.dart';

class TabScreenTop extends StatefulWidget {
  @override
  _TabScreenTopState createState() => _TabScreenTopState();
}

class _TabScreenTopState extends State<TabScreenTop> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Meals',
            style: TextStyle(fontFamily: 'Raleway'),
          ),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.category), text: 'Categories'),
              Tab(icon: Icon(Icons.favorite), text: 'Favorite'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoriesScreen(),
          //  FavoriteScreen(),
          ],
        ),
      ),
    );
  }
}
