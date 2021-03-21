import 'package:Procery/src/screens/recipe/RecipeSearch.dart';
import 'package:Procery/src/shared/fryo_icons.dart';
import 'package:flutter/material.dart';
import './RecipeConstants.dart';
import '../../data/RecipeData.dart';
import '../../models/Recipe.dart';
import '../../models/Ingredient.dart';
import './RecipeDetail.dart';
import '../../shared/styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import '../../services/RecipeModel.dart';
import '../../screens/BaseWidgets.dart';
import 'package:provider/provider.dart';

class RecipeExplore extends StatefulWidget {
  @override
  RecipeExploreState createState() => RecipeExploreState();
}

class RecipeExploreState extends State<RecipeExplore> {
  List<bool> optionSelected = [false, false, false];

  @override
  Widget build(BuildContext context) {
    context.watch<RecipeModel>().recipeList;
    return Consumer<RecipeModel>(builder: (context, recipeModel, child) {
      print("RecipeExplore state refresh");

      return Scaffold(
        // Top part of the app
        backgroundColor: Colors.white,
        bottomNavigationBar: getBaseBottomNavBar(context, 1),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                "Recipes",
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            // Search bar
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    contentPadding: EdgeInsets.only(
                      left: 30,
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 24.0, left: 16.0),
                      child: IconButton(
                        icon: Icon(Fryo.magnifier),
                        color: Colors.black,
                        iconSize: 24,
                        onPressed: () {
                          deleteAllRecipe(recipeModel);
                          // loadAllRecipe(recipeModel);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
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
                            Text("Categories", style: h3),
                            Row(
                              children: [
                                Text("View All", style: h5),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 12,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Different categories
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          option('Cakes', 'assets/icons/cake.png', 0),
                          SizedBox(
                            width: 8,
                          ),
                          option('Muffins', 'assets/icons/muffin.png', 1),
                          SizedBox(
                            width: 8,
                          ),
                          option('Bread', 'assets/icons/bread.png', 2),
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      // Recipe Pictures
                      Container(
                        height: 350,
                        child: ListView.builder(
                          itemCount: recipeModel.recipeList.length,
                          itemBuilder: (context, index) {
                            Recipe rec = recipeModel.recipeList[index];
                            return buildRecipe(rec, index, recipeModel);
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
                        children: buildPopulars(recipeModel),
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
          color: optionSelected[index] ? Colors.greenAccent[700] : Colors.white,
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
  void loadAllRecipe(RecipeModel recipeModel) {
    deleteAllRecipe(recipeModel);
    List toAdd = getRecipes();
    for (var i = 0; i < toAdd.length; i++) {
      recipeModel.addItem(toAdd[i]);
    }
  }

  void deleteAllRecipe(RecipeModel recipeModel) {
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
  Widget buildRecipe(Recipe recipe, int index, RecipeModel recipeModel) {
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
        padding: EdgeInsets.all(10),
        width: 230,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image(
                        image: AssetImage(recipe.image), fit: BoxFit.cover))),
            SizedBox(
              height: 8,
            ),
            buildRecipeTitle(recipe.name),
            buildTextSubTitleVariation2(recipe.description),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildCalories(recipe.prepMins.toString() + " mins"),
                LikeButton(
                    size: 20,
                    isLiked: recipe.likes > 0,
                    onTap: (isLiked) {
                      return likeRecipe(isLiked, recipe, recipeModel);
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build popular recipes widget
  List<Widget> buildPopulars(RecipeModel recipeModel) {
    int maxSize = 10;
    List<Widget> list = [];

    List recipes = List.from(recipeModel.recipeList);
    recipes.sort((b, a) => a.likes.compareTo(b.likes));

    for (var i = 0; i < maxSize; i++) {
      list.add(buildPopular(recipes[i], recipeModel));
    }
    return list;
  }

  // Helper function to build individual recipes in popular recipes widget
  Widget buildPopular(Recipe recipe, RecipeModel recipeModel) {
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
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              height: 150,
              width: 150,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image(
                      image: AssetImage(recipe.image), fit: BoxFit.cover))),
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
                      LikeButton(
                        size: 20,
                        isLiked: recipe.likes > 0,
                        onTap: (isLiked) {
                          return likeRecipe(isLiked, recipe, recipeModel);
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

  Future<bool> likeRecipe(
      status, Recipe recipe, RecipeModel recipeModel) async {
    var allrecipes = recipeModel.recipeList;
    int index = 0;
    for (int i = 0; i < allrecipes.length; i++) {
      if (allrecipes[i].name == recipe.name) {
        index = i;
        break;
      }
    }

    recipe.likes += 1;

    recipeModel.updateItem(index, recipe);
    return Future.value(!status);
  }
}
