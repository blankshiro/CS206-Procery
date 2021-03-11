// import 'package:Procery/src/screens/recipe/RecipeDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import 'dart:developer';

import '../../shared/styles.dart';
import '../../shared/colors.dart';
import '../../shared/fryo_icons.dart';
import '../unused/ProductPage.dart';
import '../../shared/Product.dart';
import '../../shared/partials.dart';

import './DashboardConstants.dart';

import './ExpiringPage.dart';
import './InventoryData.dart';
import './GroceryData.dart';
import './MealData.dart';

import '../recipe/RecipeData.dart';
import '../recipe/RecipeExplore.dart';
import '../recipe/RecipeDetail.dart';

class DashboardExplore extends StatefulWidget {
  final String pageTitle;

  DashboardExplore({Key key, this.pageTitle}) : super(key: key);

  @override
  _DashboardExploreState createState() => _DashboardExploreState();
}

class _DashboardExploreState extends State<DashboardExplore> {

  // Cupertino Segmented Control takes children in form of Map.
  Map<int, Widget> map = new Map();
  List<Widget> childWidgets;
  int sharedValue = 0;

  @override
  void initState() {
    super.initState();
    loadCupertinoTabs(); //Method to add Tabs to the Segmented Control.
    loadChildWidgets(); //Method to add the Children as user selected.
    getChildWidget();
  }

  /////////////////////////////////////
  /// MEAL PART
  ////////////////////////////////////

  void loadCupertinoTabs() {
    map = new Map();
    String text = "";
    for (int i = 0; i < 3; i++) {
      if (i == 0) {
        text = "Breakfast";
      } else if (i == 1) {
        text = "Lunch";
      } else if (i == 2) {
        text = "Dinner";
      }

      map.putIfAbsent(i,
        () =>
        Container(
            width: 100,
            child: Text(
              text,
              textAlign: TextAlign.center,
            )
        )
      );
    }
  }


  void loadChildWidgets() {
    childWidgets = [];

    DateTime now = DateTime.now();
    // to get the correct timezone, add 8 hours
    now = now.add(new Duration(hours: 8));

    List<Meal> breakfastList = [];
    List<Meal> lunchList = [];
    List<Meal> dinnerList = [];
    List<List<Meal>> fullMealList = [];

    for (int i = 0; i < getMeal().length; i++) {

      var mealDate = getMeal()[i].date;
      int mealTime = getMeal()[i].time;

      // if meal date is today's date, print today's meal
      if (mealDate.isSameDate(now)) {
        if (mealTime == 0) {
          breakfastList.add(getMeal()[i]);
          // breakfast
        } else if (mealTime == 1) {
          lunchList.add(getMeal()[i]);
          // lunch
        } else {
          dinnerList.add(getMeal()[i]);
          // dinner
        }
      }

      fullMealList.add(breakfastList);
      fullMealList.add(lunchList);
      fullMealList.add(dinnerList);

    }

    // if (breakfastList.length == 0)


    for (int j = 0; j < 3; j++) {
      childWidgets.add(
        addChildWidgetContainer(fullMealList[j])
      );
    }
  }
  Widget getChildWidget() => childWidgets[sharedValue];

  List<Widget> addChildWidgetContainer(mealList) {
    List<Widget> containers = [];
    for (int k = 0; k < mealList.length; k++) {
      containers.add(
        Column(
          children: [
            Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [kBoxShadow],
              ),
              child: Row(
                children: [
                  Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(mealList[k].image),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildRecipeTitle(mealList[k].title + "ASDASDaaaaa"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      );

    }
    return containers;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            // Spacing
            SizedBox(
              height: 16,
            ),
            // Words
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  buildTextTitleVariation1('Expiring Soon'),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
            ),
            Container(
              height: 190,
              child: PageView(
                // physics: BouncingScrollPhysics(),
                children: [
                  buildExpiring(getExpiring()[0]),
                  // FlatButton(
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => ExpiringPage()),
                  //     );
                  //   },
                  // ),
                ]
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  buildTextTitleVariation1("Today's Meal"),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      CupertinoSegmentedControl(
                        onValueChanged: (value) {
                          // Callback function executed when user changes the Tabs
                          setState(() {
                            sharedValue = value;
                          });
                        },
                        groupValue: sharedValue,
                        //The current selected Index or key
                        children: map, //The tabs which are assigned in the form of map
                      ),
                    ],
                  ),
                )
            ),
            SizedBox(
              width: 8,
            ),
            // Container
            Container(
              height: 192,
              child: PageView(
                children: <Widget>[
                  Expanded(
                    child: getChildWidget(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  buildTextTitleVariation1("Grocery List"),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
            ),
            Column(
              children: buildGroceries(),
            ),

          ],
        ),
      ),
    );
  }

  /////////////////////////////////////
  /// EXPIRING PART
  ////////////////////////////////////

  // List<Widget> buildExpirings() {
  //   List<Widget> expiringList = [];
  //   // for (var i = 0; i < getExpiring().length; i++) {
  //   // just return the closest to expiry date item
  //     expiringList.add(buildExpiring(getExpiring()[0]));
  //   // }
  //   return expiringList;
  // }

  Widget buildExpiring(Inventory inv) {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        boxShadow: [kBoxShadow],
      ),
      child: FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ExpiringPage()),
          );
        },
        child: Row(
          children: [
            Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(inv.image),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildRecipeTitle(inv.title),
                    buildRecipeSubTitle(inv.description),
                    buildExpiryDays(
                        "Expiring in: " + inv.expiry.toString() + " Days"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }

  /////////////////////////////////////
  /// GROCERY PART
  ////////////////////////////////////

  List<Widget> buildGroceries() {
    List<Widget> groceryList = [];
    for (var i = 0; i < getGrocery().length; i++) {
      // show if the grocery not bought yet
      if (!getGrocery()[i].bought)
        groceryList.add(buildGrocery(getGrocery()[i]));
    }
    return groceryList;
  }

  Widget buildGrocery(Grocery grocery) {
    return GestureDetector(
      child: Container(
        // padding: EdgeInsets.all(10),
        child: Row(
          children: [
            // on press, remove the line of grocery (change bought to true)
            // have a button to undo at the bottom of the page
            Container(
              padding: EdgeInsets.fromLTRB(30, 2, 20, 2),
              // color: Colors.red[50],
              child: Icon(
                Icons.crop_square,
                size: 30,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 2, 100, 2),
              color: Colors.grey[50],
              child: buildGroceryTitle(grocery.title),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(10, 2, 37, 2),
                color: Colors.grey[50],
                child: buildGrocerySubtitle(grocery.description)
            ),
          ],
        ),
      ),
    );
  }
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return this.year == other.year && this.month == other.month
        && this.day == other.day;
  }
}

