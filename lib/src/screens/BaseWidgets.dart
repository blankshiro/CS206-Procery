import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter/material.dart';
import 'package:Procery/src/shared/styles.dart';
import 'package:Procery/src/shared/colors.dart';
import 'package:Procery/src/shared/fryo_icons.dart';

getBaseAppBar(String title) {}

BottomNavigationBar getBaseBottomNavBar(BuildContext context, int index) {
  return BottomNavigationBar(
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
    type: BottomNavigationBarType.fixed,
    currentIndex: index,
    fixedColor: Colors.green[600],
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
