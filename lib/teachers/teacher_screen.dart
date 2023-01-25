import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kingdum_care/teachers/add_teachers.dart';
import '../models/teacher_model.dart';

class TeachersScreen extends StatefulWidget {
  @override
  State<TeachersScreen> createState() => _TeachersScreenState();
}

class _TeachersScreenState extends State<TeachersScreen> {
  TeacherModel? teacherModel;
  QuerySnapshot? teacherData;
  List<TeacherModel> teacherValue = [];

  Future<void> teacherDataFromFirebase() async {
    teacherData = await FirebaseFirestore.instance.collection("Teachers").get();
    if (teacherData!.docs.length > 0) {
      await Future.forEach(teacherData!.docs, (element) {
        teacherValue.add(TeacherModel.fromJson(element));
      });
      setState(() {});
    } else {
      teacherValue = [];
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    teacherDataFromFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.keyboard_arrow_left,
                          color: Color(0xFF00B925),
                          size: 30,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        'Teachers',
                        style:
                            TextStyle(color: Color(0xFF00B925), fontSize: 24),
                      ),
                    ),
                    Text("Add Parent",
                        style: TextStyle(color: Colors.transparent)),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Container(
                    height: 50,
                    color: Colors.transparent,
                    child: Card(
                        elevation: 3,
                        // color: Constants.lightThemeColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                              size: 20,
                            ),
                            hintText: "search...",
                            hintStyle: TextStyle(color: Colors.black),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 15.0),
                            focusColor: Colors.red,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                teacherData == null
                    ? CircularProgressIndicator()
                    : teacherValue.isEmpty
                        ? Text(" NO DATA FOUND")
                        : SizedBox(
                            height: size.height,
                            child: ListView.separated(
                              shrinkWrap: true,
                              padding: EdgeInsets.symmetric(vertical: 20),
                              itemCount: teacherValue.length,
                              itemBuilder: ((context, index) {
                                return Container(
                                  width: double.infinity,
                                  height: 64,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF00B925),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: ListTile(
                                    leading: ClipOval(
                                      child: Image.network(
                                        teacherValue[index]
                                            .profilePic
                                            .toString(),
                                        width: 40,
                                        height: 40,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    title: Row(
                                      children: [
                                        Text(
                                          teacherValue[index]
                                              .firstName
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          teacherValue[index]
                                              .lastName
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                        )
                                      ],
                                    ),
                                    subtitle: Text(
                                      teacherValue[index].department.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                    trailing: Transform.translate(
                                      offset: const Offset(16, 0),
                                      child: PopupMenuButton(
                                        // add icon, by default "3 dot" icon

                                        icon: const Icon(
                                          Icons.more_vert,
                                          color: Colors.white,
                                        ),
                                        itemBuilder: (context) {
                                          return [
                                            PopupMenuItem(
                                              value: 0,
                                              child: TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      AddTeachers(
                                                                        editClass:
                                                                            true,
                                                                        teacherModel:
                                                                            teacherValue[index],
                                                                      )));
                                                    });
                                                  },
                                                  child: Text("Edit")),
                                            ),
                                            PopupMenuItem(
                                              value: 1,
                                              child: TextButton(
                                                  onPressed: () {
                                                    try {
                                                      FirebaseFirestore.instance
                                                          .collection(
                                                              "Teachers")
                                                          .doc(teacherValue[
                                                                  index]
                                                              .id)
                                                          .delete();
                                                      teacherValue.remove(
                                                          teacherValue[index]);
                                                      Navigator.pop(context);
                                                      log("successfully DELETE : ${FirebaseFirestore.instance.collection("Teachers").doc(teacherValue[index].id)}");
                                                    } catch (e) {
                                                      log(e.toString());
                                                      Container(
                                                          child:
                                                              Text("NO Data"));
                                                      log("some Error Occured");
                                                    }
                                                    setState(() {});
                                                  },
                                                  child: Text("Delete")),
                                            )
                                          ];
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              }),
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  height: 20,
                                );
                              },
                            ),
                          )

                // TeachersCard("Alexa Demie", "Chemistry Department", "images/alexa.png"),
                // SizedBox(height: 25,),
                //
                // TeachersCard("Alex Martin", "Chemistry Department", "images/alex.png"),
                // SizedBox(height: 25,),
                // TeachersCard("Cassidy Tin", "Chemistry Department", "images/Cassidy.png"),
                // SizedBox(height: 25,),
                //
                // TeachersCard("Dr.Adam", "Chemistry Department", "images/adam.png"),
                // SizedBox(height: 25,),
                //
                // TeachersCard("Shweta Tripathi", "Chemistry Department", "images/Shweta.png"),
                // SizedBox(height: 25,),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF00B925),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddTeachers(
                        editClass: false,
                      )));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
