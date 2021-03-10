import 'package:Procery/src/screens/mealplanner/MealPlanner.dart';
import 'package:Procery/src/screens/mealplanner/MealPlannerSelectRecipe.dart';
import 'package:Procery/src/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   title: buildTextTitleVariation('Meal Plannerzzzxc'),
      // ),
      body: Column(
        children: [
          buildTextTitleVariation('Meal Planner'),
          TableCalendar(
            calendarController: _calendarController,
            initialCalendarFormat: CalendarFormat.week,
            startingDayOfWeek: StartingDayOfWeek.monday,
            formatAnimation: FormatAnimation.slide,
            headerStyle: HeaderStyle(
              centerHeaderTitle: true,
              formatButtonVisible: false,
              titleTextStyle: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.normal, color:Colors.green),
              leftChevronIcon: Icon(Icons.arrow_back_ios, color: Colors.green, size: 15,),
              rightChevronIcon: Icon(Icons.arrow_forward_ios, color: Colors.green, size: 15,),
              leftChevronMargin: EdgeInsets.only(left: 70),
              rightChevronMargin: EdgeInsets.only(right: 70),
            ),
            calendarStyle: CalendarStyle(
                weekendStyle: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.normal, color:Colors.grey),
                weekdayStyle:  GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.normal, color:Colors.grey)
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
                weekendStyle:  GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.normal, color:Colors.grey),
                weekdayStyle:  GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.normal, color:Colors.grey)
            ),
          ),
          Text('Breakfast', style: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.bold, color:Colors.black)),
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MealPlannerSelectRecipe()),
                    );},
                    icon: Icon(Icons.add_circle),
                    color: Colors.green
                  )
                ),
                Text('Add a meal plan now!', style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.normal, color:Colors.grey)),
              ],
            )
          ),
          Text('Lunch', style: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.bold, color:Colors.black)),
          Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Container(
                      padding: EdgeInsets.all(10.0),
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MealPlannerSelectRecipe()),
                            );},
                          icon: Icon(Icons.add_circle),
                          color: Colors.green
                      )

                    // Text('Breakfast', style: GoogleFonts.poppins(
                    //     fontSize: 22, fontWeight: FontWeight.bold, color:Colors.black))
                  ),
                  Text('Add a meal plan now!', style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.normal, color:Colors.grey)),
                ],
              )
            // child: Row(Container(
            //     padding: EdgeInsets.all(20.0),
            //     child: Text('Breakfast', style: TextStyle(
            //         fontFamily: 'Poppins',
            //         fontSize: 18,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.black),
            //         textAlign: TextAlign.left)),
            // ))
            //

          ),
          Text('Dinner', style: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.bold, color:Colors.black)),
          Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Container(
                      padding: EdgeInsets.all(10.0),
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MealPlannerSelectRecipe()),
                            );},
                          icon: Icon(Icons.add_circle),
                          color: Colors.green
                      )

                    // Text('Breakfast', style: GoogleFonts.poppins(
                    //     fontSize: 22, fontWeight: FontWeight.bold, color:Colors.black))
                  ),
                  Text('Add a meal plan now!', style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.normal, color:Colors.grey)),
                ],
              )
            // child: Row(Container(
            //     padding: EdgeInsets.all(20.0),
            //     child: Text('Breakfast', style: TextStyle(
            //         fontFamily: 'Poppins',
            //         fontSize: 18,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.black),
            //         textAlign: TextAlign.left)),
            // ))
            //

          ),
        ],
      ),
    );
  }
}

