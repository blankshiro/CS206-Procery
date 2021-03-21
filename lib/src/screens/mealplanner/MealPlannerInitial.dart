// App Dependencies
import 'package:Procery/src/screens/mealplanner/MealPlanner.dart';
import 'package:Procery/src/screens/mealplanner/MealPlannerSelect.dart';
import 'package:Procery/src/screens/mealplanner/MealPlannerSelectRecipe.dart';
import 'package:Procery/src/screens/recipe/RecipeDetail.dart';
import 'package:Procery/src/services/PlannerRecordModel.dart';
import 'package:Procery/src/models/PlannerRecord.dart';
import 'package:Procery/src/models/Recipe.dart';
import 'package:Procery/src/data/MealPlannerData.dart';
import 'package:Procery/src/shared/fryo_icons.dart';

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

  @override
  Widget build(BuildContext context) {
    context.watch<PlannerRecordModel>().getItem();
    return Consumer<PlannerRecordModel>(
        builder: (context, plannerRecordModel, child) {
      DateTime today = _calendarController.selectedDay;
      // if(MealPlannerInitial.initialise == true){
      //   loadSampleMealPlan(plannerRecordModel);
      //   MealPlannerInitial.initialise = false;
      //   print("Initialised Meal Planner Sample Data");
      // }
      List<List<PlannerRecord>> planForDay =
          retrievePlan(plannerRecordModel, today);

      return Scaffold(
        backgroundColor: Colors.white,
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
                    return buildPlanner(index, pRecord);
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
    });
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
  Widget buildPlanner(int index, List<PlannerRecord> plan) {
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
      height: 350,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
            itemBuilder: (context, index) {
              Recipe rec = plan[index].recipe;
              return buildIndividualRecipeCard(rec);
            },
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
          ))
        ],
      ),
    );
  }

  Widget buildIndividualRecipeCard(Recipe recipe) {
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
        margin: EdgeInsets.only(right: 10, left: 0, bottom: 10, top: 8),
        padding: EdgeInsets.all(10),
        width: 220,
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
                IconButton(
                  icon: Icon(Icons.delete_outline),
                  iconSize: 20,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
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
        height: 80,
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
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

  // void loadSampleMealPlan(PlannerRecordModel plannerRecordModel){
  //   deleteAllMealPlan(plannerRecordModel);
  //   List<PlannerRecord> toAdd = getPlannerRecords();
  //   for(int i = 0; i < toAdd.length; i++){
  //     plannerRecordModel.addItem(toAdd[i]);
  //
  //   }
  // }
  //
  // void deleteAllMealPlan(PlannerRecordModel plannerRecordModel){
  //   plannerRecordModel.deleteAll();
  // }

}
