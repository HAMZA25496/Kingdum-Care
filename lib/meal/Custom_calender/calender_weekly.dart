import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CalenderWeekly extends StatefulWidget {

  @override
  State<CalenderWeekly> createState() => _CalenderWeeklyState();
}

class _CalenderWeeklyState extends State<CalenderWeekly> {

  final weekList = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat','Sun'];
  final dayList = ['24', '25', '26', '27', '28', '29', '30'];

  //calender logic variables
  var selected = DateTime.now().weekday;
  DateTime pickedDate = DateTime.now();



  // DateTime pickedDate = DateTime.now();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   print("${pickedDate}");
  //   super.initState();
  //
  // }

  @override
  Widget build(BuildContext context) {
    print(selected);
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: ListView.separated(

          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              GestureDetector(
                // onTap: () => setState(()=> selected = index),
                child: Container(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(

                    color: selected == index+1?
                    Color(0xFF00B925):

                    selected  > index  ?
                    Color(0xFFE9E9E9):
                    Color(0xFFCCFFD6),

                    borderRadius: BorderRadius.circular(4),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0,0), // Shadow position
                      ),
                    ],
                  ),
                  height: 36,
                  width: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        weekList[index],
                        style: GoogleFonts.quicksand(
                          fontSize: 10,

                          color: selected == index +1?
                          Colors.white:
                          Colors.black ,

                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5,),
                      // Text(dayList[index],
                      //   style: GoogleFonts.quicksand(
                      //     fontSize: 10,
                      //     color: selected == index ?
                      //     Colors.white:
                      //     searchfield ,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),



                      //calender logic week base
                      Text("${(pickedDate.add(Duration(days: ((1-selected)+index))).day)}",
                        style: GoogleFonts.quicksand(
                          fontSize: 10,
                          color: selected == index+1 ?
                          Colors.white:
                          Colors.black ,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

          separatorBuilder: (_ , index)=>
          const SizedBox(width: 0,),
          itemCount: weekList.length),
    );
  }
}











