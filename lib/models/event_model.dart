import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  String? eventTitle;
  String? description;
  String? eventPlace;
  String? id;

  DateTime? startDate;
  DateTime? endDate;
  String? startTime;
  String? endTime;

  EventModel({
    this.eventTitle,
    this.description,
    this.eventPlace,
    this.id,
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
  });

  factory EventModel.fromJson(DocumentSnapshot json) => EventModel(
        id: json.id,
       eventTitle: json["eventTitle"],
       description: json["description"],
        eventPlace: json["eventPlace"],
        startDate: DateTime.fromMillisecondsSinceEpoch(json["startDate"].seconds * 1000),
        endDate: DateTime.fromMillisecondsSinceEpoch(json["endDate"].seconds * 1000), //json["EnrollmentDate"].toDateTime(),
        endTime: json["endTime"],
        startTime: json["startTime"],

      );

  Map<String, dynamic> tojson() {
    return {
      "eventTitle": eventTitle,
      "description": description,
      "startDate": startDate,
      "endDate": endDate,
      "startTime": startTime,
      "endTime": endTime,
      "eventPlace": eventPlace
    };
  }
}
