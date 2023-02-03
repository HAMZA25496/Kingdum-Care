
import 'package:cloud_firestore/cloud_firestore.dart';

class MealModel {
  String? title;
  DateTime? date;
  String? time;
  String? id;
  String? mealType;

  MealModel({
    this.title,
    this.date,
    this.time,
    this.id,
    this.mealType

    ,

  });
  factory MealModel.fromJson(DocumentSnapshot json) => MealModel(
    id: json.id,
    title: json["title"],
    date: DateTime.fromMillisecondsSinceEpoch(json["date"].seconds * 1000),
    time: json["time"],
    mealType: json["mealType"],

  );
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "date": date,
      "id": id,
      "time" : time,
      "mealType": mealType,

    };
  }
}
