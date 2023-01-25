import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  Color colour;
  String? image;
  String? label;
  Color textColour;

  DashboardCard(@required this.colour,@required  this.label, @required this.textColour,@required  this.image,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 102,
          width: 131,
          decoration: BoxDecoration(
              color: colour!, borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image!),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  label!,
                  style: TextStyle(
                      fontSize: 16,
                      color: textColour,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
