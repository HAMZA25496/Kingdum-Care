import 'package:cloud_firestore/cloud_firestore.dart';

class TeacherModel {
  String? firstName;
  String? lastName;
  String? department;
  String? id;
  String? profilePic;
  String? phoneNumber;
  String? email;
  String? password;
  String? address;

  TeacherModel({
    this.firstName,
    this.lastName,
    this.department,
    this.id,
    this.profilePic,
    this.phoneNumber,
    this.email,
    this.password,
    this.address,
  });

  factory TeacherModel.fromJson(DocumentSnapshot json) => TeacherModel(
        id: json.id,
        firstName: json["firstName"],
        lastName: json["lastName"],
        department: json["department"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        password: json["password"],
        address: json["address"],
        profilePic: json["profilePic"],
      );

  Map<String, dynamic> tojson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "profilepic": profilePic,
      "phoneNumber": phoneNumber,
      "password": password,
      "address": address,
      "profilePic": profilePic
    };
  }
}
