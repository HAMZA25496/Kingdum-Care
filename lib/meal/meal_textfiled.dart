import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class MealTextfield extends StatefulWidget {
 String? title;
 String? hint;
  Widget icon;
 MealTextfield(this.title,this.hint,this.icon);


  @override
  State<MealTextfield> createState() => _MealTextfieldState();
}

class _MealTextfieldState extends State<MealTextfield> {



  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

      ],
    );
  }
}
