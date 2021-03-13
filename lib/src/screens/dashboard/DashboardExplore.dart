// import 'package:Procery/src/screens/recipe/RecipeDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

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

import '../recipe/Recipe.dart';
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
  // Meal Planner Tabs
  Map<int, Widget> map = new Map();
  List<Widget> childWidgets;
  int sharedValue = 0;

  // Expiring Container Timer
  int _currentPage = 0;
  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    // Meal Planner Tabs
    super.initState();
    loadCupertinoTabs(); //Method to add Tabs to the Segmented Control.
    loadChildWidgets(); //Method to add the Children as user selected.

    // Expiring Container Timer
    int totalPage = getExpiringSize();
    // Timer.periodic(Duration(seconds: 5), (Timer timer) {
    //   if (_currentPage < (totalPage - 1)) {
    //     _currentPage++;
    //   } else {
    //     _currentPage = 0;
    //   }
    //
    //   _pageController.animateToPage(
    //     _currentPage,
    //     duration: Duration(milliseconds: 500),
    //     curve: Curves.easeIn,
    //   );
    // });
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
    // for (int i = 0; i < 3; i++)
    for (var i = 0; i < getMeal().length; i++) {
      Meal meal = getMeal()[i];
      for (var j = 0; j < getRecipes().length; j++) {
        if (meal.name == getRecipes()[j].name) {
          Recipe recipe = getRecipes()[j];

          DateTime now = DateTime.now();
          // to get the correct timezone, add 8 hours
          now = now.add(new Duration(hours: 8));

          var mealDate = getMeal()[i].date;

          // prints the meal for today only
          // if (mealDate.isSameDate(now)) {
            childWidgets.add(
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RecipeDetail(recipe: recipe)),
                      );
                    },
                    child: Column(
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
                                    image: AssetImage(getMeal()[i].image),
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
                                      buildRecipeTitle(getMeal()[i].name),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                )
            );

          // }

          break;
        }
      }
    }
  }
  Widget getChildWidget() => childWidgets[sharedValue];

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
                  controller: _pageController,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                // physics: BouncingScrollPhysics(),
                  children: buildExpirings(),
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

  int getExpiringSize() {
    return getExpiring().length;
  }

  List<Widget> buildExpirings() {
    List<Widget> expiringList = [];
    for (var i = 0; i < getExpiring().length; i++) {
    // just return the closest to expiry date item
      expiringList.add(buildExpiring(getExpiring()[i]));
    }
    return expiringList;
  }

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