
import 'package:Procery/src/router.gr.dart';
import 'package:Procery/src/screens/mealplanner/MealPlannerInitial.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';


import '../../shared/styles.dart';
import '../../shared/colors.dart';

import './DashboardConstants.dart';
import './ExpiringPage.dart';

import 'package:Procery/src/data/MealPlannerData.dart';
import 'package:Procery/src/data/InventoryData.dart';
import 'package:Procery/src/data/RecipeData.dart';
import 'package:Procery/src/data/PurchaseData.dart';
import 'package:Procery/src/data/GroceryListData.dart';

import './GroceryData.dart';
import './MealData.dart';

import 'package:Procery/src/services/InventoryModel.dart';
import 'package:Procery/src/services/PlannerRecordModel.dart';
import 'package:Procery/src/services/PurchaseModel.dart';
import 'package:Procery/src/services/RecipeModel.dart';
import 'package:Procery/src/services/GroceryListModel.dart';

import 'package:Procery/src/models/Inventory.dart';
import 'package:Procery/src/models/Recipe.dart';
import 'package:Procery/src/models/Ingredient.dart';
import 'package:Procery/src/models/PlannerRecord.dart';
import 'package:Procery/src/models/Purchase.dart';
import 'package:Procery/src/models/GroceryList.dart';


import '../recipe/RecipeDetail.dart';

class DashboardExplore extends StatefulWidget {
  final String pageTitle;

  DashboardExplore({Key key, this.pageTitle}) : super(key: key);

  @override
  _DashboardExploreState createState() => _DashboardExploreState();

  static bool initialise = true;
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

  // Grocery Checkbox
  var _checkedGroceryList = [];


  @override
  void initState() {
    // Meal Planner Tabs
    super.initState();
    loadCupertinoTabs(); //Method to add Tabs to the Segmented Control.

    // Expiring Container Timer
    // int totalPage = getExpiringSize();
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

  Widget getChildWidget() => childWidgets[sharedValue];

  @override
  Widget build(BuildContext context) {

    InventoryModel inventoryModel = Provider.of<InventoryModel>(context, listen: false);
    PurchaseModel purchaseModel = Provider.of<PurchaseModel>(context, listen: false);
    RecipeModel recipeModel = Provider.of<RecipeModel>(context, listen: false);
    PlannerRecordModel plannerRecordModel = Provider.of<PlannerRecordModel>(context, listen: false);
    GroceryListModel groceryListModel = Provider.of<GroceryListModel>(context, listen: false);

    var inventoryList = context.watch<InventoryModel>().inventoryList;

    if(DashboardExplore.initialise == true){
      loadAllInventory(inventoryModel);
      loadAllPurchase(purchaseModel);
      loadAllGroceryList(groceryListModel);
      loadAllRecipe(recipeModel);
      loadAllMealPlan(plannerRecordModel);
      DashboardExplore.initialise = false;
    }

    void loadChildWidgets() {
      childWidgets = [];
      List<PlannerRecord> mealPlan = [null, null, null];
      List<PlannerRecord> allMealPlan = plannerRecordModel.plannerRecordList;
      DateTime today = DateTime.now();

      for(int i = 0; i < allMealPlan.length; i++){
        if(allMealPlan[i].date.isSameDate(today)){
          if(allMealPlan[i].meal == "B"){
            mealPlan[0] = allMealPlan[i];
          }else if(allMealPlan[i].meal == "L"){
            mealPlan[1] = allMealPlan[i];
          }else if(allMealPlan[i].meal == "D"){
            mealPlan[2] = allMealPlan[i];
          }
        }
      }

      for (var i = 0; i < mealPlan.length; i++) {
        PlannerRecord meal = mealPlan[i];
        if(meal != null){
          childWidgets.add(
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RecipeDetail(recipe: meal.recipe)),
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
                                  image: AssetImage(meal.recipe.image),
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
                                    buildRecipeTitle(meal.recipe.name),
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
          );}
          else {
            childWidgets.add(
              GestureDetector(
                onTap:() {
                  Navigator.push( // TODO there is some problem doing navigation this way
                    context,
                    MaterialPageRoute(builder: (context) =>
                        MealPlannerInitial()),
                  );
                },

                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                  child: Text("Please Add a Meal Plan"),
                )

              )
            );
        }
      }
    }

    loadChildWidgets();


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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildTextTitleVariation1('Inventory'),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ExpiringPage()),
                          );
                        },
                        child: Text("View All > ", style: h5),
                      )
                    ],
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
                  children: buildExpirings(inventoryList),
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
            Table(
              columnWidths: {
                0: FixedColumnWidth(20),
                1: FixedColumnWidth(180),
                2: FixedColumnWidth(60),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
              children: [
                TableRow (
                  children: [
                    Container (
                    ),
                    Container(
                      // padding: EdgeInsets.only(left: 0),
                      child: Text (
                          "Name: "
                      ),
                      width: 128,
                    ),
                    Container(
                        child: Text (
                            "Quantity: "
                        )
                    ),
                  ],
                ),
              ],
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

  List<Widget> buildExpirings(List<Inventory> inventoryList) {
    List<Widget> expiringList = [];
    int displayLength = inventoryList.length;
    if(displayLength > 3){
      displayLength = 3;
    }

    DateTime today = DateTime.now();
    List<Inventory> expirySorted = List.from(inventoryList);
    for(var i = 0; i < expirySorted.length; i++){
      expirySorted[i].daysToExpiry = expirySorted[i].ingredient.expiryDays - today.difference(expirySorted[i].datePurchased).inDays;
    }

    expirySorted.sort((a,b) => a.daysToExpiry.compareTo(b.daysToExpiry));

    for (var i = 0; i < displayLength; i++) {
    // just return the closest to expiry date item
      expiringList.add(buildExpiring(expirySorted[i]));
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
                  image: AssetImage(inv.ingredient.image),
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
                    buildRecipeTitle(inv.ingredient.name),
                    buildRecipeSubTitle("Amount left: " + inv.quantity.toString()),
                    buildExpiryDays(
                        "Expiring in: " + inv.daysToExpiry.toString() + " Days"),
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
      if (!getGrocery()[i].checked)
        _checkedGroceryList.add(false);
        groceryList.add(buildGrocery(getGrocery()[i], i));
    }
    return groceryList;
  }

  Widget buildGrocery(Grocery grocery, int i) {
    return Table(
      columnWidths: {
        0: IntrinsicColumnWidth(),
        1: FixedColumnWidth(200),
        2: FlexColumnWidth(),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          children: [
            TableCell(
              child: Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.center,
                child: Checkbox(
                  value: _checkedGroceryList[i],
                  activeColor: primaryColor,
                  onChanged: (bool value) {
                    setState(() {
                      _checkedGroceryList[i] = value;
                      grocery.checked = true;
                    });
                  },
                ),
              ),
            ),
            TableCell(
                child: Container(
                  padding: EdgeInsets.only(left: 15),
                  child: buildGroceryTitle(grocery.name),
                  width: 128,
                )
            ),
            TableCell(
                child: Container(
                    child: buildGrocerySubtitle(grocery.quantity)
                )
            ),

          ],
        ),
      ],
    );

  }

  /////////////////////////////////////
  /// Loading of Models for initialisation
  ////////////////////////////////////

  void loadAllInventory(InventoryModel inventoryModel) {
    inventoryModel.deleteAll();

    List<Inventory> toAdd = getInventory();
    for(int i = 0; i < toAdd.length; i++){
      inventoryModel.addItem(toAdd[i]);
    }
  }

  void loadAllPurchase(PurchaseModel purchaseModel) {
    purchaseModel.deleteAll();

    List<Purchase> toAdd = getSampleListPurchase();
    for(int i = 0; i < toAdd.length; i++){
      purchaseModel.addItem(toAdd[i]);
    }
  }

  void loadAllGroceryList(GroceryListModel groceryListModel) {
    groceryListModel.deleteAll();

    List<GroceryList> toAdd = getGroceryList();
    for(int i = 0; i < toAdd.length; i++){
      groceryListModel.addItem(toAdd[i]);
    }
  }

  void loadAllRecipe(RecipeModel recipeModel) {
    recipeModel.deleteAll();

    List<Recipe> toAdd = getRecipes();
    for(int i = 0; i < toAdd.length; i++){
      recipeModel.addItem(toAdd[i]);
    }
  }

  void loadAllMealPlan(PlannerRecordModel plannerRecordModel) {
    plannerRecordModel.deleteAll();

    List<PlannerRecord> toAdd = getPlannerRecords();
    for(int i = 0; i < toAdd.length; i++){
      plannerRecordModel.addItem(toAdd[i]);
    }
  }

}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return this.year == other.year && this.month == other.month
        && this.day == other.day;
  }
}