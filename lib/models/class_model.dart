import 'package:cloud_firestore/cloud_firestore.dart';

class ClassModel {
  String? className;
  String? teacherName;
  String? id;
  String? teacher_id;

  ClassModel({
    this.className,
    this.teacherName,
    this.id,
    this.teacher_id,

  });
  factory ClassModel.fromJson(DocumentSnapshot json) => ClassModel(
        id: json.id,
        className: json["className"],
        teacherName: json["teacherName"],

      );
  Map<String, dynamic> tojson() {
    return {
      "className": className,
      "teacherName": teacherName,
      "id": id,
      "teacher_id" : teacher_id,

    };
  }
}
