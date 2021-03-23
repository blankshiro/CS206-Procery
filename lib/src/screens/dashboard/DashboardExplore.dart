import 'package:Procery/src/data/IngredientData.dart';
import 'package:Procery/src/router.gr.dart';
import 'package:Procery/src/screens/mealplanner/MealPlannerInitial.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../TimeCompare.dart';

import '../../shared/styles.dart';
import '../../shared/colors.dart';

import './DashboardConstants.dart';
import './ExpiringPage.dart';
import '../../screens/BaseWidgets.dart';

import 'package:Procery/src/data/MealPlannerData.dart';
import 'package:Procery/src/data/InventoryData.dart';
import 'package:Procery/src/data/RecipeData.dart';
import 'package:Procery/src/data/PurchaseData.dart';
import 'package:Procery/src/data/GroceryListData.dart';

import './GroceryData.dart';
import './MealData.dart';

import 'package:Procery/src/services/IngredientModel.dart';
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
  // var _checkedGroceryList = [];

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

      map.putIfAbsent(
          i,
          () => Container(
              width: 200,
              child: Text(
                text,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              )));
    }
  }

  Widget getChildWidget() => childWidgets[sharedValue];

  InventoryModel inventoryModel;
  PurchaseModel purchaseModel;
  RecipeModel recipeModel;
  PlannerRecordModel plannerRecordModel;
  GroceryListModel groceryListModel;
  IngredientModel ingredientModel;

  @override
  Widget build(BuildContext context) {
    inventoryModel = Provider.of<InventoryModel>(context, listen: false);
    purchaseModel = Provider.of<PurchaseModel>(context, listen: false);
    recipeModel = Provider.of<RecipeModel>(context, listen: false);
    plannerRecordModel =
        Provider.of<PlannerRecordModel>(context, listen: false);
    groceryListModel = Provider.of<GroceryListModel>(context, listen: false);
    ingredientModel = Provider.of<IngredientModel>(context, listen: false);

    // context.watch reloads screen
    var inventoryList = context.watch<InventoryModel>().inventoryList;
    var grocerylistList = context.watch<GroceryListModel>().grocerylistList;

    // sort the grocery list according to deadline
    grocerylistList.sort((a, b) => a.deadLine.compareTo(b.deadLine));

    if (DashboardExplore.initialise == true) {
      loadAllIngredient(ingredientModel);
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

      for (int i = 0; i < allMealPlan.length; i++) {
        if (allMealPlan[i].date.isSameDate(today)) {
          if (allMealPlan[i].meal == "B") {
            mealPlan[0] = allMealPlan[i];
          } else if (allMealPlan[i].meal == "L") {
            mealPlan[1] = allMealPlan[i];
          } else if (allMealPlan[i].meal == "D") {
            mealPlan[2] = allMealPlan[i];
          }
        }
      }

      for (var i = 0; i < mealPlan.length; i++) {
        PlannerRecord meal = mealPlan[i];
        if (meal != null) {
          childWidgets.add(GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RecipeDetail(recipe: meal.recipe)),
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
              )));
        } else {
          childWidgets.add(GestureDetector(
              onTap: () {
                Navigator.push(
                  // TODO there is some problem doing navigation this way
                  context,
                  MaterialPageRoute(builder: (context) => MealPlannerInitial()),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(24),
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    )),
                child: Text("Please Add a Meal Plan"),
              )));
        }
      }
    }

    loadChildWidgets();

    return Scaffold(
      bottomNavigationBar: getBaseBottomNavBar(context, 0),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(20, 45, 0, 0),
              child: Text(
                "My",
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                "Inventory",
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                ),
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ExpiringPage()),
                          );
                        },
                        child: Text("View All > ", style: h5),
                      )
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                "Today's",
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
              child: Text(
                "Meal",
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                ),
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
                        groupValue:
                            sharedValue, //The current selected Index or key
                        selectedColor: Colors.greenAccent[
                            700], //Color that applies to select key or index
                        unselectedColor: Colors
                            .grey, // The color that applies to the unselected tabs or inactive tabs
                        children:
                            map, //The tabs which are assigned in the form of map
                        padding: EdgeInsets.all(10),
                        borderColor: Colors.white,
                      ),
                    ],
                  ),
                )),
            SizedBox(
              width: 8,
            ),
            // Container
            Container(
              height: 192,
              child: PageView(
                children: <Widget>[
                    getChildWidget(),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                "My",
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
              child: Text(
                "Grocery List",
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  buildTextSubTitleVariation1("Deadline: " +
                      DateFormat('MM - dd')
                          .format(grocerylistList[0].deadLine)),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
            ),
            Table(
              columnWidths: {
                // 0: FixedColumnWidth(20),
                0: FixedColumnWidth(256),
                1: FixedColumnWidth(100),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
              children: [
                TableRow(
                  children: [
                    // Container(),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Text("Name: ", style: priceTextBold),
                    ),
                    Container(
                      child: Text("Purchased: ", style: priceTextBold),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: buildGroceries(grocerylistList[0]),
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
    if (displayLength > 3) {
      displayLength = 3;
    }

    DateTime today = DateTime.now();
    List<Inventory> expirySorted = List.from(inventoryList);
    for (var i = 0; i < expirySorted.length; i++) {
      expirySorted[i].daysToExpiry = expirySorted[i].ingredient.expiryDays -
          today.difference(expirySorted[i].datePurchased).inDays;
    }

    expirySorted.sort((a, b) => a.daysToExpiry.compareTo(b.daysToExpiry));

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
                    buildRecipeSubTitle(
                        "Amount left: " + inv.quantity.toString()),
                    buildExpiryDays("Expiring in: " +
                        inv.daysToExpiry.toString() +
                        " Days"),
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

  List<Widget> buildGroceries(lastestGroceryList) {
    List<Widget> purchaseList = List<Widget>();

    for (var i = 0; i < lastestGroceryList.purchases.length; i++) {
      Purchase purchase = lastestGroceryList.purchases[i];
      purchaseList.add(buildGrocery(purchase));
    }
    return purchaseList;
  }

  Widget buildGrocery(Purchase purchase) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Table(
          columnWidths: {
            0: FixedColumnWidth(256),
            1: FlexColumnWidth(),
          },
          children: [
            TableRow(
              children: [
                TableCell(
                    child: Container(
                  padding: EdgeInsets.only(left: 20),
                  child: buildGroceryTitle(purchase.ingredient.name.toString()),
                )),
                TableCell(
                    child: Container(
                        child: buildGrocerySubtitle(
                            purchase.purchased.toString() +
                                "/" +
                                purchase.quantity.toString()))),
              ],
            ),
          ],
        ));
  }

  /////////////////////////////////////
  /// Loading of Models for initialisation
  ////////////////////////////////////

  void loadAllIngredient(IngredientModel ingredientModel) {
    ingredientModel.deleteAll();

    List<Ingredient> toAdd = getIngredients();
    for (int i = 0; i < toAdd.length; i++) {
      ingredientModel.addItem(toAdd[i]);
    }
  }

  void loadAllInventory(InventoryModel inventoryModel) {
    inventoryModel.deleteAll();

    List<Inventory> toAdd = getInventory();
    for (int i = 0; i < toAdd.length; i++) {
      inventoryModel.addItem(toAdd[i]);
    }
  }

  void loadAllPurchase(PurchaseModel purchaseModel) {
    purchaseModel.deleteAll();

    List<Purchase> toAdd = getSampleListPurchase();
    for (int i = 0; i < toAdd.length; i++) {
      purchaseModel.addItem(toAdd[i]);
    }
  }

  void loadAllGroceryList(GroceryListModel groceryListModel) {
    groceryListModel.deleteAll();

    List<GroceryList> toAdd = getGroceryList();
    for (int i = 0; i < toAdd.length; i++) {
      groceryListModel.addItem(toAdd[i]);
    }
  }

  void loadAllRecipe(RecipeModel recipeModel) {
    recipeModel.deleteAll();

    List<Recipe> toAdd = getRecipes();
    for (int i = 0; i < toAdd.length; i++) {
      recipeModel.addItem(toAdd[i]);
    }
  }

  void loadAllMealPlan(PlannerRecordModel plannerRecordModel) {
    plannerRecordModel.deleteAll();

    List<PlannerRecord> toAdd = getPlannerRecords();
    for (int i = 0; i < toAdd.length; i++) {
      plannerRecordModel.addItem(toAdd[i]);
    }
  }
}

// extension DateOnlyCompare on DateTime {
//   bool isSameDate(DateTime other) {
//     return this.year == other.year &&
//         this.month == other.month &&
//         this.day == other.day;
//   }
// }
