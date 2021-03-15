import 'package:flutter/material.dart';
import './RecipeConstants.dart';
import './RecipeData.dart';
import '../../models/Recipe.dart';
import '../../models/Ingredient.dart';
import '../../shared/styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RecipeDetail extends StatelessWidget {
  final Recipe recipe;

  RecipeDetail({@required this.recipe});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),

        // actions: [
        //   Padding(
        //     padding: EdgeInsets.only(right: 16),
        //     child: Icon(
        //       Icons.favorite_border,
        //       color: Colors.black,
        //     ),
        //   ),
        // ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            // Show the image in background
            Hero(
              child: Container(
                alignment: Alignment.center,
                height: size.height * 0.4,
                child: Image.asset(
                  recipe.image,
                  fit: BoxFit.cover,
                ),
              ),
              tag: recipe.image,
            ),

            //Container for more content
            DraggableScrollableSheet(
              maxChildSize: 1,
              initialChildSize: 0.6,
              minChildSize: 0.6,
              builder: (context, controller) {
                return SingleChildScrollView(
                  controller: controller,
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                recipe.name,
                                style: GoogleFonts.poppins(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                            ),
                            //Spacer(),
                            LikeButton(),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        // Ratings
                        Row(
                          children: <Widget>[
                            // Star rating
                            SmoothStarRating(
                              starCount: 5,
                              rating: 5,
                              color: Colors.orange,
                              borderColor: Colors.orange,
                            )
                          ],
                        ),

                        SizedBox(
                          height: 24,
                        ),

                        // Container for recipe information
                        Container(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: Colors.grey[200])),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  child: Column(
                                    children: <Widget>[
                                      Text("Preperation", style: foodNameText),
                                      Text(recipe.prepMins.toString() + " mins",
                                          style: foodNameSubText),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: Colors.grey[200])),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  child: Column(
                                    children: <Widget>[
                                      Text("Ingredients", style: foodNameText),
                                      Text(recipe.ingredients.length.toString(),
                                          style: foodNameSubText),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: Colors.grey[200])),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  child: Column(
                                    children: <Widget>[
                                      Text("Calories", style: foodNameText),
                                      Text(recipe.calories.toString(),
                                          style: foodNameSubText),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 24,
                        ),
                        // Container for ingredient information
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildTextTitleVariation2('Ingredients', false),
                              buildTextSubTitleVariation1(getIngredients()),
                              SizedBox(
                                height: 16,
                              ),
                              buildTextTitleVariation2(
                                  'Recipe Directions', false),
                              buildTextSubTitleVariation1(getInstructions())
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label: Text('Watch Video'),
        icon: Icon(Icons.video_label_rounded),
        backgroundColor: Colors.pink,
      ),
    );
  }

  String getIngredients() {
    List<Ingredient> ingredients = recipe.ingredients;
    List<int> ingredientsQ = recipe.ingredientsQ;
    String found = "";

    for (int i = 0; i < ingredients.length - 1; i++) {
      found +=
          ingredientsQ[i].toString() + " " + ingredients[i].getName() + ", ";
    }

    found += ingredientsQ[ingredients.length - 1].toString() +
        " " +
        ingredients[ingredients.length - 1].getName();
    return found;
  }

  String getInstructions() {
    List<String> instructions = recipe.instructions;
    String found = "";

    for (int i = 0; i < instructions.length - 1; i++) {
      int currentStep = i + 1;
      found += "Step " +
          currentStep.toString() +
          "\n" +
          instructions[i].toString() +
          "\n\n";

      if (i == instructions.length - 1 - 1) {
        currentStep += 1;
        found += "Step " + currentStep.toString() + "\n";
      }
    }
    found += instructions[instructions.length - 1].toString();
    return found;
  }
}
