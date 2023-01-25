import 'package:flutter/material.dart';

class MealRadioButton extends StatefulWidget {
  String? value = "Snacks AM";

  MealRadioButton({ this.value,super.key});


  @override
  State<MealRadioButton> createState() => _MealRadioButtonState();
}

class _MealRadioButtonState extends State<MealRadioButton> {

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
          selectedRowColor: Colors.green,
        unselectedWidgetColor: Colors.green,

    ),
    child:Column(
      children: [

           Container(
             height: 40,
             child: RadioListTile(
          activeColor: Color(0xFF00B925),
              title: Text("Snaks AM"),
              value: "Snacks AM",
              groupValue: widget.value,
              onChanged: (value) {
                setState(() {
                  widget.value = value.toString();
                  print("Snaks AM SELETCD");

                });
              },
          ),
           ),

        Container(
          height: 40,
          child: RadioListTile(
            activeColor:Color(0xFF00B925),

            title: Text("Lunch"),
            value: "Lunch",
            groupValue: widget.value,
            onChanged: (value) {
              setState(() {
                widget.value = value.toString();
                print("LUNCH  SELETC");

              });
            },
          ),
        ),
        Container(
          height: 40,
          child: RadioListTile(
            activeColor:Color(0xFF00B925),

            title: Text("Snaks PM"),
            value: "Snacks PM",
            groupValue: widget.value,
            onChanged: (value) {
              setState(() {
                widget.value = value.toString();
                print("Snaks PM SELETC");
              });
            },
          ),
        ),

      ],


    )
    );
  }
}
