import 'package:flutter/material.dart';

import 'child_add_textfiled.dart';

class ChildProfile extends StatefulWidget {
  const ChildProfile({Key? key}) : super(key: key);

  @override
  State<ChildProfile> createState() => _ChildProfileState();
}

class _ChildProfileState extends State<ChildProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    color: Color(0xFF8950FC),
                    size: 30,
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  'Child Profile',
                  style: TextStyle(color: Color(0xFF8950FC), fontSize: 24),
                ),
              ),
              Text("Add Parent", style: TextStyle(color: Colors.transparent)),
            ],
          ),
                      SizedBox(
                        height: 115,
                        width: 115,
                        child: Stack(
                          clipBehavior: Clip.none,
                          fit: StackFit.expand,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.transparent
                              ,backgroundImage: AssetImage("images/child.png"),
                            ),
                            Positioned(
                                bottom: 0,
                                right: -20,
                                child: RawMaterialButton(
                                  onPressed: () {},
                                  elevation: 0.0,
                                  // fillColor: Color(0xFFF5F6F9),
                                  child: Icon(Icons.camera_alt_outlined, color:Color(0xFF8950FC),size: 20,),
                                  // padding: EdgeInsets.all(15.0),
                                  shape: CircleBorder(),
                                )),
                          ],
                        ),
                      ),
          ChildProfileTextfield(
            "First Name",
            "John",
            false,
          ),
          ChildProfileTextfield(
            "Last Name",
            "Snow",
            false,
          ),
          ChildProfileTextfield(
            "Father Name",
            "Ned Stark",
            false,
          ),
          ChildProfileTextfield("Mother Name", "Ilyana Stark", false),
          ChildProfileTextfield(
            "Date of Birth",
            "20/09/2022",
            false,
          ),
          ChildProfileTextfield(
            "Enrollment Date",
            "20/12/2022",
            false,
          ),
          ChildProfileTextfield(
            "Class",
            "Nursery",
            false,
          ),
        ]))));
    // ChildProfileTextfield("Emergency Pin", "1234",false,),
  }
}
