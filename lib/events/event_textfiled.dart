import 'package:flutter/material.dart';

class EventAddTextfield extends StatelessWidget {
  String labelText;
  String hintText;
  var controller;

EventAddTextfield({
    required this.controller,
  required this.hintText,
  required this.labelText,
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 3.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                labelText,
                style: TextStyle(fontSize: 15.0, color: Colors.black),
              ),
            ],
          ),
          Card(
            elevation: 1,
            shadowColor: Color(0xFF117CDA),
            // shadowColor: Colors.lightBlue[300],
            shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Color(0xFF117CDA),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(10.0)),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.black54),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 10.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
