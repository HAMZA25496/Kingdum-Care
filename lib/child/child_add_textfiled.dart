import 'package:flutter/material.dart';

class ChildProfileTextfield extends StatelessWidget {

  String labelText;
  String hintText;
  bool? securePassword;

  ChildProfileTextfield(@required this.labelText, @required this.hintText,this.securePassword, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 3.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(labelText,style: TextStyle(fontSize: 15.0,color: Colors.black54),),
            ],
          ),
          Card(
            elevation: 5,
            shadowColor: Colors.blue,
            // shadowColor: Colors.lightBlue[300],
            shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Color(0xFF8950FC),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(10.0)


            ),
            child: TextField(
              obscureText: securePassword! ,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                contentPadding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
