import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingdum_care/class/add_class.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../models/class_model.dart';
import '../models/teacher_model.dart';

class SelectClass extends StatefulWidget {
  ClassModel? classModel;
  bool editClass = false;

  SelectClass({required this.editClass, this.classModel, super.key});

// SelectClass({Key? key, required this.editClass, this.classModel}) : super(key: key);

  @override
  State<SelectClass> createState() => _SelectClassState();
}

class _SelectClassState extends State<SelectClass> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Color bgRed1 = Color(0xFFEA706F);
  bool showSpinner = false;
  TextEditingController teacherController = TextEditingController();
  TextEditingController classController = TextEditingController();
  QuerySnapshot? teacherData;
  TeacherModel? teacherModel;
  List<TeacherModel> teacherValue = [];

  Future<void> teacherDataFromFirebase() async {
    teacherData = await FirebaseFirestore.instance.collection("Teachers").get();
    if (teacherData!.docs.length > 0) {
      await Future.forEach(teacherData!.docs, (element) {
        teacherValue.add(TeacherModel.fromJson(element));
      });
      setState(() {});
    }
  }

  // Initial Selected Value
  int dropdownvalue = 0;
  var teachers = [];

  @override
  void initState() {
    // TODO: implement initState
    teacherDataFromFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Form(
          key: _formKey,
          child: Scaffold(
              body: SafeArea(
                  child: SingleChildScrollView(
                      child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                child: widget.editClass
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.keyboard_arrow_left,
                                size: 30,
                                color: Color(0xFFEA706F),
                              )),
                          Text(
                            "Edit Class",
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Color(0xFFEA706F),
                            ),
                          ),
                          Text("       "),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.keyboard_arrow_left,
                                size: 30,
                                color: Color(0xFFEA706F),
                              )),
                          Text(
                            "Add Class",
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Color(0xFFEA706F),
                            ),
                          ),
                          Text("       "),
                        ],
                      ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 3.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Class Name",
                          style:
                              TextStyle(fontSize: 15.0, color: Colors.black54),
                        ),
                      ],
                    ),
                    Card(
                      elevation: 5,
                      // shadowColor: Colors.blue,
                      // shadowColor: Colors.lightBlue[300],
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Color(0xFFEA706F),
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: TextFormField(
                          controller: classController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Class",
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please define class first';
                            }
                          }),
                    ),
                    Row(
                      children: [
                        Text(
                          "Teachers",
                          style:
                              TextStyle(fontSize: 15.0, color: Colors.black54),
                        ),
                      ],
                    ),
                    // Card(
                    //     elevation: 5,
                    //     // shadowColor: Colors.blue,
                    //     // shadowColor: Colors.lightBlue[300],
                    //     shape: RoundedRectangleBorder(
                    //         side: BorderSide(
                    //           color: Color(0xFFEA706F),
                    //           width: 1.5,
                    //         ),
                    //         borderRadius: BorderRadius.circular(10.0)),
                    //     child:TextFormField(
                    //
                    //         controller: teacherController,
                    //       decoration: InputDecoration(
                    //         contentPadding: EdgeInsets.all(10),
                    //
                    //         border: InputBorder.none,
                    //        hintText:  "Teachers" ,
                    //        suffixIcon: PopupMenuButton<String>(
                    //           icon: const Icon(Icons.arrow_drop_down),
                    //           onSelected: (String value) {
                    //             teacherController.text = value;
                    //           },
                    //           itemBuilder: (BuildContext context) {
                    //             return teachers
                    //                 .map<PopupMenuItem<String>>((String value) {
                    //               return new PopupMenuItem(
                    //                   child:  Text(value), value: value);
                    //             }).toList();
                    //           },
                    //         ),
                    //       ),
                    //
                    //     ),
                    //
                    // ),
                    Card(
                      elevation: 5,
                      // shadowColor: Colors.blue,
                      // shadowColor: Colors.lightBlue[300],
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Color(0xFFEA706F),
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),

                        // UnderlineInputBorder(
                        //     borderSide: BorderSide(color: Colors.white))),

                        isExpanded: true,
                        hint: Text(
                          "Teachers",
                          style: GoogleFonts.quicksand(),
                        ),

                        // Initial Value
                        value: dropdownvalue,
                        // Down Arrow Icon
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: bgRed1,
                          size: 32,
                        ),

                        // Array list of items
                        items: teacherValue.map((TeacherModel teachers) {
                          return DropdownMenuItem(
                            value: teacherValue.indexOf(teachers),
                            child: Text(
                                "${teachers.firstName} ${teachers.lastName}"),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (int? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              widget.editClass == false
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFEA706F),
                          ),
                          onPressed: () async {
                            setState(() {
                              showSpinner = true;
                            });
                            if (_formKey.currentState!.validate()) {
                              await FirebaseFirestore.instance
                                  .collection('Classes')
                                  .add({
                                "className": classController.text,
                                "teacherName":
                                    "${teacherValue[dropdownvalue].firstName} "
                                        "${teacherValue[dropdownvalue].lastName}",
                                "teacher_id": teacherValue[dropdownvalue].id,
                              });
                              setState(() {
                                showSpinner = false;
                                classController.text = "";
                                teacherController.text = "";
                              });

                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddClass()));

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Class Add Successfully"),
                                  backgroundColor: Colors.green[900],
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Something Went Wrong"),
                                  backgroundColor: Colors.red[900],
                                ),
                              );
                              setState(() {
                                showSpinner = false;
                              });
                            }
                          },
                          child: Text("Submit"),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFEA706F),
                          ),
                          onPressed: () async {
                            setState(() {
                              showSpinner = true;
                            });
                            if (_formKey.currentState!.validate()) {
                              await FirebaseFirestore.instance
                                  .collection('Classes')
                                  .doc(widget.classModel!.id)
                                  .update({
                                "className": classController.text,
                                "teacherName":
                                    "${teacherValue[dropdownvalue].firstName} "
                                        "${teacherValue[dropdownvalue].lastName}",
                                "teacher_id": teacherValue[dropdownvalue].id,
                              });
                              setState(() {
                                showSpinner = false;
                                classController.text = "";
                                teacherController.text = "";
                              });

                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddClass()));

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Class Add Successfully"),
                                  backgroundColor: Colors.green[900],
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Something Went Wrong"),
                                  backgroundColor: Colors.red[900],
                                ),
                              );
                              setState(() {
                                showSpinner = false;
                              });
                            }
                          },
                          child: Text("UPDATE"),
                        ),
                      ),
                    ),
              SizedBox(
                height: 20,
              ),
              // Card(
              //   color: Colors.deepOrange,
              //   child: SizedBox(
              //     height: size.height,
              //     width: double.infinity,
              //     child: StreamBuilder<QuerySnapshot>(
              //     stream: FirebaseFirestore.instance.collection('Classes').snapshots(),
              //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              //       if (!snapshot.hasData) return  Text('Loading...',style: TextStyle(fontSize: 30,color:Colors.white));
              //       return  ListView(
              //         children: snapshot.data!.docs.map((DocumentSnapshot snapshot) {
              //           return ListTile(
              //             title: Text(snapshot['className'],style: TextStyle(fontSize: 30,color:Colors.white)),
              //             subtitle: Text(snapshot['teacherName'],style: TextStyle(fontSize: 20,),),
              //           );
              //
              //         }).toList(),
              //       );
              //     }
              //     ),
              //   ),
              // )
            ],
          ))))),
    );
  }
}
// TextField(
// controller: teacherController,
// decoration: InputDecoration(
//
// border: InputBorder.none,
// contentPadding: EdgeInsets.symmetric(
// horizontal: 15.0,
// vertical: 10.0,
// ),
// suffixIcon:       Padding(
// padding: const EdgeInsets.only(right: 5),
// child: DropdownButtonHideUnderline(
// child: DropdownButton(
// hint: teacherController.text == null
// ? Padding(
// padding: const EdgeInsets.only(left: 10.0),
// child: Text('Joffery Baratheon'),
// )
// : Padding(
// padding: const EdgeInsets.only(left: 10.0),
// child: Text(
// teacherController.text,
// style: TextStyle(color: Colors.black),
// ),
// ),
// isExpanded: true,
// elevation: 0,
// icon: Icon(Icons.keyboard_arrow_down,size: 30,color: Color(0xFFEA706F),),
// style: TextStyle(color: Colors.black),
// items: ['Alexa Demie' ," Dr.Adam", 'Shweta', "Cassie Tin","Alex Martin"].map(
// (val) {
// return DropdownMenuItem<String>(
// value: val,
// child: Text(val),
// );
// },
// ).toList(),
// onChanged: ( val) {
// setState(
// () {
// teacherController.text =val! ;
// },
// );
// },
// ),
// ),
// )
//
// ),
// ),
