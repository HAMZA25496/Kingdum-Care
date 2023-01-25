import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../dashboard.dart';

class ParentContainer extends StatefulWidget {
  const ParentContainer({Key? key}) : super(key: key);

  @override
  State<ParentContainer> createState() => _ParentContainerState();
}

class _ParentContainerState extends State<ParentContainer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Card(
        elevation: 1,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          child: Column(

            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5.0),
                    topLeft: Radius.circular(5.0)),
                child: Container(
                  height: 35,
                  color: Color(0xFF8950FC),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        textAlign: TextAlign.end,
                        "parent",
                        style: TextStyle(fontSize: 18, color: Colors.transparent),
                      ),
                      Text(
                        textAlign: TextAlign.end,
                        "Parent",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_vert,
                            size: 20,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
              ),
               SizedBox(height: 7.0,),
              Container(
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 25,
                      ),
                      SizedBox(height: 3.0,),

                      Text(
                        "Sandra Wedter",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 7.0,),

                      SizedBox(
                        height: 60,
                        width: 120,
                        child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: ((context, index) {
                              return Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                elevation: 2,
                                child: Container(
                                    height: 25.0,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.person_outline_outlined,
                                          color: Color(0xFFFD2873),
                                        ),
                                        SizedBox(width: 5,),
                                        Text(
                                          "John Doe",
                                          style: TextStyle(
                                              color: Color(0xFFFD2873)),
                                        )
                                      ],
                                    )),
                              );
                            })),
                      )
                    ],
                  )
              ),
      ]
      ),
    )
      ),
    floatingActionButton:
    Row( mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        InkWell
          (
          onTap: (){
            // Navigator.push(context, MaterialPageRoute(builder: (context)=> Dashboard()));


          },
          child: Container(

            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:Color(0xFFFD2873),
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
// floatingActionButton: Container(
//     height:35,
//   width: 35,
//   child: FittedBox(
//     child:  FloatingActionButton(
//       heroTag: null,
//
//       backgroundColor:  Color(0xFFFD2873),
//       onPressed: () {
//         Navigator.push(context, MaterialPageRoute(builder: (context)=> Dashboard()));
//
//       },
//       child: Icon(Icons.add,size: 35,),
//
//     ),
//   )
// )