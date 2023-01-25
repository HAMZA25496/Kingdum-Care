import 'package:flutter/material.dart';
import 'package:kingdum_care/attendence/attendence_class_card.dart';

import 'attendence_report.dart';
class AttendenceDashboard extends StatelessWidget {
  const AttendenceDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Padding(
            padding: EdgeInsets.only(left:15,top: 10 ),
            child: Icon(Icons.keyboard_arrow_left,color: Color(0xFF0EAAF4),size: 25,),
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Text("Report",style: TextStyle(color: Color(0xFF0EAAF4),),),
        ),

      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
                     const SizedBox(height: 10,),
              Card(
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
                          vertical: 15.0, horizontal: 15.0),
                      focusColor: Colors.red,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    ),
                  )),

              const SizedBox(height: 30 ,),

              Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       InkWell(
                           onTap: ( )  {
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>const AttendenceReport()));

                           },
                           child: const AttendenceClassCard()),
                       const AttendenceClassCard(),

                     ],
                   ),
                  const SizedBox(height: 30 ,),
              Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  AttendenceClassCard(),
                  AttendenceClassCard(),

                ],
              ),
              const SizedBox(height: 30 ,),


              Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  AttendenceClassCard(),
                  AttendenceClassCard(),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
