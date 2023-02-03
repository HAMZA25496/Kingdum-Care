
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kingdum_care/dashboard.dart';
import 'package:kingdum_care/meal/Custom_calender/calender_home.dart';
import 'package:kingdum_care/meal/Custom_calender/calender_weekly.dart';
import 'package:kingdum_care/meal/add-meal.dart';
import 'package:kingdum_care/meal/meal_tabbar.dart';

class MealsHome extends StatefulWidget {
  const MealsHome({Key? key}) : super(key: key);

  @override
  State<MealsHome> createState() => _MealsHomeState();
}

class _MealsHomeState extends State<MealsHome> {

  var selected = DateTime.now().weekday;
  DateTime pickedDate = DateTime.now();

  DateTime selectedDate = DateTime.now(); // TO tracking date
   DateTime initialDate = DateTime.now();
    int   lastDate = DateTime.now().weekday;

  int currentDateSelectedIndex =0; //For Horizontal Date
  ScrollController scrollController =
  ScrollController(); //To

   List listOfDays = ["Sat", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri",


   ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [

          Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Dashboard()));
              },
                  icon: const Icon(
                    Icons.keyboard_arrow_left, color: Color(0xFF00B925),
                    size: 30,)),
              const Center(
                child: Text("Meal",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Color(0xFF00B925),
                  ),
                ),
              ),
              const Text("Meal", style: TextStyle(color: Colors.transparent),),


            ],
          ),
        ),
        const SizedBox(height: 10,),
            Column(
              children:  [
                
                 // SingleChildScrollView(
                 //   child: SizedBox(
                 //       height:100,
                 //       width: size.width * 0.85,
                 //       child: CalenderHome(title: "H")),
                 // ),
                 
           //   To Show Current Date
                Container(
                    height: 30,
                    margin: EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(

                      selectedDate.day.toString() +
                          '-' +
                          DateFormat("MMM").format(selectedDate).toString() +
                          ', ' +
                          selectedDate.year.toString(),
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF00B925)),
                    )),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.0),
                  child: CalenderWeekly(),
                ),
                SizedBox(height: 10),
                //To show Calendar Widget
                // Padding(
                //   padding:  EdgeInsets.symmetric(horizontal: size.width/10),
                //   child: SizedBox(
                //         height: 40,
                //       child: ListView.separated(
                //         separatorBuilder: (BuildContext context, int index) {
                //           return SizedBox(width: 5);
                //         },
                //         itemCount: listOfDays.length,
                //         controller: scrollController,
                //         scrollDirection: Axis.horizontal,
                //         itemBuilder: (BuildContext context, int index) {
                //           return InkWell(
                //             onTap: () {
                //               setState(() {
                //                var changecolor =  selectedDate.difference(DateTime.now().subtract(const Duration(days: 3)))
                //                     .isNegative;
                //                 currentDateSelectedIndex = index;
                //                 selectedDate = DateTime.now().add(Duration(days: index));
                //               });
                //             },
                //             child: Container(
                //               height: 40,
                //               width: 36,
                //               alignment: Alignment.center,
                //               decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(8),
                //                   boxShadow: const [
                //                     BoxShadow(
                //                         color: Colors.grey,
                //                         offset: Offset(3, 3),
                //                         blurRadius: 5)
                //                   ],
                //                   color: currentDateSelectedIndex == index ?
                //                        Color(0xFF00B925)
                //                       : Color(0xFFE9E9E9)),
                //               child: Column(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 crossAxisAlignment: CrossAxisAlignment.center,
                //                 children: [
                //                   SizedBox(
                //                     height: 5,
                //                   ), Text(
                //                     listOfDays[DateTime.now()
                //                         .add(Duration(days: index))
                //                         .weekday -
                //                         1]
                //                         .toString(),
                //                     style: TextStyle(
                //                         fontSize: 10,
                //                         color: currentDateSelectedIndex == index
                //                             ? Colors.white
                //                             : Colors.grey),
                //                   ),
                //
                //
                //                   SizedBox(
                //                     height: 5,
                //                   ),
                //                   Text(
                //                     "${(pickedDate.add(Duration(days: ((1-selected)+index))).day)}",
                //                     style: TextStyle(
                //                         fontSize: 10,
                //                         fontWeight: FontWeight.w700,
                //                         color: currentDateSelectedIndex == index
                //                             ? Colors.white
                //                             : Colors.grey),
                //                   ),
                //
                //                 ],
                //               ),
                //             ),
                //           );
                //         },
                //       )),
                // ),
              ],
            ),

      // Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 37.0),
      //   child: SizedBox(
      //     height:40,
      //     child: ListView.separated(
      //       scrollDirection: Axis.horizontal,
      //         itemCount: 7,
      //         itemBuilder: (context, index) {
      //       return  Container(
      //         height:50,
      //         width: 40,
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(4),
      //           color: Color(0xFF00B925)
      //         ),
      //         child: Column(
      //           children: [
      //             Text(weeklyname[index].toString()),
      //             // Text(DateUtils.getDaysInMonth(month.year., month).toString())
      //           ],
      //         ),
      //       );
      //
      //     }, separatorBuilder: (BuildContext context, int index) {
      //         return const SizedBox(width: 8,);
      //     },
      //
      //     )),
      // ),
            const SizedBox(height: 30,),


      //   CalendarWeek(
      //     controller: CalendarWeekController(),
      //     height: 110,
      //     showMonth: true,
      //
      //
      //     onDatePressed: (DateTime datetime) {
      //       // Do something
      //     },
      //     onDateLongPressed: (DateTime datetime) {
      //       // Do something
      //     },
      //     onWeekChanged: () {
      //       // Do something
      //     },
      //     monthViewBuilder: (DateTime time) =>
      //         Align(
      //             alignment: FractionalOffset.center,
      //             child: Container(
      //             margin: const EdgeInsets.symmetric(vertical: 4),
      //             child: Column(
      //
      //               children: [
      //                 Text(
      //                   DateFormat.yMMMM().format(time),
      //                   style: TextStyle(
      //                       color: Colors.red, fontWeight: FontWeight.w600),
      //                 ),
      //               ],)),
      //   ),
      //   decorations: [
      //     // DecorationItem(
      //     //     decorationAlignment: FractionalOffset.bottomRight,
      //     //     date: DateTime.now(),
      //     //     decoration: Icon(
      //     //       Icons.today,
      //     //       color: Colors.blue,
      //     //     )),
      //     // DecorationItem(
      //     //     date: DateTime.now().add(Duration(days: 3)),
      //     //     decoration: Text(
      //     //       'Holiday',
      //     //       style: TextStyle(
      //     //         color: Colors.brown,
      //     //         fontWeight: FontWeight.w600,
      //     //       ),
      //     //     )),
      //   ],
      // ),

      SizedBox(
        // height: size.height ,
          child: MealTabbar())

      ],),
    ),


    ),
    floatingActionButton: SizedBox(
    height: 50,
    width: 50,

    child: FittedBox(
    child: FloatingActionButton(

    onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddMeal()));


    },
    backgroundColor: const Color(0xFF00B925)
    ,
    child: const Icon(Icons.add),
    ),
    )
    ,
    )
    ,
    );
  }
}
