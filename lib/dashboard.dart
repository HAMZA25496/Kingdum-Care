import 'package:flutter/material.dart';
import 'package:kingdum_care/Screens/families.dart';
import 'package:kingdum_care/attendence/attendence_home.dart';
import 'package:kingdum_care/dashboard_card.dart';
import 'package:kingdum_care/events/events_home.dart';
import 'package:kingdum_care/meal/meal_home.dart';
import 'package:kingdum_care/teachers/teacher_screen.dart';
import 'class/add_class.dart';

class Dashboard extends StatefulWidget {
   const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   title: Text("DashBoard", style: TextStyle(
      //     fontSize: 20.0,
      //     color: Color(0xFFFD2873),
      //   ),),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(""),
                      const Center(
                        child: Text(
                          "Dashboard",
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Color(0xFFFD2873),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.logout,
                            color: Color(0xFFFD2873),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    height: 50,
                    color: Colors.transparent,
                    child: Card(
                        elevation: 3,
                        // color: Constants.lightThemeColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                              size: 20,
                            ),
                            hintText: "search...",
                            hintStyle: TextStyle(color: Colors.black),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 15.0),
                            focusColor: Colors.red,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Families()));
                      },
                      child: SizedBox(
                          height: 102,
                          width: 131,
                          child: DashboardCard(
                            const Color(0xFFE4DAF9),
                            "Familes",
                            const Color(0xFF8950FC),
                            "images/families.png",
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EventsHome()));
                      },
                      child: SizedBox(
                          height: 102,
                          width: 131,
                          child: DashboardCard(
                            const Color(0xFFD7E7F8),
                            "Events",
                             const Color(0xFF117CDA),
                            "images/events.png",
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        height: 102,
                        width: 131,
                        child: DashboardCard(
                          const Color(0xFFDBF5F0),
                          "QR Code",
                          const Color(0xFF62C4B5),
                          "images/QR.png",
                        )),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  TeachersScreen()));
                      },
                      child: SizedBox(
                          height: 102,
                          width: 131,
                          child: DashboardCard(
                            const Color(0xFFCCFFD6),
                            "Teacher",
                            const Color(0xFF00B925),
                            "images/teacher.png",
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  AddClass()));
                      },
                      child: SizedBox(
                          height: 102,
                          width: 131,
                          child: DashboardCard(
                            const Color(0xFFFBE7E4),
                            "Class",
                            const Color(0xFFEA706F),
                            "images/class.png",
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MealsHome()));
                      },
                      child: SizedBox(
                          height: 102,
                          width: 131,
                          child: DashboardCard(
                            const Color(0xFFCCFFD6),
                            "Meal",
                            const Color(0xFF00B925),
                            "images/meal.png",
                          ),
                      ),
                    ),

                    // Container(
                    //     height: 102,
                    //     width: 131,
                    //     child: DashboardCard(Color(0xFFFBE7E4), "Class",
                    //         Color(0xFFEA706F), null, null)),
                  ],
                ),
                const SizedBox(
                  height: 38,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AttendenceHome()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      width: double.infinity,
                      height: 76,
                      decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Row(
                          children: [
                            Container(
                              width: 37,
                              height: 37,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage("images/training.png"))),
                            ),
                            const SizedBox(
                              width: 11,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Text(
                                "FACULTY REPORTS",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
