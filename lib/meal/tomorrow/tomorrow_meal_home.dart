import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kingdum_care/meal/tomorrow/tomorrow_lunch.dart';
import 'package:kingdum_care/meal/tomorrow/tomorrow_snacks_am.dart';
import 'package:kingdum_care/meal/tomorrow/tomorrow_snacks_pm.dart';

import '../../models/meal_model.dart';
import '../meal_container.dart';

enum Meal {
  snaks_am,
  lunch,
  snaks_pm,
}
class TomorrowMeal extends StatefulWidget {
  const TomorrowMeal({Key? key}) : super(key: key);

  @override
  State<TomorrowMeal> createState() => _TomorrowMealState();
}

class _TomorrowMealState extends State<TomorrowMeal> {
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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceEvenly,
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        selectedMeal = (Meal.snaks_am);
                      });
                    },
                    child: MealContainer(
                        "Snacks AM",
                        selectedMeal == Meal.snaks_am
                            ? "images/snacks_white.png"
                            : "images/snaks_am.png",
                        selectedMeal == Meal.snaks_am
                            ? Color(0xFF00B925)
                            : Color(0xFFCCFFD6),
                        selectedMeal == Meal.snaks_am
                            ? Colors.white
                            : Colors.black)),
                InkWell(
                    onTap: () {
                      setState(() {
                        selectedMeal = (Meal.lunch);
                      });
                    },
                    child: MealContainer(
                        "Lunch",
                        selectedMeal == Meal.lunch
                            ? "images/lunch_white.png"
                            : "images/lunch.png",
                        selectedMeal == Meal.lunch
                            ? Color(0xFF00B925)
                            : Color(0xFFCCFFD6),
                        selectedMeal == Meal.lunch
                            ? Colors.white
                            : Colors.black)),
                InkWell(
                    onTap: () {
                      setState(() {
                        selectedMeal = (Meal.snaks_pm);
                      });
                    },
                    child: MealContainer(
                        "Snacks PM",
                        selectedMeal == Meal.snaks_pm
                            ? "images/snacks_white.png"
                            : "images/snaks_pm.png",
                        selectedMeal == Meal.snaks_pm
                            ? Color(0xFF00B925)
                            : Color(0xFFCCFFD6),
                        selectedMeal == Meal.snaks_pm
                            ? Colors.white
                            : Colors.black)),
              ],
            ),

                     selectedMeal == Meal.snaks_am ? TomorrowSnacksAm(snacksAM: snackAM) :
                         selectedMeal == Meal.lunch ? TomorrowLunch(lunch: lunch) :
                         selectedMeal == Meal.snaks_pm ? TomorrowSnacksPM(snacksPM: snackPM) : Container()  ,

            // mealData == null
            //     ? CircularProgressIndicator()
            //     : snackAM.isEmpty
            //     ? Text("NO DATA FOUBD")
            //     : selectedMeal == Meal.snaks_am
            //     ? SnacksAm(snacksAM: snackAM)
            //     : Text("NO DATA FOUND"),
            //
            // mealData == null
            //     ? CircularProgressIndicator()
            //     : lunch.isEmpty
            //     ? Text("NO DATA FOUBD")
            //     : selectedMeal == Meal.lunch
            //     ? Lunch(lunch: lunch)
            //     : Text("NO DATA FOUND"),
            // mealData == null
            //     ? CircularProgressIndicator()
            //     : snackPM.isEmpty
            //     ? Text("NO DATA FOUBD")
            //     : selectedMeal == Meal.snaks_pm
            //     ? SnacksPM(snacksPM: snackPM)
            //     : Text("NO DATA FOUND")

          ],
        ),
      ),
    );
  }
}
