// App Dependencies
import 'package:Procery/src/screens/mealplanner/MealPlanner.dart';
import 'package:Procery/src/screens/mealplanner/MealPlannerSelect.dart';
import 'package:Procery/src/screens/mealplanner/MealPlannerSelectRecipe.dart';
import 'package:Procery/src/screens/recipe/RecipeDetail.dart';
import 'package:Procery/src/services/PlannerRecordModel.dart';
import 'package:Procery/src/models/PlannerRecord.dart';
import 'package:Procery/src/models/Recipe.dart';
import 'package:Procery/src/data/MealPlannerData.dart';
import 'package:Procery/src/models/GroceryList.dart';
import 'package:Procery/src/services/GroceryListModel.dart';
import 'package:Procery/src/models/Purchase.dart';
import 'package:Procery/src/services/PurchaseModel.dart';

// Styles
import 'package:Procery/src/shared/styles.dart';
import 'MealPlannerConstants.dart';
import '../../screens/BaseWidgets.dart';

// External Library Dependencies
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../TimeCompare.dart';

// class mealplanner extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: mealplanner(),
//       theme: ThemeData(
//           fontFamily: 'Poppins'
//       ),
//     );
//   }
// }
class MealPlannerInitial extends StatefulWidget {
  @override
  _MealPlannerInitialState createState() => _MealPlannerInitialState();
  // static bool initialise = true;
}

class _MealPlannerInitialState extends State<MealPlannerInitial> {
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  PlannerRecordModel plannerRecordModel;
  GroceryListModel groceryListModel;
  PurchaseModel purchaseModel;

  @override
  Widget build(BuildContext context) {
    print('Refereshing Meal Planner State');
    context.watch<PlannerRecordModel>().plannerRecordList;
    DateTime today = _calendarController.selectedDay;

    if (today == null) {
      today = DateTime.now();
    }
    plannerRecordModel =
        Provider.of<PlannerRecordModel>(context, listen: false);
    groceryListModel = Provider.of<GroceryListModel>(context, listen: false);
    purchaseModel = Provider.of<PurchaseModel>(context, listen: false);
    List<List<PlannerRecord>> planForDay =
        retrievePlan(plannerRecordModel, today);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: getBaseBottomNavBar(context, 3),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 45, 0, 0),
            child: Text(
              "Meal",
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
            child: Text(
              "Planner",
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          TableCalendar(
            calendarController: _calendarController,
            initialSelectedDay: DateTime.now(),
            initialCalendarFormat: CalendarFormat.week,
            startingDayOfWeek: StartingDayOfWeek.monday,
            formatAnimation: FormatAnimation.slide,
            onDaySelected: (day, event, holidays) {
              setState(() {});
            },
            headerStyle: HeaderStyle(
              centerHeaderTitle: true,
              formatButtonVisible: false,
              titleTextStyle: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.greenAccent[700]),
              leftChevronIcon: Icon(
                Icons.arrow_back_ios,
                color: Colors.greenAccent[700],
                size: 15,
              ),
              rightChevronIcon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.greenAccent[700],
                size: 15,
              ),
              leftChevronMargin: EdgeInsets.only(left: 70),
              rightChevronMargin: EdgeInsets.only(right: 70),
            ),
            calendarStyle: CalendarStyle(
                selectedColor: Colors.greenAccent[700],
                weekendStyle: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
                weekdayStyle: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey)),
            daysOfWeekStyle: DaysOfWeekStyle(
                weekendStyle: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
                weekdayStyle: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                List<PlannerRecord> pRecord = planForDay[index];
                if (pRecord.length > 0) {
                  return buildPlanner(index, pRecord, today);
                } else {
                  return buildAddNewPlanView(index, today);
                }
              },
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
            ),
          )
        ],
      ),
    );
  }

  // Helper function to extract current day's meal plan records from database
  retrievePlan(PlannerRecordModel plannerRecordModel, DateTime day) {
    List<PlannerRecord> allRecords = plannerRecordModel.plannerRecordList;
    List<List<PlannerRecord>> dayPlan = [[], [], []];

    if (day == null) {
      return dayPlan;
    }

    for (int i = 0; i < allRecords.length; i++) {
      if (day.year == allRecords[i].date.year &&
          day.month == allRecords[i].date.month &&
          day.day == allRecords[i].date.day) {
        if (allRecords[i].meal == 'B') {
          dayPlan[0].add(allRecords[i]);
        }
        if (allRecords[i].meal == 'L') {
          dayPlan[1].add(allRecords[i]);
        }
        if (allRecords[i].meal == 'D') {
          dayPlan[2].add(allRecords[i]);
        }
      }
    }

    return dayPlan;
  }

  // Helper function to build the widget for each individual meal of the day
  Widget buildPlanner(int index, List<PlannerRecord> plan, DateTime today) {
    String meal;
    if (index == 0) {
      meal = "Breakfast";
    }
    if (index == 1) {
      meal = "Lunch";
    }
    if (index == 2) {
      meal = "Dinner";
    }

    return Container(
      height: 400,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        // boxShadow: [kBoxShadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(meal,
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MealPlannerSelect(day: today, meal: meal[0])),
                    );
                  },
                  icon: Icon(Icons.add_circle),
                  color: Colors.greenAccent[700])
            ],
          ),
          Expanded(
              child: ListView.builder(
            padding: EdgeInsets.only(left: 5),
            itemCount: plan.length,
            itemBuilder: (context, recInd) {
              Recipe rec = plan[recInd].recipe;
              return buildIndividualRecipeCard(rec, recInd, meal, today);
            },
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
          ))
        ],
      ),
    );
  }

  Widget buildIndividualRecipeCard(
      Recipe recipe, recInd, meal, DateTime today) {
    Color primaryColor;
    Color secondaryColor;

    if (meal == "Breakfast") {
      // primaryColor = hexToColor("#FA897B");
      // secondaryColor = hexToColor("#FFDD94");
      secondaryColor = hexToColor("#fbc78d");
      primaryColor = hexToColor("#FA7D82");
      // secondaryColor = hexToColor("#FFB295");
    } else if (meal == "Lunch") {
      primaryColor = hexToColor("#738AE6");
      // secondaryColor = hexToColor("#758eb7");
      secondaryColor = hexToColor("#A5CAD2");
      // secondaryColor = hexToColor("#5C5EDD");
    } else if (meal == "Dinner") {
      primaryColor = hexToColor("#bac94a");
      secondaryColor = hexToColor("#e2d36b");
      // primaryColor = hexToColor("#7DFAB7");
      // secondaryColor = hexToColor("#82FA7D");
    }
    return Container(
      width: 170,
      height: 300,
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
            top: 80,
            left: 20,
            child: Container(
              width: 150.0,
              height: 200.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end:
                      // Alignment(0.0, 0.0),
                      Alignment.bottomRight,
                  colors: <Color>[
                    primaryColor,
                    secondaryColor,
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(70.0),
                  bottomLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            child: Container(
              alignment: Alignment.topLeft,
              height: 300,
              width: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRect(
                clipBehavior: Clip.hardEdge,
                child: OverflowBox(
                  maxHeight: 90,
                  maxWidth: 90,
                  alignment: Alignment.topLeft,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            alignment: Alignment.topLeft,
                            image: AssetImage(recipe.image),
                            fit: BoxFit.cover,
                            colorFilter: new ColorFilter.mode(
                                Colors.black.withOpacity(0.85),
                                BlendMode.dstATop)),
                        //color: Colors.white.withOpacity(0.6),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 130,
            left: 50,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                meal,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 0.2,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: 160,
            left: 50,
            child: Container(
              width: 100,
              child: Text(
                recipe.name,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  letterSpacing: 0.2,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: 240,
            left: 50,
            child: Container(
              width: 150,
              child: Text(
                recipe.calories.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  letterSpacing: 0.2,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: 250,
            left: 100,
            child: Container(
              width: 150,
              child: Text(
                'kcal',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  letterSpacing: 0.2,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );

    // return Container(
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.all(
    //       Radius.circular(20),
    //     ),
    //     boxShadow: [kBoxShadow],
    //   ),
    //   margin: EdgeInsets.only(right: 10, left: 0, bottom: 10, top: 8),
    //   padding: EdgeInsets.all(10),
    //   width: 220,
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.stretch,
    //     children: <Widget>[
    //       GestureDetector(
    //           onTap: () {
    //             Navigator.push(
    //               context,
    //               MaterialPageRoute(
    //                   builder: (context) => RecipeDetail(recipe: recipe)),
    //             );
    //           },
    //           child: ClipRRect(
    //               borderRadius: BorderRadius.circular(8.0),
    //               child: Image(
    //                   image: AssetImage(recipe.image), fit: BoxFit.cover))),
    //       SizedBox(
    //         height: 8,
    //       ),
    //       buildRecipeTitle(recipe.name),
    //       buildTextSubTitleVariation2(recipe.description),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           buildCalories(recipe.prepMins.toString() + " mins"),
    //           IconButton(
    //             icon: Icon(Icons.delete_outline),
    //             iconSize: 20,
    //             onPressed: () {
    //               deleteRecipeInMealPlan(recipe, recInd, meal, today);
    //             },
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }

  // Helper function to build the overall day's meal plan
  Widget buildAddNewPlanView(int index, DateTime today) {
    String meal;
    if (index == 0) {
      meal = "Breakfast";
    }
    if (index == 1) {
      meal = "Lunch";
    }
    if (index == 2) {
      meal = "Dinner";
    }

    return Container(
        height: 110,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          // boxShadow: [kBoxShadow],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(meal,
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MealPlannerSelect(day: today, meal: meal[0])),
                      );
                    },
                    icon: Icon(Icons.add_circle),
                    color: Colors.greenAccent[700])
              ],
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text('Add a meal plan now!',
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey)),
                  ],
                )),
          ],
        ));
  }

  deleteRecipeInMealPlan(Recipe recipe, recInd, meal, DateTime today) {
    print(recInd.toString() + " " + meal + " " + today.toString());

    List<PlannerRecord> allPlans = plannerRecordModel.plannerRecordList;
    String mealkey = meal[0];
    int counter = 0;

    int toRemove;

    for (int i = 0; i < allPlans.length; i++) {
      if (allPlans[i].date.isSameDate(today)) {
        if (mealkey == allPlans[i].meal) {
          if (counter == recInd) {
            toRemove = i;
            break;
          } else {
            counter++;
          }
        }
      }
    }

    print('toRemove - ' + toRemove.toString());

    PlannerRecord removeRecord = allPlans[toRemove];
    List<Purchase> allPurchase = purchaseModel.purchaseList;
    GroceryList masterGL = groceryListModel.grocerylistList[0];
    print("remove purchase " + removeRecord.purchaseId.length.toString());
    for (int i = 0; i < removeRecord.purchaseId.length; i++) {
      print("III " + i.toString());
      for (int j = 0; j < allPurchase.length; j++) {
        if (allPurchase[j].id == removeRecord.purchaseId[i]) {
          allPurchase.removeAt(j);
          purchaseModel.deleteItem(j);
          print("AAA " + j.toString());
          break;
        }
      }

      for (int k = 0; k < masterGL.purchases.length; k++) {
        if (masterGL.purchases[k].id == removeRecord.purchaseId[i]) {
          masterGL.purchases.removeAt(k);
          print("BBB " + k.toString());
          break;
        }
      }
    }

    groceryListModel.updateItem(0, masterGL);
    plannerRecordModel.deleteItem(toRemove);
  }

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
