import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealContainer extends StatefulWidget {
  String title;
  String image;
  Color selectedColour;
  Color selectedTextColour;
  // Color unSelectedColour;


  MealContainer(this.title,this.image,this.selectedColour,this.selectedTextColour,{Key? key}) : super(key: key);

  @override
  State<MealContainer> createState() => _MealContainerState();
}

class _MealContainerState extends State<MealContainer> {

  TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        // Added
        length: 2, // Added
        initialIndex: 0,
        child: SingleChildScrollView(
            child: Column(children: [
          Card(
            color: Colors.transparent,
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: widget.selectedColour,

                  borderRadius: BorderRadius.circular(10),
                  // border: Border.all(color: Color.fromRGBO(27, 189, 198, 1))
                ),
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Container(
                     height: 32,
                     width: 35,
                     decoration: BoxDecoration(
                       image: DecorationImage(
                         image: AssetImage(widget.image,)
                       )
                     ),
                   ),
                    Row( mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(widget.title,style: TextStyle(fontSize: 11,color: widget.selectedTextColour), ),
                      ],
                    )

                  ],
                )),
          ),
          SizedBox(
            height: 10,
          ),
        ])));
  }
}
