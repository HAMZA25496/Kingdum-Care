import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:kingdum_care/staff/staff_dashboard.dart';
import '../models/teacher_model.dart';



class StaffTeachersScreen extends StatefulWidget {
  TeacherModel? teacherModel;

  @override
  State<StaffTeachersScreen> createState() => _StaffTeachersScreenState();
}

class _StaffTeachersScreenState extends State<StaffTeachersScreen> {
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
          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> StaffDashboard()));
                    }, icon: Icon(Icons.keyboard_arrow_left,color:Color(0xFF00B925),size: 30,)),

                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text('Teachers',style: TextStyle(color: Color(0xFF00B925),fontSize: 24),),
                    ),
                    Text("Add Parent",style: TextStyle(color: Colors.transparent)),


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
                teacherData == null
                    ? Center(child: CircularProgressIndicator())
                    : SizedBox(

                  height: size.height,
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    itemCount: teacherValue.length,
                    itemBuilder: ((context, index) {
                     // String delData = teacherData.id
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
                              teacherValue[index].profilePic.toString(),
                              width: 65,
                              height: 65,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Row(children: [
                            Text(teacherValue[index].firstName.toString(),
                              style:TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            SizedBox(width: 3,),
                            Text(teacherValue[index].lastName.toString(),
                              style:TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            )
                          ],

                          ),
                          subtitle: Text(teacherValue[index].department.toString(),
                            style:  TextStyle(
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
                                    const PopupMenuItem<int>(
                                      value: 0,
                                      child: Text("Edit"),
                                    ),
                                     PopupMenuItem<int>(
                                      value: 1,
                                      child: InkWell(
                                          onTap: () {



                                          },
                                          child: Text("Delete")),
                                    ),
                                  ];
                                },
                                onSelected: (value) {
                                  if (value == 0) {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             // AddTeachers()));
                                  } else if (value == 1) {
                                    setState(() {});
                                  }
                                }),
                          ),
                        ),
                      );
                    }),
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 20,
                      );
                    },
                  ),
                ),


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


    );
  }
}
