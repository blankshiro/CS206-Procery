import 'package:Procery/src/screens/mealplanner/MealPlanner.dart';
import 'package:flutter/material.dart';
import 'package:Procery/src/shared/styles.dart';
import 'package:Procery/src/shared/colors.dart';
import 'package:Procery/src/shared/fryo_icons.dart';

// Import 'First' Pages of functions
import 'package:Procery/src/screens/dashboard/DashboardExplore.dart';
import 'package:Procery/src/screens/recipe/RecipeExplore.dart';
import 'package:Procery/src/screens/grocerylist/GLCurrentPage.dart';
import 'package:Procery/src/screens/mealplanner/MealPlannerInitial.dart';

class BaseScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BaseState();
  }
}

class _BaseState extends State<BaseScreen> {
  int _selectedIndex = 0;
  final List<Widget>_children = [
    DashboardExplore(),
    RecipeExplore(),
    GLHome(),
    MealPlannerInitial(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        // leading: IconButton(
        //   onPressed: () {},
        //   iconSize: 21,
        //   icon: Icon(Fryo.funnel),
        // ),
        backgroundColor: primaryColor,
        title:
        Text('Procery', style: logoWhiteStyle, textAlign: TextAlign.center),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.all(0),
            onPressed: () {},
            iconSize: 21,
            icon: Icon(Fryo.magnifier),
          ),
          IconButton(
            padding: EdgeInsets.all(0),
            onPressed: () {},
            iconSize: 21,
            icon: Icon(Fryo.alarm),
          )
        ],
      ),
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Fryo.shop),
              // ignore: deprecated_member_use
              title: Text(
                'Home',
                style: tabLinkStyle,
              )),
          BottomNavigationBarItem(
              icon: Icon(Fryo.note),
              // ignore: deprecated_member_use
              title: Text(
                'Recipe',
                style: tabLinkStyle,
              )),
          BottomNavigationBarItem(
              icon: Icon(Fryo.list),
              title: Text(
                'Grocery List',
                style: tabLinkStyle,
              )),
          BottomNavigationBarItem(
              icon: Icon(Fryo.user_1),
              title: Text(
                'Meal Planner',
                style: tabLinkStyle,
              ))
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.green[600],
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print('index: $_selectedIndex');
    });
  }
}