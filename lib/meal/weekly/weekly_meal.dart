import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../models/meal_model.dart';
import '../meal_container.dart';

enum Meal {
  snaks_am,
  lunch,
  snaks_pm,
}
class WeeklyMeal extends StatefulWidget {
  const WeeklyMeal({Key? key}) : super(key: key);

  @override
  State<WeeklyMeal> createState() => _WeeklyMealState();
}

class _WeeklyMealState extends State<WeeklyMeal> {
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
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      : Colors.black,
                )),
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
      ],
    );
  }
}
