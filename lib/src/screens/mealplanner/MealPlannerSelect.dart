// Linked Screens
import 'package:Procery/src/screens/mealplanner/MealPlannerInitial.dart';
import 'package:Procery/src/screens/recipe/RecipeSearch.dart';
import '../../screens/recipe/RecipeDetail.dart';

// Data Models
import 'package:Procery/src/models/PlannerRecord.dart';
import 'package:Procery/src/services/PlannerRecordModel.dart';
import 'package:Procery/src/services/GroceryListModel.dart';
import 'package:Procery/src/models/GroceryList.dart';
import 'package:Procery/src/services/PurchaseModel.dart';
import 'package:Procery/src/models/Purchase.dart';
import '../../models/Recipe.dart';
import '../../services/RecipeModel.dart';
import 'package:Procery/src/models/Ingredient.dart';
import 'package:Procery/src/services/IngredientModel.dart';

// Styles
import '../../shared/styles.dart';
import './MealPlannerConstants.dart';

// Internal Dependencies
import '../../algo/recommendAlgo.dart';
import '../BaseWidgets.dart';

// External Dependencies
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealPlannerSelect extends StatefulWidget {
  final DateTime day;
  final String meal;

  MealPlannerSelect({@required this.day, @required this.meal});

  @override
  MealPlannerSelectState createState() => MealPlannerSelectState();
}

class MealPlannerSelectState extends State<MealPlannerSelect> {
  List<bool> optionSelected = [false, false, false];
  GroceryListModel groceryListModel;
  PurchaseModel purchaseModel;
  IngredientModel ingredientModel;
  PlannerRecordModel plannerRecordModel;

  @override
  Widget build(BuildContext context) {
    print("Meal Planner Select state refresh");
    // context.watch<RecipeModel>().recipeList;

    final recipeModel = Provider.of<RecipeModel>(context, listen: false);
    plannerRecordModel =
        Provider.of<PlannerRecordModel>(context, listen: false);
    groceryListModel = Provider.of<GroceryListModel>(context, listen: false);
    purchaseModel = Provider.of<PurchaseModel>(context, listen: false);
    ingredientModel = Provider.of<IngredientModel>(context, listen: false);

    Map<Recipe, int> recommendedRecipes = getRecommend(
        groceryListModel.grocerylistList,
        ingredientModel.ingredientList,
        recipeModel.recipeList);

    return Scaffold(
      // Top part of the app
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                // Categories bar
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getBackButton(context),
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                      child: Text(
                        "Fill up",
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                      child: Text(
                        "Your groceries",
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Based on Inventory",
                        // style: TextStyle(
                        //   fontSize: 23,
                        //   fontWeight: FontWeight.w700,
                        // ),
                        style: priceText,
                      ),
                    ),
                    // Different categories
                    SizedBox(
                      height: 8,
                    ),
                    // Recipe Pictures
                    Container(child: buildRecommend(recommendedRecipes)),
                    SizedBox(
                      height: 8,
                    ),
                    // What's Popular column
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Your Favourites",
                            style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          // buildTextTitleVariation2('Recent', true),
                          // IconButton(
                          //   icon: Icon(Icons.search),
                          //   iconSize: 25,
                          //   onPressed: () {
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (BuildContext context) {
                          //           return RecipeSearch();
                          //         },
                          //       ),
                          //     );
                          //   },
                          // )
                        ],
                      ),
                    ),
                    Column(
                      children: buildPopulars(recipeModel, plannerRecordModel),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRecommend(Map<Recipe, int> recommendations) {
    if (recommendations.isEmpty) {
      return buildEmptyRecommendation();
    }

    List<Recipe> recommendedRecipes = [];
    List<int> recommendedQ = [];

    recommendations.forEach((key, value) {
      recommendedRecipes.add(key);
      recommendedQ.add(value);
    });

    return Container(
        height: 350,
        child: ListView.builder(
          itemCount: recommendedRecipes.length,
          itemBuilder: (context, index) {
            Recipe rec = recommendedRecipes[index];
            return buildRecipe(rec, index, plannerRecordModel);
          },
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
        ));
  }

  Widget buildEmptyRecommendation() {
    return Container(
      padding: EdgeInsets.all(20),
      height: 250,
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            scale: 3.5,
            image: AssetImage(
              "assets/icons/strawberry.png",
            ),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          )),
      alignment: Alignment.topCenter,
      child: Text("You are currently maximising your use of groceries!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          )),
    );
  }

  Widget buildRecipe(
      Recipe recipe, int index, PlannerRecordModel plannerRecordModel) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RecipeDetail(recipe: recipe)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [kBoxShadow],
        ),
        margin: EdgeInsets.only(
            right: 16, left: index == 0 ? 16 : 0, bottom: 16, top: 8),
        padding: EdgeInsets.all(20),
        width: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Hero(
                tag: recipe.image,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(recipe.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            buildRecipeTitle(recipe.name),
            buildTextSubTitleVariation2(recipe.description),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildCalories(recipe.prepMins.toString() + " mins"),
                IconButton(
                  icon: Icon(Icons.add_circle),
                  color: Colors.green,
                  // iconSize: 20,
                  onPressed: () {
                    addRecipeToMealPlan(recipe, plannerRecordModel);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          buildPopupDialog(context),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build popular recipes widget
  List<Widget> buildPopulars(
      RecipeModel recipeModel, PlannerRecordModel plannerRecordModel) {
    List<Widget> list = [];

    List recipes = List.from(recipeModel.recipeList);
    recipes.sort((b, a) => a.likes.compareTo(b.likes));

    for (var i = 0; i < recipes.length; i++) {
      list.add(buildPopular(recipes[i], recipeModel, plannerRecordModel));
    }
    return list;
  }

  // Helper function to build individual recipes in popular recipes widget
  Widget buildPopular(Recipe recipe, RecipeModel recipeModel,
      PlannerRecordModel plannerRecordModel) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RecipeDetail(recipe: recipe)),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(recipe.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildRecipeTitle(recipe.name),
                    buildTextSubTitleVariation2(recipe.description),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildCalories(recipe.prepMins.toString() + " mins"),
                        IconButton(
                          icon: Icon(Icons.add_circle),
                          color: Colors.green,
                          // iconSize: 20,
                          onPressed: () {
                            addRecipeToMealPlan(recipe, plannerRecordModel);
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  buildPopupDialog(context),
                            );
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }

  void addRecipeToMealPlan(
      Recipe recipe, PlannerRecordModel plannerRecordModel) {
    DateTime today = DateTime.now();
    PlannerRecord toAdd = new PlannerRecord()
      ..recipe = recipe
      ..date = widget.day
      ..meal = widget.meal
      ..purchaseId = [];

    List<GroceryList> allLists = groceryListModel.grocerylistList;
    GroceryList masterList;
    for (int i = 0; i < allLists.length; i++) {
      if (allLists[i].type == 0 && allLists[i].active == 1) {
        masterList = allLists[i];
      }
    }

    if(masterList == null){
      GroceryList newList = new GroceryList()
        ..name = "Groceries for Meal Plan"
        ..deadLine = DateTime.now().add(Duration(days: 7))
        ..purchases = []
        ..type = 0
        ..active = 1
        ..id = groceryListModel.grocerylistList.length;

      groceryListModel.addItem(newList);
      masterList = newList;
    }

    print("Meal Plan adding groceries to " + masterList.name);
    int id = purchaseModel.purchaseList.length;
    List<Purchase> toPurchaseList = [];
    for (int i = 0; i < recipe.ingredients.length; i++) {
      Purchase toPurchase = new Purchase()
        ..ingredient = recipe.ingredients[i]
        ..quantity = recipe.ingredientsQ[i]
        ..dateAdded = today
        ..purchased = 0
        ..listName = masterList.name
        ..id = id;

      toAdd.purchaseId.add(id);
      id++;
      print("Purchase created:" + toPurchase.id.toString());
      purchaseModel.addItem(toPurchase);
      toPurchaseList.add(toPurchase);
    }


    for (int i = 0; i < toPurchaseList.length; i++) {
      bool found = false;
      for (int j = 0; j < masterList.purchases.length; j++) {
        if (masterList.purchases[j].ingredient.name ==
            toPurchaseList[i].ingredient.name) {
          masterList.purchases[j].quantity += toPurchaseList[i].quantity;
          masterList.purchases[j].dateAdded = toPurchaseList[i].dateAdded;
          found = true;
          continue;
        }
      }

      if (found == false) {
        masterList.purchases.add(toPurchaseList[i]);
      }
    }

    toAdd.groceryList = masterList;
    plannerRecordModel.addItem(toAdd);
    groceryListModel.updateItemByKey(masterList.id, masterList);
  }
}

Widget buildPopupDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('Add Recipe'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Do you want to add this recipe to your meal plan?"),
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MealPlannerInitial()),
          );
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Confirm'),
      ),
    ],
  );
}
