import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kingdum_care/meal/meal_home.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddMeal extends StatefulWidget {
  const AddMeal({super.key});

  @override
  State<AddMeal> createState() => _AddMealState();
}

class _AddMealState extends State<AddMeal> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime? startDate;
  bool showSpinner = false;
  String _value = "Snacks AM";
  TextEditingController dateInput = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController titleController = TextEditingController();

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
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MealsHome()));
                          },
                          icon: const Icon(
                            Icons.keyboard_arrow_left,
                            color: Color(0xFF00B925),
                            size: 30,
                          )),
                    ),
                    SizedBox(
                      width: size.width * 0.28,
                    ),
                    const Text(
                      "Meal",
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Color(0xFF00B925),
                      ),
                    ),
                    const Text(
                      "Meal",
                      style: TextStyle(color: Colors.transparent),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: const [
                    Text(
                      "Meal Type",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Row(
                  children: [
                    Radio(
                      activeColor: const Color(0xFF00B925),
                      value: "Snacks AM",
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value.toString();
                          print("Snaks AM SELETCD");
                        });
                      },
                    ),
                    const Text("Snacks AM")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Row(
                  children: [
                    Radio(
                      activeColor: const Color(0xFF00B925),
                      value: "Lunch",
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value.toString();
                          print("Lunch SELETCD");
                        });
                      },
                    ),
                    const Text("Lunch")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Row(
                  children: [
                    Radio(
                      activeColor: const Color(0xFF00B925),
                      value: "Snacks PM",
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value.toString();
                          print("Snaks PM SELETCD");
                        });
                      },
                    ),
                    const Text("Snacks PM")
                  ],
                ),
              ),
              // MealRadioButton(value: "Snack AM" ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "Title",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Card(
                  elevation: 2,
                  // shadowColor: Colors.lightBlue[300],
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Color(0xFF00B925),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: TextFormField(
                      controller: titleController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Strawberry Milk Shake",
                          hintStyle: TextStyle(color: Color(0xFF707070)),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 0, horizontal: 15)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Select Title';
                        }
                      }),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    const Text(
                      "Date",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Card(
                  elevation: 2,
                  // shadowColor: Colors.lightBlue[300],
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Color(0xFF00B925),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: TextFormField(
                    readOnly: true,
                      controller: dateInput,
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
                                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000ay
                                String formattedDate = DateFormat('MMM-dd-yyyy')
                                    .format(pickedDate);
                                print(
                                    formattedDate); //formatted date output using intl package =>  2021-03-16
//you can implement different kind of Date Format here according to your requirement

                                setState(() {
                                  dateInput.text = formattedDate;
                                  startDate =
                                      pickedDate; //set output date to TextField value.
                                });
                              } else {
                                print("Date is not selected");
                              }
                            },
                            icon: const Icon(Icons.calendar_today_outlined,
                                color: Color(0xFF00B925)),
                          ),
                          border: InputBorder.none,
                          hintText: "May/20/2022",
                          hintStyle: const TextStyle(color: Color(0xFF707070)),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Select Date ';
                        }
                      }),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    const Text(
                      "Time",
                      style: TextStyle(fontSize: 15.0, color: Colors.black),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Card(
                  elevation: 2,
                  // shadowColor: Colors.lightBlue[300],
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Color(0xFF00B925),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: TextFormField(
                    readOnly: true,
                      controller: time,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "12:00 PM",
                        hintStyle: const TextStyle(color: Color(0xFF707070)),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 10.0,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              initialTime: TimeOfDay.now(),
                              context: context,
                            );

                            if (pickedTime != null) {
                              print(
                                  pickedTime.format(context)); //output 10:51 PM
                              DateTime parsedTime = DateFormat.jm()
                                  .parse(pickedTime.format(context).toString());
                              //converting to DateTime so that we can further format on different pattern.
                              print(
                                  parsedTime); //output 1970-01-01 22:53:00.000
                              // String formattedTime = DateFormat('HH:mm:ss').format(parsedTime); // For Time format 24 hours
                              String formattedTime = DateFormat('hh:mm:aa')
                                  .format(
                                      parsedTime); // For Time format 12 hours

                              print(formattedTime); //output 14:59:00
                              //DateFormat() is from intl package, you can format the time on any pattern you need.

                              setState(() {
                                time.text =
                                    formattedTime; //set the value of text field.
                              });
                            } else {
                              print("Time is not selected");
                            }
                          },
                          icon: const Icon(
                            Icons.timer_outlined,
                            color: Color(0xFF00B925),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'PLease Select Time ';
                        }
                      }),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00B925),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          showSpinner = true;
                        });
                        try {
                          await FirebaseFirestore.instance
                              .collection("MealDetails")
                              .add({
                            "title": titleController.text,
                            "date": startDate,
                            "time": time.text,
                            "mealType": _value,
                            // "meal":     MealRadioButton(meal: value.toString(),
                          });
                          showSpinner = false;
                          Navigator.pop(context);

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MealsHome()));
                        } catch (e) {
                          print(e.toString());
                        }
                      } else {
                        showSpinner = false;
                      }
                    },
                    child: const Text(
                      "Add Meal",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      )),
    );
  }
}

// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 30.0),
// child:   Row(
// children: [
// Text("Snacks AM"),
// Radio(
// activeColor: Color(0xFF00B925),
//
// value: "Snacks AM",
// groupValue: _value,
// onChanged: (value) {
// setState(() {
// _value = value.toString();
// print("Snaks AM SELECTED");
//
// });
// },
// ),
// ],
// ),
//
// ),
// Padding(
// padding:  EdgeInsets.symmetric(horizontal: 30.0),
// child:   Row(
// children: [
// Text("Lunch"),
// Radio(
// activeColor: Color(0xFF00B925),
//
// value: "Lunch",
// groupValue: _value,
// onChanged: (value) {
// setState(() {
// _value = value.toString();
// print("Lunch");
//
// });
// },
// ),
// ],
// ),
//
// ),
// Padding(
// padding:  EdgeInsets.symmetric(horizontal: 30.0),
// child:   Row(
// children: [
// Text("Snacks PM"),
// Radio(
// activeColor: Color(0xFF00B925),
//
// value: "Snacks PM",
// groupValue: _value,
// onChanged: (value) {
// setState(() {
// _value = value.toString();
// print("Snaks PM SELECTED");
//
// });
// },
// ),
// ],
// ),
//
// ),
