import 'package:flutter/material.dart';


class StaffAddClass extends StatefulWidget {
  const StaffAddClass({Key? key}) : super(key: key);

  @override
  State<StaffAddClass> createState() => _StaffAddClassState();
}

class _StaffAddClassState extends State<StaffAddClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: () {
                      Navigator.pop(context);
                    },
                        icon: Icon(
                          Icons.keyboard_arrow_left, color: Color(0xFFEA706F),
                          size: 30,)),

                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text('Add Class',
                        style: TextStyle(color: Color(0xFFEA706F), fontSize: 24),),
                    ),
                    Text("Add Parent", style: TextStyle(color: Colors.transparent)),


                  ],
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

                SizedBox(
                  height: (MediaQuery.of(context).size.height ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0),
                    child: GridView.builder(
                        itemCount: 6,
                        gridDelegate:
                         SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        childAspectRatio:   MediaQuery.of(context).size.width * 0.025 /
                            (MediaQuery.of(context).size.height * 0.01),
                          crossAxisSpacing: 40,
                          mainAxisSpacing: 40,
                         ),
                        itemBuilder: (context, index) {
                          return Container(
                            height: 100,
                            width: 100,
                            alignment:
                            AlignmentDirectional
                                .bottomStart,
                            decoration: BoxDecoration(
                              color: Color(0xFFEF9438),                                borderRadius:
                                BorderRadius.circular(
                                    10.0),
                                // image: DecorationImage(
                                //   image: NetworkImage(
                                //       'https://image.tmdb.org/t/p/w600_and_h900_bestv2${snapshot.data?.results![index].posterPath}'),
                                //   fit: BoxFit.fill,
                                // )
                            ),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 38,
                                     width: 38,
                                    decoration: BoxDecoration(

                                       image: DecorationImage(
                                         image: AssetImage("images/classt.png")
                                       )
                                     ),


                                  ),
                                  SizedBox(height: 5,),
                                  Text("Nuresey",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20,color: Colors.white),),
                                ],
                              ),
                            )
                          );
                        }),
                  ),
                ),
                SizedBox(height: 10,),


                // SizedBox(height: 25,),
                // AddClassCard("PayGroup", "images/addclass.png"),
                // SizedBox(height: 25,),
                //
                // AddClassCard("Nursery", "images/addclass.png"),
                // SizedBox(height: 25,),
                //
                // AddClassCard("Three", "images/addclass.png"),
                // SizedBox(height: 25,),
                //
                // AddClassCard("Five", "images/addclass.png"),
                // SizedBox(height: 25,),
                //
                // AddClassCard("Four", "images/addclass.png"),

              ],
            ),
          ),
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
