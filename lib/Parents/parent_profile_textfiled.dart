import 'package:flutter/material.dart';

class ParentProfileTextfield extends StatelessWidget {
  String? labelText;
  String? hintText;
  bool? secureText;

  ParentProfileTextfield(@required this.labelText, @required this.hintText,this.secureText);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 7.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                labelText!,
                style: TextStyle(fontSize: 15.0, color: Colors.black54),
              ),
            ],
          ),
          TextField(
            enabled: false,
            obscureText: secureText!,
            decoration: InputDecoration(

                enabledBorder: UnderlineInputBorder(
                  //<-- SEE HERE
                  borderSide: BorderSide(width: 1, color: Color(0xFF8950FC)),
                ),
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
