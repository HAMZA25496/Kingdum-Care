
import 'package:flutter/material.dart';
class AttendenceClassCard extends StatelessWidget {
  const AttendenceClassCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          width: 131,
      height: 102,
      decoration: BoxDecoration(
        color: const Color(0xFF0EAAF4),
        borderRadius: BorderRadius.circular(15),
        ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/class report.png"),
              )
            ),
      ),
          const SizedBox(height: 5.0,),

          const Text("Nursery",style: TextStyle(
            color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold

          ),),
        ],
      ),

    );
  }
}
