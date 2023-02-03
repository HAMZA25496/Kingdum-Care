// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// import '../models/parent_model.dart';
//
//
// class ParentContainer extends StatefulWidget {
//   ParentModel? parentModel;
//
//
//   ParentContainer({this.parentModel, Key? key}) : super(key: key);
//
//   @override
//   State<ParentContainer> createState() => _ParentContainerState();
// }
//
// class _ParentContainerState extends State<ParentContainer> {
//   List<ParentModel> parentValue = [];
//   QuerySnapshot? parentData;
//
//
//   Future<void> parentDataFromFirebase() async {
//     parentData = await FirebaseFirestore.instance.collection("Parents").get();
//     if (parentData!.docs.length > 0) {
//       parentValue = [];
//       Future.forEach(parentData!.docs, (element) {
//         parentValue.add(ParentModel.fromJson(element));
//       });
//       setState(() {
//
//       });
//     }
//
//     else {
//       parentValue = [];
//     }
//   }
//
//   @override
//   void initState() {
//     parentDataFromFirebase();
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery
//         .of(context)
//         .size;
//
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body:
//     );
//   }
// }