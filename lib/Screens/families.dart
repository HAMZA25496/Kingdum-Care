import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kingdum_care/Parents/add_parent_screen.dart';
import '../models/parent_model.dart';

class Families extends StatefulWidget {
  final ParentModel? parentModel;

  const Families({this.parentModel, super.key});

// const Families(@required this.documentId, {super.key});
  @override
  State<Families> createState() => _FamiliesState();
}

class _FamiliesState extends State<Families> {
  List<ParentModel> parentValue = [];
  QuerySnapshot? parentData;

  Future<void> parentDataFromFirebase() async {
    parentData = await FirebaseFirestore.instance.collection("Parents").get();
    if (parentData!.docs.isNotEmpty) {
      parentValue = [];
      Future.forEach(parentData!.docs, (element) {
        parentValue.add(ParentModel.fromJson(element));
      });
      setState(() {});
    } else {
      parentValue = [];
    }
  }

  @override
  void initState() {
    parentDataFromFirebase();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFE4DAF9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            Row(children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xFF8950FC),
                  )),
              SizedBox(
                width: size.width * 0.2,
              ),
              const Text(
                "Families",
                style: TextStyle(fontSize: 24, color: Color(0xFF8950FC)),
              ),
            ]),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Container(
                height: 50,
                color: const Color(0xFFE4DAF9),
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
                            vertical: 11.5, horizontal: 15.0),
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
            const SizedBox(
              height: 15.0,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: parentValue.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 2 / 2.9,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 15.0),
                itemBuilder: (context, index) {
                  return Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Column( mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(5.0),
                              topLeft: Radius.circular(5.0)),
                          child: Container(
                            height: 35,
                            width: 200,
                            color: const Color(0xFF8950FC),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 Text(
                                  // textAlign: TextAlign.end,
                                  "parent",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.transparent),
                                ),
                                 Text(
                                  // textAlign: TextAlign.end,
                                  "Parent",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                                PopupMenuButton(
                                  // add icon, by default "3 dot" icon

                                  icon:  Icon(
                                    Icons.more_vert,
                                    color: Colors.white,
                                    size: 20,
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
                                                            Families(

                                                              parentModel:
                                                              parentValue[index],
                                                            )));
                                              });
                                            },
                                            child: Text("Edit")),
                                      ),
                                      PopupMenuItem(
                                        child: TextButton(
                                            onPressed: () {
                                              setState(() {
                                               FirebaseFirestore.instance.collection("Parents").doc(parentValue[index].id).delete();
                                               parentValue.remove(
                                                   parentValue[index]);
                                               Navigator.pop(context);
                                              });
                                            },
                                            child: Text("Delete")),
                                      ),
                                    ];
                                  },
                                ),
                          ]),
                        ),
                        ),
                         SizedBox(
                          height: 7.0,
                        ),
                        Container(
                            color: Colors.transparent,
                            child: Column(
                              children: [
                                 ClipOval(
                                  child: Image.network(
                                    parentValue[index]
                                        .profilePic
                                        .toString(),
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  height: 3.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      parentValue[index].firstName.toString(),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF8950FC)
                                      ),
                                    ),
                                    Text(
                                      parentValue[index].lastName.toString(),
                                      style: const TextStyle(
                                        fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF8950FC)
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 7.0,
                                ),
                                SizedBox(
                                  height: 60,
                                  width: 120,
                                  child: ListView.builder(
                                      itemCount: 5,
                                      itemBuilder: ((context, index) {
                                        return Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          elevation: 2,
                                          child: SizedBox(
                                              height: 25.0,
                                              child: Row(
                                                children: const [
                                                  Icon(
                                                    Icons
                                                        .person_outline_outlined,
                                                    color: Color(0xFFFD2873),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "John Doe",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFFFD2873)),
                                                  )
                                                ],
                                              )),
                                        );
                                      })),
                                )
                              ],
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                         Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=> Dashboard()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0,bottom: 8.0),
                                child: Container(
                                  height: 26,
                                  width: 26,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFFFD2873),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    size: 20.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]
                      )
                  );
                },
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
          ]),
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
                      builder: (context) =>  AddParentScreenn()));
            },
            child: Container(
              height: 48,
              width: 48,
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF8950FC),
              ),
              child: const Icon(
                Icons.add,
                size: 30.0,
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
