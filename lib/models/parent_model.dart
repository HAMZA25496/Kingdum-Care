import 'package:cloud_firestore/cloud_firestore.dart';

class ParentModel {
  String? id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? password;
  String? address;
  String? emergencyPin;
  String? profilePic;

  ParentModel({
    this.id,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.email,
    this.password,
    this.address,
    this.emergencyPin,
    this.profilePic
  });

  factory ParentModel.fromJson(DocumentSnapshot json) => ParentModel(
    id: json.id,
    firstName: json["firstName"],
    lastName: json["lastName"],
    phoneNumber: json["phoneNumber"],
    email: json["email"],
    password: json["password"],
    address: json["address"],
    emergencyPin: json["emergencyPin"],
      profilePic: json["profilePic"]

  );

  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "phoneNumber": phoneNumber,
      "password": password,
      "address": address,
      "emergencyPin": emergencyPin,
      "profilePic" : profilePic,

    };
  }
}
