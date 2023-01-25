import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kingdum_care/dashboard.dart';
import 'package:kingdum_care/events/add_event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/event_model.dart';

class EventsHome extends StatefulWidget {
  const EventsHome({super.key});

  @override
  State<EventsHome> createState() => _EventsHomeState();
}

class _EventsHomeState extends State<EventsHome> {
  EventModel? eventModel;
  QuerySnapshot? eventData;
  List<EventModel> eventValue = [];

  Future<void> eventDataFromFirebase() async {
    eventData =
        await FirebaseFirestore.instance.collection("EventDetails").get();
    if (eventData!.docs.length > 0) {
      eventValue = [];

      await Future.forEach(eventData!.docs, (element) {
        eventValue.add(EventModel.fromJson(element));
      });
      setState(() {});
    } else {
      eventValue = [];
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    eventDataFromFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Dashboard()));
                        },
                        icon:  Icon(
                          Icons.keyboard_arrow_left,
                          color: Color(0xFF117CDA),
                          size: 30,
                        )),
                    const Padding(
                      padding: EdgeInsets.only(left: 12.0),
                      child: Text(
                        'Events',
                        style: TextStyle(color: Color(0xFF117CDA), fontSize: 24),
                      ),
                    ),
                    const Text("Add Parent",
                        style: TextStyle(color: Colors.transparent)),
                  ],
                ),
                eventData == null
                    ? const Center(child: CircularProgressIndicator())
                    : SizedBox(
                        height: size.height,
                        child: ListView.separated(
                          shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:  const EdgeInsets.symmetric(horizontal: 20),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  color: const Color(0xFF117CDA),
                                  elevation: 3,
                                  child: ExpansionTile(
                                    iconColor: Colors.white,
                                    collapsedIconColor: Colors.white,
                                    backgroundColor: const Color(0xFF117CDA),
                                    title: Text(
                                      eventValue[index].eventTitle.toString(),
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                    subtitle: Text(
                                      eventValue[index]
                                          .startDate
                                          .toString()
                                          .substring(0, 10),
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15.0),
                                            child: Text(
                                              eventValue[index]
                                                  .description
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Row(
                                              children: [
                                                Text(
                                                DateFormat('dd-MMM-yyyy')
                                                .format(eventValue[index].startDate!),
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                const Text(
                                                  "to",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                Text(
                                                  eventValue[index]
                                                      .endDate
                                                      .toString()
                                                      .substring(0, 10),
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  eventValue[index]
                                                      .startTime
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                const Text(
                                                  "to",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                Text(
                                                  eventValue[index]
                                                      .endTime
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 16.0),
                                                child: Text(
                                                  eventValue[index]
                                                      .eventPlace
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Transform.translate(
                                                offset: const Offset(0, 10),
                                                child: Container(
                                                    height: 50,
                                                    width: 50,
                                                    decoration:
                                                        const BoxDecoration(
                                                      // color:Colors.transparent

                                                      image: DecorationImage(
                                                        matchTextDirection: true,
                                                        image: AssetImage(
                                                            "images/edit.png"),
                                                      ),
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return const SizedBox(
                                height: 20,
                              );
                            },
                            itemCount: eventValue.length),
                      ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF117CDA),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddEvent()));
        },
        child: const Icon(
          Icons.add_outlined,
          size: 30,
        ),
      ),
    );
  }
}
