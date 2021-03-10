import 'package:Procery/src/screens/mealplanner/MealPlanner.dart';
import 'package:Procery/src/shared/colors.dart';
import 'package:Procery/src/shared/fryo_icons.dart';
import 'package:Procery/src/shared/styles.dart';
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
          centerTitle: true,
          elevation: 0,
          backgroundColor: primaryColor,
          title:
          Text('Procery', style: logoWhiteStyle, textAlign: TextAlign.center),
          actions: <Widget>[
            IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              iconSize: 21,
              icon: Icon(Fryo.magnifier),
            ),
            IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              iconSize: 21,
              icon: Icon(Fryo.alarm),
            )
          ],
        ),
      body: Column(
        children: [
          buildTextTitleVariation('Browse Recipes'),
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

