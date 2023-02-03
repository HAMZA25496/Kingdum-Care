// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:kingdum_care/models/class_model.dart';
// import 'package:kingdum_care/models/teacher_model.dart';
//
//
// class AddClasses extends StatefulWidget {
//   bool editClass;
//   ClassModel classModel;
//
//   AddClasses({required this.editClass, required this.classModel}) ;
//
//   @override
//   State<AddClasses> createState() => _AddClassesState();
// }
//
// class _AddClassesState extends State<AddClasses> {
//   Color   bgRed1 = Color(0xFFEA706F);
//
//    QuerySnapshot? teacherData;
//    TeacherModel? teacherModel;
//   List<TeacherModel> teacherValue = [];
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     teacherDataFromFirebase();
//     super.initState();
//   }
//
//   Future<void> teacherDataFromFirebase() async {
//     teacherData =
//     await FirebaseFirestore.instance.collection("AddTeacher").get();
//     if (teacherData!.docs.length > 0) {
//       await Future.forEach(teacherData!.docs, (element) {
//         teacherValue.add(TeacherModel.fromJson(element));
//       });
//       setState(() {});
//     }
//   }
//
//   // Initial Selected Value
//   int dropdownvalue = 0;
//
//   TextEditingController className = TextEditingController();
//
//   // List of items in our dropdown menu
//   var items = [];
//   final _formKey = GlobalKey<FormState>();
//   bool loading = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Container(
//             padding: EdgeInsets.symmetric(horizontal: 30),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 30,
//                 ),
//                 widget.editClass
//                     ? Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     InkWell(
//                         onTap: () {
//                           Navigator.pop(context);
//                           Navigator.pop(context);
//
//                         },
//                         child: Icon(
//                           Icons.arrow_back_ios_sharp,
//                           color: bgRed1,
//                         )),
//                     Text(
//                       "Add Class",
//                       style: GoogleFonts.quicksand(
//                         fontSize: 24,
//                         color: bgRed1,
//                       ),
//                     ),
//                     PopupMenuButton(
//                         shape: ContinuousRectangleBorder(
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         icon: Icon(
//                           Icons.more_vert,
//                           size: 24,
//                           color: bgRed1,
//                         ),
//                         itemBuilder: (context) => [
//                           PopupMenuItem(
//                             value: 1,
//                             child: TextButton(
//                               child: Text(
//                                 "Delete",
//                                 style: GoogleFonts.quicksand(
//                                   // color: bgBlue1,
//                                 ),
//                               ),
//                               onPressed: () async {
//                                 print(widget.classModel.id);
//
//                                 await FirebaseFirestore.instance
//                                     .collection("AddClass")
//                                     .doc(widget.classModel.id)
//                                     .delete();
//
//                                 Navigator.pop(context);
//                                 Navigator.pop(context);
//                                 Navigator.pop(context);
//                                 Navigator.pop(context);
//                                 Navigator.pop(context);
//
//                                 // Navigator.push(
//                                 //   context,
//                                 //   MaterialPageRoute(
//                                 //       builder: (context) =>
//                                 //           AllClasses()),
//                                 // );
//                               },
//                             ),
//                           ),
//                         ]),
//                   ],
//                 )
//                     : Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     InkWell(
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                         child: Icon(
//                           Icons.arrow_back_ios_sharp,
//                           color: bgRed1,
//                         )),
//                     Text(
//                       "Add Class",
//                       style: GoogleFonts.quicksand(
//                         fontSize: 24,
//                         color: bgRed1,
//                       ),
//                     ),
//                     Container(),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       children: [
//                         //class name
//                         Align(
//                           alignment: Alignment.topLeft,
//                           child: Padding(
//                             padding: const EdgeInsets.only(right: 32.0),
//                             child: Text(
//                               "Class Name",
//                               style: GoogleFonts.quicksand(
//                                 fontSize: 12,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 8,
//                         ),
//                         TextFormField(
//                           controller: className,
//                           decoration: InputDecoration(
//                             hintText: "KG-1",
//                             hintStyle: GoogleFonts.quicksand(
//                                 fontSize: 14, color: Colors.black38),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(16.0),
//                               borderSide: BorderSide(color: bgRed1),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: bgRed1),
//                             ),
//                           ),
//
//                           // The validator receives the text that the user has entered.
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter Your Class Name';
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//
//                         //Select CLass
//                         Align(
//                           alignment: Alignment.topLeft,
//                           child: Padding(
//                             padding: const EdgeInsets.only(right: 32.0),
//                             child: Text(
//                               "Teacher Name",
//                               style: GoogleFonts.quicksand(
//                                 fontSize: 12,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 8,
//                         ),
//
//                         Container(
//                           padding: EdgeInsets.symmetric(horizontal: 10),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(12),
//                             color: Colors.white,
//                             border: Border.all(
//                               color: bgRed1,
//                             ),
//                           ),
//                           child: DropdownButtonFormField(
//                             decoration: InputDecoration(
//                               enabledBorder: InputBorder.none,
//                               focusedBorder: InputBorder.none,
//                             ),
//
//                             // UnderlineInputBorder(
//                             //     borderSide: BorderSide(color: Colors.white))),
//
//                             isExpanded: true,
//                             hint: Text(
//                               "Teachers",
//                               style: GoogleFonts.quicksand(),
//                             ),
//
//                             // Initial Value
//                             value: dropdownvalue,
//                             // Down Arrow Icon
//                             icon: Icon(
//                               Icons.keyboard_arrow_down,
//                               color: bgRed1,
//                               size: 32,
//                             ),
//
//                             // Array list of items
//                             items: teacherValue.map((TeacherModel items) {
//                               return DropdownMenuItem(
//                                 value: teacherValue.indexOf(items),
//                                 child: Text(
//                                     "${items.firstName} ${items.lastName}"),
//                               );
//                             }).toList(),
//                             // After selecting the desired option,it will
//                             // change button value to selected value
//                             onChanged: (int?  newValue) {
//                               setState(() {
//                                 dropdownvalue = newValue!;
//                               });
//                             },
//                           ),
//                           height: 55,
//                           width: MediaQuery.of(context).size.width * 0.85,
//                         ),
//                         SizedBox(
//                           height: 30,
//                         ),
//
//                         widget.editClass
//                             ?
//                         //submit Button
//                         loading
//                             ? CircularProgressIndicator()
//                             : InkWell(
//                           onTap: () async {
//                             setState(() {
//                               loading = true;
//                             });
//                             if (!_formKey.currentState!.validate()) {
//                               return;
//                             }
//                             else {
//                               await FirebaseFirestore.instance
//                                   .collection('AddClass').doc(widget.classModel.id)
//                                   .update({
//                                 "ClassName": className.text,
//                                 "Teachername":
//                                 "${teacherValue[dropdownvalue].firstName} "
//                                     "${teacherValue[dropdownvalue].lastName}",
//                                 "teacher_id":
//                                 teacherValue[dropdownvalue].id,
//                               });
//                             }
//                             setState(() {
//                               loading = false;
//                             });
//
//                             Navigator.pop(context);
//                             Navigator.pop(context);
//
//                             // Navigator.push(
//                             //   context,
//                             //   MaterialPageRoute(
//                             //       builder: (context) => AllClasses()),
//                             // );
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: bgRed1,
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 "UPDATE",
//                                 style: GoogleFonts.quicksand(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                             height: 50,
//                             width: MediaQuery.of(context).size.width *
//                                 0.85,
//                           ),
//                         )
//                             : loading
//                             ? CircularProgressIndicator()
//                             : InkWell(
//                           onTap: () async {
//                             setState(() {
//                               loading = true;
//                             });
//                             if (!_formKey.currentState!.validate()) {
//                               return;
//                             } else {
//                               await FirebaseFirestore.instance
//                                   .collection('AddClass')
//                                   .add({
//                                 "ClassName": className.text,
//                                 "Teachername":
//                                 "${teacherValue[dropdownvalue].firstName} "
//                                     "${teacherValue[dropdownvalue].lastName}",
//                                 "teacher_id":
//                                 teacherValue[dropdownvalue].id,
//                               });
//                             }
//                             setState(() {
//                               loading = false;
//                             });
//                             Navigator.pop(context);
//                             Navigator.pop(context);
//
//                             // Navigator.push(
//                             //   context,
//                             //   MaterialPageRoute(
//                             //       builder: (context) => AllClasses()),
//                             // );
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: bgRed1,
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 "ADD",
//                                 style: GoogleFonts.quicksand(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                             height: 50,
//                             width: MediaQuery.of(context).size.width *
//                                 0.85,
//                           ),
//                         ),
//
//                         SizedBox(
//                           height: 40,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
