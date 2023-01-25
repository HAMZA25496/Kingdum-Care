import 'package:flutter/material.dart';
import 'package:kingdum_care/attendence/attendence_tab_bar.dart';


class AttendenceReport extends StatefulWidget {

  const AttendenceReport({Key? key,}) : super(key: key);

  @override
  State<AttendenceReport> createState() => _AttendenceReportState();
}

class _AttendenceReportState extends State<AttendenceReport> {
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
        actions: [
          IconButton(onPressed: (){
          }
              , icon: const Icon(Icons.search)
          ),
        ],
      ),

      body: Column(
        children: const [
               Expanded(child: AttendenceTabBar()),


        ],
      ),

    );
  }
}
