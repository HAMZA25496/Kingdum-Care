
import 'package:flutter/material.dart';
import 'package:kingdum_care/attendence/attendence_list.dart';
class AttendenceCard extends StatelessWidget {
 // final String title;
 // final String subtitle;
 // final String subtitle2;
 //
 // final String image;
 // final Color  colour;
 // final String text;

 // AttendenceCard( @required this.title,@required this.subtitle,@required this.image,@required this.colour, this.text, this.subtitle2,);

  @override
  Widget build(BuildContext context) {
    return Container(
          width: double.infinity,
          height: 64,
          decoration: BoxDecoration(
            color:Colors.red,// const Color(0xFFF3F3F3),
            borderRadius: BorderRadius.circular(15.0),
          ),
      child: Card(
        elevation: 3,
        child: Row(
          children: [

            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(AttendenceList().attendenceReport[0]["image"].toString()),

            ),
             Column(
               children: [
                 Text(AttendenceList().attendenceReport[0]["title"].toString(),style: TextStyle(fontSize: 14),),
                 Row(
                   children: [
                     Text(AttendenceList().attendenceReport[0]["subtitle"].toString(),),
                     Text(AttendenceList().attendenceReport[0]["subtitle2"].toString(),),


                   ],
                 )

    ],
             ),
            Container(
              height: double.infinity,
              width: 64,
              color: AttendenceList().attendenceReport[0]["color"],
              child: Center(child: Text(AttendenceList().attendenceReport[0]["text"].toString()),),
            ),

          ],
        ),
      )
    );
  }
}
