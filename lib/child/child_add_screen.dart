import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kingdum_care/child/child_profile.dart';

import 'child_add_textfiled.dart';
class ChildAddScreen extends StatefulWidget {
  const ChildAddScreen({Key? key}) : super(key: key);

  @override
  State<ChildAddScreen> createState() => _ChildAddScreenState();
}


class _ChildAddScreenState extends State<ChildAddScreen> {

   TextEditingController dateInput = TextEditingController();

  @override

  void initState() {
    dateInput.text = "";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.keyboard_arrow_left,color: Color(0xFF8950FC),size: 30,)),

                  const Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text('Add Child',style: TextStyle(color: Color(0xFF8950FC),fontSize: 24),),
                  ),
                  const Text("Add Parent",style: TextStyle(color: Colors.transparent)),


                ],
              ),

              const Center(
                child: CircleAvatar(
                  radius: 45,
                  backgroundColor: Color(0xFFE4DAF9),
                ),
              ),
              ChildProfileTextfield("First Name", "John",false,),
              ChildProfileTextfield("Last Name", "Snow",false,),
              ChildProfileTextfield("Father Name", "Ned Stark",false,),
              ChildProfileTextfield("Mother Name", "Ilyana Stark",false),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text("Start Date",style: TextStyle(fontSize: 15.0,color: Colors.black54),),
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
                        color: Color(0xFF8950FC),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(10.0)


                  ),
                  child: TextField(
                    controller: dateInput,
                    readOnly: true,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context, initialDate: DateTime.now(),
                              firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101)
                          );

                          if(pickedDate != null ){
                            //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                            //formatted date output using intl package =>  2021-03-16
//you can implement different kind of Date Format here according to your requirement

                            setState(() {
                              dateInput.text = formattedDate; //set output date to TextField value.
                            });
                          }else{
                          }


                        }, icon: const Icon(Icons.calendar_today_outlined,color: Color(0xFF8950FC)),
                      ),
                      border: InputBorder.none,
                      hintText: "20/09/2016",
                      contentPadding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row( mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text("End Date",style: TextStyle(fontSize: 15.0,color: Colors.black54),),
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
                        color: Color(0xFF8950FC),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(10.0)


                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "20/12/2016",
                      contentPadding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0,),
                      suffixIcon: IconButton(
                        onPressed: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context, initialDate: DateTime.now(),
                              firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101)
                          );

                          if(pickedDate != null ){
                            //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                            //formatted date output using intl package =>  2021-03-16
//you can implement different kind of Date Format here according to your requirement

                            setState(() {
                              dateInput.text = formattedDate; //set output date to TextField value.
                            });
                          }else{
                          }


                        }, icon: const Icon(Icons.calendar_today_outlined,color: Color(0xFF8950FC),),
                      ),

                    ),
                  ),
                ),
              ),
               Row( mainAxisAlignment: MainAxisAlignment.start,
                 children: const [
                   Padding(
                     padding: EdgeInsets.symmetric(horizontal: 20.0),
                     child: Text("Class",style: TextStyle(fontSize: 15.0,color: Colors.black54),),
                   ),
                 ],
               ),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Card(
                  elevation: 5,
                  // shadowColor: Colors.blue,
                  // shadowColor: Colors.lightBlue[300],
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Color(0xFF8950FC),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: SizedBox(
                          child: DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                                border: InputBorder.none
                            ),
                            hint: const Text('Nursery'),
                            items: <String>['PlayGroup','Nursery', 'Three', 'Four', 'Five'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (_) {

                            },
                          ),
                        ),
                      ),
                      border: InputBorder.none,
                      hintText: "Joffery Baratheon",
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 10.0,
                      ),
                    ),
                  ),
                ),
              ),
               const SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal:25.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8950FC),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const ChildProfile()));
                    },


                    child: const Text("Submit"),

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

// DropdownButton(
// hint: _dropDownValue == null
// ? Text('Dropdown')
// : Text(
// _dropDownValue,
// style: TextStyle(color: Colors.blue),
// ),
// isExpanded: true,
// iconSize: 30.0,
// style: TextStyle(color: Colors.blue),
// items: ['One', 'Two', 'Three'].map(
// (val) {
// return DropdownMenuItem<String>(
// value: val,
// child: Text(val),
// );
// },
// ).toList(),
// onChanged: (val) {
// setState(
// () {
// _dropDownValue = val;
// },
// );
// },
// );