import 'package:flutter/material.dart';
import 'package:kingdum_care/staff/staff_add_class.dart';
import 'package:kingdum_care/staff/staff_dashboard_container.dart';
import 'package:kingdum_care/staff/staff_event_home.dart';
import 'package:kingdum_care/staff/staff_teacher_home.dart';

import '../models/teacher_model.dart';

class StaffDashboard extends StatefulWidget {

  StaffDashboard({Key? key}) ;

  @override
  State<StaffDashboard> createState() => _StaffDashboardState();
}

class _StaffDashboardState extends State<StaffDashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(""),
                  Center(
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
                      icon: Icon(
                        Icons.logout,
                        color: Color(0xFFFD2873),
                      ))
                ],
              ),
              SizedBox(
                height: 10,
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
              SizedBox(
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
                              builder: (context) => StaffEventsHome()));
                    },
                    child: Container(
                        height: 102,
                        width: 131,
                        child: StaffDashboardCard(
                          Color(0xFFD7E7F8),
                          "Events",
                          Color(0xFF117CDA),
                          "images/events.png",
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StaffTeachersScreen()));
                    },
                    child: Container(
                        height: 102,
                        width: 131,
                        child: StaffDashboardCard(
                          Color(0xFFCCFFD6),
                          "Teachers",
                          Color(0xFF00B925),
                          "images/teacher.png",
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StaffAddClass()));
                      },
                      child: Container(
                        height: 102,
                        width: 131,
                        child: StaffDashboardCard(
                          Color(0xFFFBE7E4),
                          "Class",
                          Color(0xFFEA706F),
                          "images/class.png",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
