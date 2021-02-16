import 'package:flutter/material.dart';
// import '../shared/styles.dart';
// import '../shared/colors.dart';
// import '../shared/inputFields.dart';
import 'package:page_transition/page_transition.dart';
// import './unused/SignUpPage.dart';
// import './unused/Dashboard.dart';
import 'package:table_calendar/table_calendar.dart';

class mealplanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: mealplanner(),
      theme: ThemeData(
          fontFamily: 'Poppins'
      ),
    );
  }
}
class MealPlanner extends StatefulWidget {
  @override
  _MealPlannerState createState() => _MealPlannerState();
}

class _MealPlannerState extends State<MealPlanner> {
  CalendarController _calendarController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _calendarController = CalendarController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
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
        title: Text("Meal Planner", style: TextStyle(
            color: Colors.black
        ),),
      ),
      body: Column(
        children: [
          TableCalendar(
            calendarController: _calendarController,
            initialCalendarFormat: CalendarFormat.week,
            startingDayOfWeek: StartingDayOfWeek.monday,
            formatAnimation: FormatAnimation.slide,
            headerStyle: HeaderStyle(
              centerHeaderTitle: true,
              formatButtonVisible: false,
              titleTextStyle: TextStyle(
                  color: Colors.green,
                  fontSize: 16
              ),
              leftChevronIcon: Icon(Icons.arrow_back_ios, color: Colors.green, size: 15,),
              rightChevronIcon: Icon(Icons.arrow_forward_ios, color: Colors.green, size: 15,),
              leftChevronMargin: EdgeInsets.only(left: 70),
              rightChevronMargin: EdgeInsets.only(right: 70),
            ),
            calendarStyle: CalendarStyle(
                weekendStyle: TextStyle(
                    color: Colors.grey
                ),
                weekdayStyle: TextStyle(
                    color: Colors.grey
                )
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
                weekendStyle: TextStyle(
                    color: Colors.grey
                ),
                weekdayStyle: TextStyle(
                    color: Colors.grey
                )
            ),
          ),
          SizedBox(height: 5,),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                  color: Colors.green
              ),
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Today's Meal Plans", style: TextStyle(
                              color: Colors.black,
                          ),)
                        ],
                      ),
                      SizedBox(height: 15,),
                      Column(
                        children: [
                          dayTask("Breakfast", "Croissant"),
                          dayTask("Lunch", "Chocolate Cake"),
                          dayTask("Dinner", "Waffles"),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Row dayTask(String time, String name)
  {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width*0.3,
          child: Text(time, style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ), textAlign: TextAlign.right,),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.all(10),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700
                ),),
                SizedBox(height: 5,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.access_time_outlined, color: Colors.black,),
                    SizedBox(width: 5,),
                    Text("10 min", style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w600
                    ),)
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.whatshot, color: Colors.black,),
                    SizedBox(width: 5,),
                    Text('200 calories', style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w600
                    ),)
                  ],
                ),
                // SizedBox(
                //   height: 15,
                // ),
                // Row(
                //   children: [
                //     Icon(Icons.whatshot, color: Colors.black,),
                //     SizedBox(width: 5,),
                //     Icon(Icons.access_time, color: Colors.black,),
                //     Expanded(
                //       child: Container(),
                //     ),
                //     Text("\$50", style: TextStyle(
                //         color: Colors.black,
                //         fontSize: 16,
                //         fontWeight: FontWeight.w600
                //     ),)
                //   ],
                // )

              ],
            ),
          ),
        )
      ],
    );
  }
}

