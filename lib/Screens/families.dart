

import 'package:flutter/material.dart';
import 'package:kingdum_care/Parents/add_parent_screen.dart';
import 'package:kingdum_care/child/child_add_screen.dart';
import 'package:kingdum_care/dashboard.dart';
import 'package:kingdum_care/Parents/parent_container.dart';

class Families extends StatefulWidget {
  late final String documentId;

  // const Families(@required this.documentId, {super.key});
  @override
  State<Families> createState() => _FamiliesState();
}

class _FamiliesState extends State<Families> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFE4DAF9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(children: [
                IconButton(onPressed: () {
                  Navigator.pop(context);

                }, icon: Icon(Icons.arrow_back_ios,color:  Color(0xFF8950FC),)),
                SizedBox(
                  width: size.width * 0.2,
                ),
                Text(
                  "Families",
                  style: TextStyle(fontSize: 24, color: Color(0xFF8950FC)),
                ),
              ]),
              SizedBox(height: 15,),
              Container(
                child: Center(
                  child: Container(
                    height: 50,
                    color: Color(0xFFE4DAF9),
                    child: Card(
                      elevation: 3,
                      // color: Constants.lightThemeColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.search,color: Colors.grey,size: 20,),
                          hintText: "search...",
                          hintStyle: TextStyle(color: Colors.black),
                          contentPadding: EdgeInsets.symmetric(vertical: 11.5,horizontal: 15.0),
                          focusColor: Colors.red,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                      )
                    ),
                  ),
                ),
              ),
                      SizedBox(height: 15.0,),

                    Expanded(
                      child: GridView.builder(
                        itemCount: 4,
                          itemBuilder: (context, index) {
                            return ParentContainer();

                          },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 2/2.9,
                        crossAxisCount: 2,
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 15.0
                        ),

                      ),
                    ),
              SizedBox(height: 25.0,),


            ],
          ),
        ),
      ),
      floatingActionButton:
      Row( mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell
            (
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> AddParentScreenn()));


            },
            child: Container(
     height: 40,
              width: 40,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:Color(0xFF8950FC),
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
    );
  }
}
// floatingActionButton: FloatingActionButton(
// heroTag: null,
// onPressed: (){
//
// Navigator.push(context, MaterialPageRoute(builder: (context)=> ChildAddScreen()));
// },
// backgroundColor: Color(0xFF8950FC),
// child: Icon(Icons.add,),
// ),
