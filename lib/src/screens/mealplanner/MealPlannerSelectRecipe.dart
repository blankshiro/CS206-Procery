import 'package:Procery/src/screens/mealplanner/MealPlanner.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import '../shared/styles.dart';
// import '../shared/colors.dart';
// import '../shared/inputFields.dart';
import 'package:page_transition/page_transition.dart';
// import './unused/SignUpPage.dart';
// import './unused/Dashboard.dart';
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
class MealPlannerSelectRecipe extends StatefulWidget {
  @override
  _MealPlannerSelectRecipeState createState() => _MealPlannerSelectRecipeState();
}

class _MealPlannerSelectRecipeState extends State<MealPlannerSelectRecipe> {
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Browse Recipes", style: GoogleFonts.poppins(
            fontSize: 22, fontWeight: FontWeight.bold, color:Colors.black),
        ),
      ),
      body: Column(
        children: [
          Text('TO BE CONFIRMED, this is a sample page', style: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.bold, color:Colors.black)),
          Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Container(
                      padding: EdgeInsets.all(10.0),
                      child: RaisedButton(
                        onPressed: () {Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MealPlanner()),
                        );},
                        child: Text('Recipe user want to add'),
                      )
                  ),

                ],
              )

          ),
        ],
      ),
    );
  }
}

