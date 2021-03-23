import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter/material.dart';
import 'package:Procery/src/shared/styles.dart';
import 'package:Procery/src/shared/colors.dart';

getBaseAppBar(String title) {}

BottomNavigationBar getBaseBottomNavBar(BuildContext context, int index) {
  return BottomNavigationBar(
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          // ignore: deprecated_member_use
          title: Text(
            'Home',
            style: tabLinkStyle,
          )),
      BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          // ignore: deprecated_member_use
          title: Text(
            'Recipe',
            style: tabLinkStyle,
          )),
      BottomNavigationBarItem(
          icon: Icon(Icons.format_list_bulleted),
          title: Text(
            'Grocery List',
            style: tabLinkStyle,
          )),
      BottomNavigationBarItem(
          icon: Icon(Icons.person_outlined),
          title: Text(
            'Meal Planner',
            style: tabLinkStyle,
          ))
    ],
    type: BottomNavigationBarType.fixed,
    currentIndex: index,
    fixedColor: Colors.greenAccent[700],
    onTap: (index) {
      switch (index) {
        case 0:
          Navigator.pushNamed(context, "/");
          break;
        case 1:
          Navigator.pushNamed(context, "/recipe-explore");
          break;
        case 2:
          Navigator.pushNamed(context, "/g-lcurrent-page");
          break;
        case 3:
          Navigator.pushNamed(context, "/meal-planner-initial");
          break;
      }
    },
  );
}

getBackButton(context) {
  return Padding(
    padding: EdgeInsets.fromLTRB(10, 45, 0, 0),
    child: IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
      alignment: Alignment.topLeft,
    ),
  );
}
