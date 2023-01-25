




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kingdum_care/Parents/add_parent_textfiled.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:validators/validators.dart';

class AddParentScreenn extends StatefulWidget {
  const AddParentScreenn({super.key});



  @override
  State<AddParentScreenn> createState() => _AddParentScreennState();
}

class _AddParentScreennState extends State<AddParentScreenn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool showSpinner = false;
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController adressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.keyboard_arrow_left,
                              color: Color(0xFF8950FC),
                              size: 30,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            'Add Parent',
                            style: TextStyle(
                                color: Color(0xFF8950FC), fontSize: 24),
                          ),
                        ),
                        Text("Add Parent",
                            style: TextStyle(color: Colors.transparent)),
                      ],
                    ),
                    Center(
                      child: CircleAvatar(
                        radius: 45,
                        backgroundColor: Color(0xFFE4DAF9),
                      ),
                    ),
                    AddParentTextfield("First Name", "Sandra", false,
                        "Please enter first name", fNameController),
                    AddParentTextfield(
                      "Last Name",
                      "Wester",
                      false,
                      "Please enter last name",
                      lNameController,
                    ),
                    AddParentTextfield(
                      "Phone ",
                      "+1 234947533",
                      false,
                      "Please enter phone no",
                      phoneController,
                    ),
                    AddParentTextfield(
                      "Email",
                      "sandrawester@gmail.com",
                      false,
                      "Please enter email",
                      emailController,
                    ),
                    AddParentTextfield(
                        "Password",
                        "Sandra123",
                        true,
                        "Please enter password",
                        passController),
                    AddParentTextfield(
                        "Adress",
                        "4999 Shadowmar Drive",
                        false,
                        "Please enter adress",
                        adressController),
                    AddParentTextfield(
                        "Emergency Pin",
                        "1234",
                        false,
                        "Please enter emergency pin",
                        pinController),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF8950FC),
                          ),
                          onPressed: () async {
                            setState(() {
                              showSpinner = true;
                            });
                            if (_formKey.currentState!.validate()) {
                              final docRef = await FirebaseFirestore.instance
                                  .collection('Parents')
                                  .add({
                                "firstName": fNameController.text,
                                "lastName": lNameController.text,
                                "Phone": phoneController.text,
                                "email": emailController.text,
                                "password": passController.text,
                                "address": adressController.text,
                                "Emergency Pin": pinController.text,
                              }).then((value) => print(value.id));
                              setState(() {
                                showSpinner = false;
                              });
                              Navigator.pop(context);
                            }
                            else {
                              showSpinner = false;
                              QuerySnapshot snapshot = await FirebaseFirestore
                                  .instance
                                  .collection('Classes')
                                  .get();
                              snapshot.docs.forEach((element) {
                                print(element.toString());
                              });
                            }
                          },
                          child: Text("Submit"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
// }
// QuerySnapshot snapshot = await FirebaseFirestore
//     .instance
//     .collection('Classes')
// .get();
// snapshot.docs[0].data();
// print(snapshot.docs[5].data());
