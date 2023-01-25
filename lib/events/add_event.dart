import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kingdum_care/events/event_textfiled.dart';
import 'package:kingdum_care/events/events_home.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({Key? key}) : super(key: key);

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    DateTime? startDate;
    DateTime? endDate;

  bool showSpinner = false;
  TextEditingController startDate1 = TextEditingController();
  TextEditingController endDate1 = TextEditingController();
  TextEditingController startTime = TextEditingController();
  TextEditingController endTime = TextEditingController();
  TextEditingController eveDescription = TextEditingController();
  TextEditingController eveTitle = TextEditingController();
  TextEditingController evePlace = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.keyboard_arrow_left,
                            color: Color(0xFF117CDA),
                            size: 30,
                          )),
                      const Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Text(
                          'Add Event',
                          style:
                              TextStyle(color: Color(0xFF117CDA), fontSize: 24),
                        ),
                      ),
                      const Text("Add Parent",
                          style: TextStyle(color: Colors.transparent)),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03 ,
                  ),
                  EventAddTextfield(
                    controller: eveTitle,
                    labelText: "Event Title",
                    hintText: "Anything",
                  ),
                  SizedBox(
                    height: size.height * 0.01 ,
                  ),

                  EventAddTextfield(
                    controller: eveDescription,
                    labelText: "Description",
                    hintText: "Please come",
                  ),
                  SizedBox(
                    height: size.height * 0.01 ,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Start Date",
                          style: TextStyle(
                              fontSize: 15.0, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Card(
                      elevation: 1,
                      shadowColor: const Color(0xFF117CDA),
                      // shadowColor: Colors.lightBlue[300],
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Color(0xFF117CDA),
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: TextFormField(
                          controller: startDate1,
                          readOnly: true,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2101));

                                if (pickedDate != null) {
                                  print(
                                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                  String formattedDate =
                                      DateFormat('MMM-dd-yyyy')
                                          .format(pickedDate);
                                  print(
                                      formattedDate); //formatted date output using intl package =>  2021-03-16
//you can implement different kind of Date Format here according to your requirement

                                  setState(() {
                                    startDate1.text =
                                        formattedDate;
                                    startDate = pickedDate;//set output date to TextField value.
                                  });
                                } else {
                                  print("Date is not selected");
                                }
                              },
                              icon: const Icon(
                                  Icons.calendar_today_outlined,
                                  color: Color(0xFF117CDA)),
                            ),
                            border: InputBorder.none,
                            hintText: "20/09/2016",
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                              vertical: 10.0,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'First Enter your password';
                            }
                          }
                          ),

                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01 ,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "End Date",
                          style: TextStyle(
                              fontSize: 15.0, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Card(
                        elevation: 1,
                        shadowColor: const Color(0xFF117CDA),
                        // shadowColor: Colors.lightBlue[300],
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Color(0xFF117CDA),
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: TextFormField(
                          readOnly: true,
                          controller: endDate1,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "20/12/2016",
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                              vertical: 10.0,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2101));

                                if (pickedDate != null) {
                                  print(
                                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                  String formattedDate =
                                      DateFormat('MMM-dd-yyyy')
                                          .format(pickedDate);
                                  print(
                                      formattedDate); //formatted date output using intl package =>  2021-03-16
//you can implement different kind of Date Format here according to your requirement

                                  setState(() {
                                    endDate1.text =
                                        formattedDate;
                                    endDate = pickedDate;//set output date to TextField value.
                                  });
                                } else {
                                  print("Date is not selected");
                                }
                              },
                              icon: const Icon(
                                Icons.calendar_today_outlined,
                                color: Color(0xFF117CDA),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'First Enter your password';
                            }
                          }),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01 ,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Start Time",
                          style: TextStyle(
                              fontSize: 15.0, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Card(
                      elevation: 1,
                      shadowColor: const Color(0xFF117CDA),
                      // shadowColor: Colors.lightBlue[300],
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Color(0xFF117CDA),
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: TextFormField(
                          readOnly: true,
                          controller: startTime,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "02:40 am",
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                              vertical: 10.0,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () async {
                                TimeOfDay? pickedTime =
                                    await showTimePicker(
                                  initialTime: TimeOfDay.now(),
                                  context: context,
                                );

                                if (pickedTime != null) {
                                  print(pickedTime
                                      .format(context)); //output 10:51 PM
                                  DateTime parsedTime = DateFormat.jm()
                                      .parse(pickedTime
                                          .format(context)
                                          .toString());
                                  //converting to DateTime so that we can further format on different pattern.
                                  print(
                                      parsedTime); //output 1970-01-01 22:53:00.000
                                  String formattedTime =
                                      DateFormat('hh:mm aa')
                                          .format(parsedTime);
                                  print(formattedTime); //output 14:59:00
                                  //DateFormat() is from intl package, you can format the time on any pattern you need.

                                  setState(() {
                                    startTime.text =
                                        formattedTime; //set the value of text field.
                                  });
                                } else {
                                  print("Time is not selected");
                                }
                              },
                              icon: const Icon(
                                Icons.timer_outlined,
                                color: Color(0xFF117CDA),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'First Enter your password';
                            }
                          }),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01 ,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "End Time",
                          style: TextStyle(
                              fontSize: 15.0, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Card(
                      elevation: 1,
                      shadowColor: const Color(0xFF117CDA),
                      // shadowColor: Colors.lightBlue[300],
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Color(0xFF117CDA),
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: TextFormField(
                          readOnly: true,
                          controller: endTime,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "02:40 am",
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                              vertical: 10.0,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () async {
                                TimeOfDay? pickedTime =
                                    await showTimePicker(
                                  initialTime: TimeOfDay.now(),
                                  context: context,
                                );

                                if (pickedTime != null) {
                                  print(pickedTime
                                      .format(context)); //output 10:51 PM
                                  DateTime parsedTime = DateFormat.jm()
                                      .parse(pickedTime
                                          .format(context)
                                          .toString());
                                  //converting to DateTime so that we can further format on different pattern.
                                  print(
                                      parsedTime); //output 1970-01-01 22:53:00.000
                                  String formattedTime =
                                      DateFormat('hh:mm aa')
                                          .format(parsedTime);
                                  print(formattedTime); //output 14:59:00
                                  //DateFormat() is from intl package, you can format the time on any pattern you need.

                                  setState(() {
                                    endTime.text =
                                        formattedTime; //set the value of text field.
                                  });
                                } else {
                                  print("Time is not selected");
                                }
                              },
                              icon: const Icon(
                                Icons.timer_outlined,
                                color: Color(0xFF117CDA),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'First Enter your password';
                            }
                          }
                          )
                      ,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01 ,
                  ),
                  EventAddTextfield(
                    controller: evePlace,
                    hintText: "Natioanl club Oiho",
                    labelText: "Place",
                  ),
                  SizedBox(
                    height: size.height * 0.04 ,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF117CDA),
                        ),
                        onPressed: () async {
                          setState(() {
                            showSpinner = true;
                          });
                          if (_formKey.currentState!.validate()) {
                            await FirebaseFirestore.instance
                                .collection('EventDetails')
                                .add({
                              "eventTitle": eveTitle.text,
                              "description": eveDescription.text,
                              "startDate":  startDate,
                              "endDate": endDate,
                              "startTime": startTime.text,
                              // " ${time.hour > 12 ? time.hour - 12 : time.hour} : ${time.minute} ${time.hour >= 12 ? "PM" : "AM"}",
                              "endTime": endTime.text,
                              "eventPlace": evePlace.text,
                              // " ${time1.hour > 12 ? time1.hour - 12 : time1.hour} : ${time1.minute} ${time1.hour >= 12 ? "PM" : "AM"}",
                            });
                            setState(() {
                              showSpinner = false;
                            });

                            Navigator.pop(context);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EventsHome()),
                            );
                          } else {
                            print("Something Went Wrong");
                          }
                        },
                        child: const Text("ADD EVENT"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02 ,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
