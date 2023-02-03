import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kingdum_care/class/select_class.dart';
import '../models/class_model.dart';

class AddClass extends StatefulWidget {
  ClassModel? classModel;

  AddClass({Key? key, this.classModel}) : super(key: key);

  @override
  State<AddClass> createState() => _AddClassState();
}

class _AddClassState extends State<AddClass> {
  ClassModel? classModel;
  QuerySnapshot? classData;
  List<ClassModel> classValue = [];

  get index => null;

  Future<void> classDataFromFirebase() async {
    classData = await FirebaseFirestore.instance.collection("Classes").get();

    if (classData!.docs.length > 0) {
      classValue = [];
      await Future.forEach(classData!.docs, (element) {
        classValue.add(ClassModel.fromJson(element));
      });
      setState(() {});
    } else {
      classValue = [];
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    classDataFromFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.keyboard_arrow_left,
                          color: Color(0xFFEA706F),
                          size: 30,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        'Add Class',
                        style:
                            TextStyle(color: Color(0xFFEA706F), fontSize: 24),
                      ),
                    ),
                    Text("Add Parent",
                        style: TextStyle(color: Colors.transparent)),
                  ],
                ),
                SizedBox(
                  height: 10,
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
                classData == null
                    ? Center(child: CircularProgressIndicator())
                    : classValue.isEmpty
                        ? Text("NO DATA FOUND")
                        : SizedBox(
                            height: size.height,
                            child: ListView.separated(
                              shrinkWrap: true,
                              padding: EdgeInsets.symmetric(vertical: 20),
                              itemCount: classValue.length,
                              itemBuilder: ((context, index) {
                                return Container(
                                  width: double.infinity,
                                  height: 64,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFEA706F),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      backgroundImage:
                                          AssetImage("images/class.png"),
                                      radius: 20,
                                    ),
                                    title: Text(
                                      classValue[index].className.toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
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
                                            PopupMenuItem<int>(
                                              child: TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      SelectClass(
                                                                        editClass:
                                                                            true,
                                                                        classModel:
                                                                            classValue[index],
                                                                      )));
                                                    });
                                                  },
                                                  child: Text("Edit")),
                                            ),
                                            PopupMenuItem(
                                              child: TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      FirebaseFirestore.instance
                                                          .collection("Classes")
                                                          .doc(classValue[index]
                                                              .id)
                                                          .delete();
                                                      classValue.remove(
                                                          classValue[index]);

                                                      Navigator.pop(context);
                                                    });
                                                  },

                                                  child: Text("Delete")),
                                            ),
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
              ],
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SelectClass(
                              editClass: false,
                            )));
              },
              child: Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFEA706F),
                ),
                child: Icon(
                  Icons.add,
                  size: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// floatingActionButton: FloatingActionButton(
// backgroundColor: Color(0xFFEA706F),
// onPressed: ( ) {
// // Navigator.push(context, MaterialPageRoute(builder: (context)=> SelectClass));
// },
// child: Icon(Icons.add),
