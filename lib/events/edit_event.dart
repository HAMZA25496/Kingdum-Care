import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kingdum_care/events/add_event.dart';
import 'package:kingdum_care/events/event_textfiled.dart';

class EditEvent extends StatefulWidget {
  const EditEvent({Key? key}) : super(key: key);



  @override
  State<EditEvent> createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
  TextEditingController dateinput = TextEditingController();
  TextEditingController timeinput = TextEditingController();





  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                      'Edit Event',
                      style: TextStyle(color: Color(0xFF117CDA), fontSize: 24),
                    ),
                  ),
                  const Text("Add Parent", style: TextStyle(color: Colors.transparent)),
                ],
              ),
              // EventAddTextfield("Event Title", "Akcent's Music Festival"),
              // EventAddTextfield("Description", "Optional - type something"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Start Date",
                      style: TextStyle(fontSize: 15.0, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Card(
                  elevation: 5,
                  shadowColor: const Color(0xFFFF117CDA),
                  // shadowColor: Colors.lightBlue[300],
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Color(0xFF117CDA),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: TextField(
                    controller: dateinput,
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
                            //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                            //formatted date output using intl package =>  2021-03-16
//you can implement different kind of Date Format here according to your requirement

                            setState(() {
                              dateinput.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          } else {
                          }
                        },
                        icon: const Icon(Icons.calendar_today_outlined,
                            color:Color(0xFF117CDA)),
                      ),
                      border: InputBorder.none,
                      hintText: "20/09/2016",
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 10.0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "End Date",
                      style: TextStyle(fontSize: 15.0, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Card(
                  elevation: 5,
                  shadowColor: Colors.blue,
                  // shadowColor: Colors.lightBlue[300],
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Color(0xFF117CDA),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: TextField(
                    controller: dateinput,
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
                            //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                            //formatted date output using intl package =>  2021-03-16
//you can implement different kind of Date Format here according to your requirement

                            setState(() {
                              dateinput.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          } else {
                          }
                        },
                        icon: const Icon(
                          Icons.calendar_today_outlined,
                          color: Color(0xFF117CDA),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Start Time",
                      style: TextStyle(fontSize: 15.0, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Card(
                  elevation: 5,
                  shadowColor: const Color(0xFF117CDA),
                  // shadowColor: Colors.lightBlue[300],
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Color(0xFF117CDA),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: TextField(
                    controller: timeinput,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "02:40 am",
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 10.0,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () async {

                          TimeOfDay? pickedTime =  await showTimePicker(
                            initialTime: TimeOfDay.now(),
                            context: context,
                          );

                          if(pickedTime != null ){
                            //output 10:51 PM
                            DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                            //converting to DateTime so that we can further format on different pattern.
                            //output 1970-01-01 22:53:00.000
                            String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
                            //output 14:59:00
                            //DateFormat() is from intl package, you can format the time on any pattern you need.

                            setState(() {
                              timeinput.text = formattedTime; //set the value of text field.
                            });
                          }else{
                          }

                        },
                        icon: const Icon(
                          Icons.timer_outlined,
                          color:Color(0xFF117CDA),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "End Time",
                      style: TextStyle(fontSize: 15.0, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Card(
                  elevation: 5,
                  shadowColor: const Color(0xFF117CDA),
                  // shadowColor: Colors.lightBlue[300],
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Color(0xFF117CDA),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: TextField(
                    controller: timeinput,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "02:40 am",
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 10.0,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () async {

                          TimeOfDay? pickedTime =  await showTimePicker(
                            initialTime: TimeOfDay.now(),
                            context: context,
                          );

                          if(pickedTime != null ){
                            //output 10:51 PM
                            DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                            //converting to DateTime so that we can further format on different pattern.
                            //output 1970-01-01 22:53:00.000
                            String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
                            //output 14:59:00
                            //DateFormat() is from intl package, you can format the time on any pattern you need.

                            setState(() {
                              timeinput.text = formattedTime; //set the value of text field.
                            });
                          }else{
                          }

                        },
                        icon: const Icon(
                          Icons.timer_outlined,
                          color: Color(0xFF117CDA),
                        ),
                      ),
                    ),
                  ),
                ),
              ),


              // EventAddTextfield("Place", "National Club Ohio"),
              const SizedBox(height: 15,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal:25.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF117CDA),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddEvent()));
                    },


                    child: const Text("Update"),

                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
