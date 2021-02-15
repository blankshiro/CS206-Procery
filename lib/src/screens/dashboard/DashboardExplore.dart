import 'package:Procery/src/screens/recipe/RecipeDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'dart:developer';

import '../../shared/styles.dart';
import '../../shared/colors.dart';
import '../../shared/fryo_icons.dart';
import '../unused/ProductPage.dart';
import '../../shared/Product.dart';
import '../../shared/partials.dart';

import './DashboardConstants.dart';
import './InventoryDetail.dart';
import './InventoryData.dart';

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
  int _selectedIndex = 0;

  // Cupertino Segmented Control takes children in form of Map.
  Map<int, Widget> map = new Map();
  List<Widget> childWidgets;
  int sharedValue = 0;

  @override
  void initState() {
    super.initState();
    loadCupertinoTabs(); //Method to add Tabs to the Segmented Control.
    loadChildWidgets(); //Method to add the Children as user selected.
  }

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
        () => Container (
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
    for (int i = 0; i < 3; i++)
      childWidgets.add(
        Center(
          // child: getRecipes(),
          child: Text(
            '''child $i'''
          ),
        ),
      );
  }
  Widget getChildWidget() => childWidgets[sharedValue];

  @override
  Widget build(BuildContext context) {

    // Add the first page of the functionalities here
    final List<Widget> _children = [
      DashboardExplore(),
      RecipeExplore(),
    ];


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
            // Container
            Container(
              height: 190,
              child: PageView(
                physics: BouncingScrollPhysics(),
                children: buildExpirings(),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            // Words
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
                      groupValue: sharedValue, //The current selected Index or key
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
              height: 190,
              child: PageView(
                children: <Widget>[
                  Expanded(
                    child: getChildWidget(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      log('index: $_selectedIndex');
    });
  }

  List<Widget> buildExpirings() {
    List<Widget> expiringList = [];
    for (var i = 0; i < getExpiring().length; i++) {
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
                  buildExpiryDays("Expiring in: " + inv.expiry.toString() + " Days"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget storeTab(BuildContext context) {
  List<Product> foods = [
    Product(
        name: "Hamburger",
        image: "images/3.png",
        price: "\$25.00",
        userLiked: true,
        discount: 10),
    Product(
        name: "Pasta",
        image: "images/5.png",
        price: "\$150.00",
        userLiked: false,
        discount: 7.8),
    Product(
      name: "Akara",
      image: 'images/2.png',
      price: '\$10.99',
      userLiked: false,
    ),
    Product(
        name: "Strawberry",
        image: "images/1.png",
        price: '\$50.00',
        userLiked: true,
        discount: 14)
  ];

  List<Product> drinks = [
    Product(
        name: "Coca-Cola",
        image: "images/6.png",
        price: "\$45.12",
        userLiked: true,
        discount: 2),
    Product(
        name: "Lemonade",
        image: "images/7.png",
        price: "\$28.00",
        userLiked: false,
        discount: 5.2),
    Product(
        name: "Vodka",
        image: "images/8.png",
        price: "\$78.99",
        userLiked: false),
    Product(
        name: "Tequila",
        image: "images/9.png",
        price: "\$168.99",
        userLiked: true,
        discount: 3.4)
  ];
}
