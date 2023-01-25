import 'package:flutter/material.dart';
import 'attendence_list.dart';

class AttendenceTabBar extends StatefulWidget {
  final TabController? tabController;

  const AttendenceTabBar({Key? key, this.tabController}) : super(key: key);

  @override
  State<AttendenceTabBar> createState() => _AttendenceTabBarState();
}

class _AttendenceTabBarState extends State<AttendenceTabBar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return DefaultTabController(
        // Added
        length: 3, // Added
        initialIndex: 0,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Card(
                  color: Colors.transparent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F3F3),

                      borderRadius: BorderRadius.circular(10),
                      // border: Border.all(color: Color.fromRGBO(27, 189, 198, 1))
                    ),
                    child: TabBar(
                      controller: widget.tabController,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      labelColor: const Color(0xFF0EAAF4),
                      unselectedLabelColor: const Color(0xFFBBBBBB),
                      tabs: const [
                        Tab(
                          text: 'All',
                        ),
                        Tab(
                          text: 'Present',
                        ),
                        Tab(
                          text: 'Absent',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: size.height * 0.7,
                width: double.infinity,
                child: TabBarView(children: [
                  ListView.builder(
                      itemCount: AttendenceList().attendenceReport.length,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                          child: SizedBox(
                            height: 70,
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: 30,
                                    backgroundImage: AssetImage(AttendenceList()
                                        .attendenceReport[index]["image"]
                                        .toString()),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          right: 30.0,
                                        ),
                                        child: Text(
                                          AttendenceList()
                                              .attendenceReport[index]["title"]
                                              .toString(),
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 3.0),
                                            child: Text(
                                              AttendenceList()
                                                  .attendenceReport[index]
                                                      ["subtitle"]
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.black54),
                                            ),
                                          ),
                                          SizedBox(width: size.width * 0.07),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 3.0),
                                            child: Text(
                                              AttendenceList()
                                                  .attendenceReport[index]
                                                      ["subtitle2"]
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.black54),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Flexible(
                                    child: Container(
                                      height: double.infinity,
                                      width: 64,
                                      decoration: BoxDecoration(
                                          color:
                                              AttendenceList().attendenceReport[
                                                          index]["text"] ==
                                                      "P"
                                                  ? const Color(0xFF14A639)
                                                  : const Color(0xFFEB0000),
                                          borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              bottomRight:
                                                  Radius.circular(10))),
                                      // color: AttendenceList().attendenceReport[0]["color"].toString().,
                                      child: Center(
                                        child: Text(
                                          AttendenceList()
                                              .attendenceReport[index]["text"]
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 24,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                  ListView.builder(
                      itemCount: AttendenceList().attendenceReport.length,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      itemBuilder: (context, index) {
                        return AttendenceList().attendenceReport[index]
                                    ["text"] ==
                                "P"
                            ? Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 10, 15, 10),
                                child: SizedBox(
                                  height: 70,
                                  child: Card(
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          radius: 30,
                                          backgroundImage: AssetImage(
                                              AttendenceList()
                                                  .attendenceReport[index]
                                                      ["image"]
                                                  .toString()),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                right: 30.0,
                                              ),
                                              child: Text(
                                                AttendenceList()
                                                    .attendenceReport[index]
                                                        ["title"]
                                                    .toString(),
                                                style: const TextStyle(fontSize: 16),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5.0),
                                                  child: Text(
                                                    AttendenceList()
                                                        .attendenceReport[index]
                                                            ["subtitle"]
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black54),
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: size.width * 0.07),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 3.0),
                                                  child: Text(
                                                    AttendenceList()
                                                        .attendenceReport[index]
                                                            ["subtitle2"]
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black54),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Flexible(
                                          child: Container(
                                            height: double.infinity,
                                            width: 64,
                                            decoration: const BoxDecoration(
                                                color: Color(0xFF14A639),
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10))),
                                            // color: AttendenceList().attendenceReport[0]["color"].toString().,
                                            child: Center(
                                              child: Text(
                                                AttendenceList()
                                                    .attendenceReport[index]
                                                        ["text"]
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 24,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Container();
                      }),
                  ListView.builder(
                      itemCount: AttendenceList().attendenceReport.length,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      itemBuilder: (context, index) {
                        return AttendenceList().attendenceReport[index]
                                    ["text"] ==
                                "A"
                            ? Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 10, 15, 10),
                                child: SizedBox(
                                  height: 70,
                                  child: Card(
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          radius: 30,
                                          backgroundImage: AssetImage(
                                              AttendenceList()
                                                  .attendenceReport[index]
                                                      ["image"]
                                                  .toString()),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                right: 30.0,
                                              ),
                                              child: Text(
                                                AttendenceList()
                                                    .attendenceReport[index]
                                                        ["title"]
                                                    .toString(),
                                                style: const TextStyle(fontSize: 16),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 3.0),
                                                  child: Text(
                                                    AttendenceList()
                                                        .attendenceReport[index]
                                                            ["subtitle"]
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black54),
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: size.width * 0.07),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 3.0),
                                                  child: Text(
                                                    AttendenceList()
                                                        .attendenceReport[index]
                                                            ["subtitle2"]
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black54),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Flexible(
                                          child: Container(
                                            height: double.infinity,
                                            width: 64,
                                            decoration: const BoxDecoration(
                                                color: Color(0xFFEB0000),
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10))),
                                            // color: AttendenceList().attendenceReport[0]["color"].toString().,
                                            child: Center(
                                              child: Text(
                                                AttendenceList()
                                                    .attendenceReport[index]
                                                        ["text"]
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 24,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Container();
                      }),
                ]),
              ),
            ],
          ),
        ));
  }
}
