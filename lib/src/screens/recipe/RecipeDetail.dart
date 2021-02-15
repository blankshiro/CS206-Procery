import 'package:flutter/material.dart';
import './RecipeConstants.dart';
import './RecipeData.dart';
import '../../shared/styles.dart';
import 'package:google_fonts/google_fonts.dart';

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
                            Text(
                              recipe.title,
                              style: GoogleFonts.poppins(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            IconButton(
                              icon: Icon(Icons.favorite),
                              color: Colors.redAccent,
                              iconSize: 30,
                              onPressed: () {},
                            )
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        // Ratings
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.grey[400],
                              size: 15,
                            ),
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
                                      Text(
                                        "Calories",
                                        style: GoogleFonts.roboto(
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        recipe.calories.toString(),
                                        style: GoogleFonts.roboto(
                                            color: Colors.grey[900],
                                            fontWeight: FontWeight.bold),
                                      ),
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
                                      Text(
                                        "Ingredients",
                                        style: GoogleFonts.roboto(
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "06",
                                        style: GoogleFonts.roboto(
                                            color: Colors.grey[900],
                                            fontWeight: FontWeight.bold),
                                      ),
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
                                      Text(
                                        "Time",
                                        style: GoogleFonts.roboto(
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "3 Hours",
                                        style: GoogleFonts.roboto(
                                            color: Colors.grey[900],
                                            fontWeight: FontWeight.bold),
                                      ),
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
                              buildTextSubTitleVariation1("2 cups white sugar"),
                              buildTextSubTitleVariation1(
                                  "1 ¾ cups all-purpose flour"),
                              buildTextSubTitleVariation1(
                                  "¾ cup unsweetened cocoa powder"),
                              buildTextSubTitleVariation1(
                                  "1 ½ teaspoons baking powder"),
                              buildTextSubTitleVariation1(
                                  "1 ½ teaspoons baking soda"),
                              buildTextSubTitleVariation1("1 teaspoon salt"),
                              buildTextSubTitleVariation1("2 eggs"),
                              buildTextSubTitleVariation1("1 cup milk"),
                              buildTextSubTitleVariation1(
                                  "½ cup vegetable oil"),
                              buildTextSubTitleVariation1(
                                  "2 teaspoons vanilla extract"),
                              buildTextSubTitleVariation1(
                                  "1 cup boiling water"),
                              SizedBox(
                                height: 16,
                              ),
                              buildTextTitleVariation2(
                                  'Recipe Directions', false),
                              buildTextSubTitleVariation1("STEP 1"),
                              buildTextSubTitleVariation1(
                                  "Preheat oven to 350 degrees F (175 degrees C). Grease and flour two nine inch round pans."),
                              buildTextSubTitleVariation1("STEP 2"),
                              buildTextSubTitleVariation1(
                                  "In a large bowl, stir together the sugar, flour, cocoa, baking powder, baking soda and salt. Add the eggs, milk, oil and vanilla, mix for 2 minutes on medium speed of mixer. Stir in the boiling water last. Batter will be thin. Pour evenly into the prepared pans."),
                              buildTextSubTitleVariation1("STEP 3"),
                              buildTextSubTitleVariation1(
                                  "Bake 30 to 35 minutes in the preheated oven, until the cake tests done with a toothpick. Cool in the pans for 10 minutes, then remove to a wire rack to cool completely."),
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
    );
  }
}
//     floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {},
//         backgroundColor: kPrimaryColor,
//         icon: Icon(
//           Icons.play_circle_fill,
//           color: Colors.white,
//           size: 32,
//         ),
//         label: Text(
//           "Watch Video",
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         )),
//   );
// }
