import 'package:Procery/src/models/PlannerRecord.dart';
import 'package:Procery/src/screens/dashboard/MealData.dart';
import 'package:Procery/src/screens/recipe/RecipeExplore.dart';
import 'package:Procery/src/screens/recipe/RecipeSearch.dart';
import 'package:Procery/src/services/PlannerRecordModel.dart';


import '../../models/Recipe.dart';
import '../../models/Ingredient.dart';

import '../../screens/recipe/RecipeDetail.dart';
import '../../services/RecipeModel.dart';
import '../../data/RecipeData.dart';

import '../../shared/styles.dart';
import './MealPlannerConstants.dart';
import 'package:Procery/src/shared/fryo_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
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

  @override
  Widget build(BuildContext context) {

    context.watch<RecipeModel>().recipeList;
    final plannerRecordModel = context.read<PlannerRecordModel>();
    return Consumer<RecipeModel>(builder: (context, recipeModel, child) {
      print("Meal Planner state refresh");


      return Scaffold(
        // Top part of the app
        backgroundColor: Colors.green[200],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          brightness: Brightness.light,
          elevation: 0,
          title: Text("Recipes", style: logoStyle),
          centerTitle: false,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(
                Icons.menu,
                color: Colors.black,
                size: 28,
              ),
            ),
          ],
        ),
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
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Fill up your groceries", style: h3),
                          ],
                        ),
                      ),
                      // Different categories
                      SizedBox(
                        height: 24,
                      ),
                      // Recipe Pictures
                      Container(
                        height: 350,
                        child: ListView.builder(
                          itemCount: recipeModel.recipeList.length,
                          itemBuilder: (context, index){

                            Recipe rec = recipeModel.recipeList[index];
                            return buildRecipe(rec, index, recipeModel, plannerRecordModel);
                          },
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      // What's Popular column
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildTextTitleVariation2("What's Popular", false),
                            SizedBox(
                              width: 8,
                            ),
                            // buildTextTitleVariation2('Recent', true),
                            IconButton(
                              icon: Icon(Icons.search),
                              iconSize: 25,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return RecipeSearch();
                                    },
                                  ),
                                );
                              },
                            )
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
    });


  }
  Widget option(String text, String image, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          optionSelected[index] = !optionSelected[index];
        });
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: optionSelected[index] ? Colors.green[200] : Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [kBoxShadow],
        ),
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            SizedBox(
              height: 32,
              width: 32,
              child: Image.asset(
                image,
                color: optionSelected[index] ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              text,
              style: TextStyle(
                color: optionSelected[index] ? Colors.white : Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to load recipe data into hive database
  void loadAllRecipe(RecipeModel recipeModel){
    deleteAllRecipe(recipeModel);
    List toAdd = getRecipes();
    for(var i = 0; i < toAdd.length; i++){
      recipeModel.addItem(toAdd[i]);
    }

  }

  void deleteAllRecipe(RecipeModel recipeModel){
    recipeModel.deleteAll();
  }

  // Can be removed, recipes can now be pulled directly from Hive Database
  // List<Widget> buildRecipes(var recipeList) {
  //   List<Widget> list = [];
  //   for (var i = 0; i < recipeList.length; i++) {
  //     list.add(buildRecipe(recipeList[i], i));
  //   }
  //
  //   return list;
  // }

  //
  Widget buildRecipe(Recipe recipe, int index, RecipeModel recipeModel, PlannerRecordModel plannerRecordModel) {
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
                  icon: Icon(Icons.add_rounded),
                  iconSize: 30,
                  onPressed: () {
                    addRecipeToMealPlan(recipe, plannerRecordModel);
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
  List<Widget> buildPopulars(RecipeModel recipeModel, PlannerRecordModel plannerRecordModel) {
    List<Widget> list = [];

    List recipes = List.from(recipeModel.recipeList);
    recipes.sort((b,a) => a.likes.compareTo(b.likes));

    for (var i = 0; i < recipes.length; i++) {
      list.add(buildPopular(recipes[i], recipeModel, plannerRecordModel));
    }
    return list;
  }

  // Helper function to build individual recipes in popular recipes widget
  Widget buildPopular(Recipe recipe, RecipeModel recipeModel, PlannerRecordModel plannerRecordModel) {
    return Container(
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
                      buildCalories(recipe.prepMins.toString() + " min"),
                      IconButton(
                        icon: Icon(Icons.add_rounded),
                        iconSize: 30,
                        onPressed: () {
                          addRecipeToMealPlan(recipe, plannerRecordModel);
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
    );
  }

  void addRecipeToMealPlan(Recipe recipe, PlannerRecordModel plannerRecordModel) {
    PlannerRecord toAdd = new PlannerRecord()
      ..recipe = recipe
      ..date = widget.day
      ..meal = widget.meal;

    plannerRecordModel.addItem(toAdd);

  }
}
