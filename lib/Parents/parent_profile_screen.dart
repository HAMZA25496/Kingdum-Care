import 'package:flutter/material.dart';
import 'package:kingdum_care/Parents/parent_profile_textfiled.dart';

class ParentProfileScreen extends StatefulWidget {


  @override
  State<ParentProfileScreen> createState() => _ParentProfileScreenState();
}

class _ParentProfileScreenState extends State<ParentProfileScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20,
        centerTitle: true,
        elevation: 0,
        leading: Icon(Icons.keyboard_arrow_left,color: Color(0xFF8950FC),size: 30,),
        title: Text("Parent Profile",style: TextStyle(color: Color(0xFF8950FC)),),
        backgroundColor: Colors.white,
        actions: [

          PopupMenuButton(
            // add icon, by default "3 dot" icon
            icon: Icon(Icons.more_vert,color: Color(0xFF8950FC),),
              itemBuilder: (context){
                return [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text("Edit"),
                  ),

                  PopupMenuItem<int>(
                    value: 1,
                    child: Text("Delete"),
                  ),


                ];
              },
              onSelected:(value){
                if(value == 0){
                  print("Edit is selected.");
                }else if(value == 1){
                  print("Delete  is selected.");
                }
              }
          ),


        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
                  children: [
                    // Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     IconButton(onPressed: () {
                    //       Navigator.pop(context);
                    //     }, icon: Icon(Icons.keyboard_arrow_left,color: Color(0xFF8950FC),size: 30,)),
                    //
                    //     Padding(
                    //       padding: const EdgeInsets.only(left: 12.0),
                    //       child: Text('Parent Profile ',style: TextStyle(color: Color(0xFF8950FC),fontSize: 24,),),
                    //     ),
                    //    IconButton(onPressed: () {
                    //       setState(() {
                    //
                    //         PopupMenuButton(
                    //           // add icon, by default "3 dot" icon
                    //           // icon: Icon(Icons.book)
                    //             itemBuilder: (context){
                    //               return [
                    //                 PopupMenuItem<int>(
                    //                   value: 0,
                    //                   child: Text("Edit"),
                    //                 ),
                    //
                    //                 PopupMenuItem<int>(
                    //                   value: 1,
                    //                   child: Text("Delete"),
                    //                 ),
                    //
                    //
                    //               ];
                    //             },
                    //             onSelected:(value){
                    //               if(value == 0){
                    //                 print("Edit is selected");
                    //               }else if(value == 1){
                    //                 print("Settings menu is selected.");
                    //               }
                    //             }
                    //         );
                    //
                    //       });
                    //    },
                    //
                    //        icon: Icon(Icons.more_vert,color: Color(0xFF8950FC)) ),
                    //
                    //
                    //
                    //   ],
                    // ),
              SizedBox(
                height: 115,
                width: 115,
                child: Stack(
                  clipBehavior: Clip.none,
                  fit: StackFit.expand,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage("images/mother.png"),
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
                        )
                         ),
                  ],
                ),
              ),

                    ParentProfileTextfield("Firs Name", "Sandra",false),
                    ParentProfileTextfield("Last Name", "Wester",false),
                    ParentProfileTextfield("Phone", "+1 23456432",false),
                    ParentProfileTextfield("Email", "sandrawester@gmail.com",false),
                    ParentProfileTextfield("Password", "******",true),
                    ParentProfileTextfield("Adress", "4999 Shadowmar Drive",false),
                    ParentProfileTextfield("Emergency Pin", "****",true),



                  ],
               ),
          ),
        ),
      ),
    );
  }
}
