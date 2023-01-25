
import 'package:flutter/material.dart';

class StaffEventsHome extends StatefulWidget {
  const StaffEventsHome({Key? key}) : super(key: key);

  @override
  State<StaffEventsHome> createState() => _StaffEventsHomeState();
}

class _StaffEventsHomeState extends State<StaffEventsHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,),
          child: Column(
            children: [
              Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {
                    Navigator.pop(context);

                  }, icon: Icon(Icons.keyboard_arrow_left,color: Color(0xFF117CDA),size: 30,)),

                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text('Events',style: TextStyle(color: Color(0xFF117CDA),fontSize: 24),),
                  ),
                  Text("Add Parent",style: TextStyle(color: Colors.transparent)),


                ],
              ),





            ],


          ),
        ),
      ),

    );
  }
}
