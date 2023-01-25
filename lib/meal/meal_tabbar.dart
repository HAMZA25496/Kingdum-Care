import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kingdum_care/meal/meal_container.dart';
import 'package:kingdum_care/meal/tomorrow/tomorrow_snacks_am.dart';
import 'package:kingdum_care/meal/tomorrow/tomorrow_meal_home.dart';
import 'package:kingdum_care/meal/weekly/weekly_meal.dart';
import 'package:kingdum_care/models/meal_model.dart';

enum Meal {
  snaks_am,
  lunch,
  snaks_pm,
}

class MealTabbar extends StatefulWidget {
  @override
  State<MealTabbar> createState() => _MealTabbarState();
}

class _MealTabbarState extends State<MealTabbar> {
  TabController? tabController;
  Meal? selectedMeal;
  MealModel? mealModel;
  QuerySnapshot? mealData;
  List<MealModel> mealValue = [];
  List<MealModel> snackAM = [];
  List<MealModel> lunch = [];
  List<MealModel> snackPM = [];


  Future<void> mealDataFromFirebase() async {
    mealData = await FirebaseFirestore.instance.collection("MealDetails").get();

    if (mealData!.docs.length > 0) {
      mealValue = [];

      Future.forEach(mealData!.docs, (element) {
        mealValue.add(MealModel.fromJson(element));
      });
      setState(() {});
    } else {
      mealValue = [];
      setState(() {});
    }

    if (mealData!.docs.length > 0) {
      await Future.forEach(mealData!.docs, (element) {
        if (element["mealType"] == "Snacks AM") {
          snackAM.add(MealModel.fromJson(element));
        } else if (element["mealType"] == "Lunch") {
          lunch.add(MealModel.fromJson(element));
        } else if (element["mealType"] == "Snacks PM") {
          snackPM.add(MealModel.fromJson(element));
        }
      }
      );
    }
  }
    @override
    void initState() {
      // TODO: implement initState
      mealDataFromFirebase();
      super.initState();
    }

    // bool unSelectedContainer = true;
    // bool unSelectedTextColour = true;
    // bool unSelectedContainer1 = true;
    // bool unSelectedTextColour1 = true;
    // bool unSelectedContainer2 = true;
    // bool unSelectedTextColour2 = true;

    @override
    Widget build(BuildContext context) {
      Size size = MediaQuery
          .of(context)
          .size;

      return DefaultTabController(

        // Added
          length: 2,
          // Added
          initialIndex: 0,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Card(
                    color: Colors.transparent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xFFF3F3F3),

                        borderRadius: BorderRadius.circular(10),
                        // border: Border.all(color: Color.fromRGBO(27, 189, 198, 1))
                      ),
                      child: TabBar(
                        controller: tabController,
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        labelColor: Color(0xFF00B925),
                        unselectedLabelColor: Color(0xFF00B925),
                        tabs: [
                          Tab(
                            text: 'Tomorrow',
                          ),
                          Tab(
                            text: 'Weekly',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: size.height,
                  width: size.width,
                  child: TabBarView(children: [
                    TomorrowMeal(),
                    WeeklyMeal(),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    //   child: SingleChildScrollView(
                    //     child: Column(
                    //       children: [
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment
                    //               .spaceEvenly,
                    //           children: [
                    //             InkWell(
                    //                 onTap: () {
                    //                   setState(() {
                    //                     selectedMeal = (Meal.snaks_am);
                    //                   });
                    //                 },
                    //                 child: MealContainer(
                    //                     "Snacks AM",
                    //                     selectedMeal == Meal.snaks_am
                    //                         ? "images/snacks_white.png"
                    //                         : "images/snaks_am.png",
                    //                     selectedMeal == Meal.snaks_am
                    //                         ? Color(0xFF00B925)
                    //                         : Color(0xFFCCFFD6),
                    //                     selectedMeal == Meal.snaks_am
                    //                         ? Colors.white
                    //                         : Colors.black)),
                    //             InkWell(
                    //                 onTap: () {
                    //                   setState(() {
                    //                     selectedMeal = (Meal.lunch);
                    //                   });
                    //                 },
                    //                 child: MealContainer(
                    //                     "Lunch",
                    //                     selectedMeal == Meal.lunch
                    //                         ? "images/lunch_white.png"
                    //                         : "images/lunch.png",
                    //                     selectedMeal == Meal.lunch
                    //                         ? Color(0xFF00B925)
                    //                         : Color(0xFFCCFFD6),
                    //                     selectedMeal == Meal.lunch
                    //                         ? Colors.white
                    //                         : Colors.black)),
                    //             InkWell(
                    //                 onTap: () {
                    //                   setState(() {
                    //                     selectedMeal = (Meal.snaks_pm);
                    //                   });
                    //                 },
                    //                 child: MealContainer(
                    //                     "Snacks PM",
                    //                     selectedMeal == Meal.snaks_pm
                    //                         ? "images/snacks_white.png"
                    //                         : "images/snaks_pm.png",
                    //                     selectedMeal == Meal.snaks_pm
                    //                         ? Color(0xFF00B925)
                    //                         : Color(0xFFCCFFD6),
                    //                     selectedMeal == Meal.snaks_pm
                    //                         ? Colors.white
                    //                         : Colors.black)),
                    //           ],
                    //         ),
                    //
                    //       ],
                    //     ),
                    //   ),
                    // ),

                     // Column(
                    //   children: [
                    //     Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //       children: [
                    //         InkWell(
                    //             onTap: () {
                    //               setState(() {
                    //                 selectedMeal = (Meal.snaks_am);
                    //               });
                    //             },
                    //             child: MealContainer(
                    //               "Snacks AM",
                    //               selectedMeal == Meal.snaks_am
                    //                   ? "images/snacks_white.png"
                    //                   : "images/snaks_am.png",
                    //               selectedMeal == Meal.snaks_am
                    //                   ? Color(0xFF00B925)
                    //                   : Color(0xFFCCFFD6),
                    //               selectedMeal == Meal.snaks_am
                    //                   ? Colors.white
                    //                   : Colors.black,
                    //             )),
                    //         InkWell(
                    //             onTap: () {
                    //               setState(() {
                    //                 selectedMeal = (Meal.lunch);
                    //               });
                    //             },
                    //             child: MealContainer(
                    //                 "Lunch",
                    //                 selectedMeal == Meal.lunch
                    //                     ? "images/lunch_white.png"
                    //                     : "images/lunch.png",
                    //                 selectedMeal == Meal.lunch
                    //                     ? Color(0xFF00B925)
                    //                     : Color(0xFFCCFFD6),
                    //                 selectedMeal == Meal.lunch
                    //                     ? Colors.white
                    //                     : Colors.black)),
                    //         InkWell(
                    //             onTap: () {
                    //               setState(() {
                    //                 selectedMeal = (Meal.snaks_pm);
                    //               });
                    //             },
                    //             child: MealContainer(
                    //                 "Snacks PM",
                    //                 selectedMeal == Meal.snaks_pm
                    //                     ? "images/snacks_white.png"
                    //                     : "images/snaks_pm.png",
                    //                 selectedMeal == Meal.snaks_pm
                    //                     ? Color(0xFF00B925)
                    //                     : Color(0xFFCCFFD6),
                    //                 selectedMeal == Meal.snaks_pm
                    //                     ? Colors.white
                    //                     : Colors.black)),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                  ]),
                ),
              ],
            ),
          ));
    }
  }


