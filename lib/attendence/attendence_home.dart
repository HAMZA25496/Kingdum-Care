import 'package:flutter/material.dart';
import 'package:kingdum_care/attendence/attendence_dashboard.dart';

class AttendenceHome extends StatefulWidget {
  const AttendenceHome({Key? key}) : super(key: key);

  @override
  State<AttendenceHome> createState() => _AttendenceHomeState();
}

class _AttendenceHomeState extends State<AttendenceHome> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Padding(
            padding: EdgeInsets.only(left: 15, top: 10),
            child: Icon(
              Icons.keyboard_arrow_left,
              color: Color(0xFF0EAAF4),
              size: 25,
            ),
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(
            "Report",
            style: TextStyle(
              color: Color(0xFF0EAAF4),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 38,
          ),
          Center(
            child: Container(
              width: 250,
              height: 192,
              decoration: const BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage("images/report.png"))),
            ),
          ),
          const SizedBox(
            height: 38,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AttendenceDashboard()));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  width: double.infinity,
                  height: 76,
                  decoration: BoxDecoration(
                      color: const Color(0xFF0EAAF4),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 37,
                        height: 37,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/report1.png"))),
                      ),
                      const SizedBox(
                        width: 11,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text(
                          "ATTENDENCE REPORTS",
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
    );
  }
}
