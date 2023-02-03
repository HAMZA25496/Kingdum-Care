import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kingdum_care/Parents/add_parent_textfiled.dart';
import 'package:kingdum_care/models/parent_model.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddParentScreenn extends StatefulWidget {
  ParentModel? parentModel;

  AddParentScreenn({this.parentModel, super.key});

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
  File? profileImage;

  Future selectImage(ImageSource source) async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: source, imageQuality: 20);
    if (pickedFile != null) {
      setState(() {
        profileImage = File(pickedFile.path);
        print(" image selected");
      });
    } else {
      print("No image selected");
    }
  }

  Future<String> uploadData() async {
    UploadTask uploadTask = FirebaseStorage.instance
        .ref("profilepictures")
        .child(fNameController.text.toString())
        .putFile(profileImage!);
    // Upload task ko run krna  ho ga phir // upload task k complete hony ka wait. OR mily ga TaskSnapshot;

    TaskSnapshot snapshot = await uploadTask;
    // Phir profile pic ki url mily ga or hum usy store kr lyn gy imageURL me.
    String imageUrl = await snapshot.ref.getDownloadURL();
    return imageUrl;
  }

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
                            icon: const Icon(
                              Icons.keyboard_arrow_left,
                              color: Color(0xFF8950FC),
                              size: 30,
                            )),
                        const Padding(
                          padding: EdgeInsets.only(left: 12.0),
                          child: Text(
                            'Add Parent',
                            style: TextStyle(
                                color: Color(0xFF8950FC), fontSize: 24),
                          ),
                        ),
                        const Text("Add Parent",
                            style: TextStyle(color: Colors.transparent)),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        showSpinner = true;
                        selectImage(ImageSource.gallery);
                        showSpinner = false;
                      },
                      child: profileImage == null
                          ? Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFAC90E3),
                          // color: Colors.black12,
                          borderRadius: BorderRadius.circular(100),
                          // image: DecorationImage(
                          //   image: AssetImage(
                          //       'Assets/Images/Ellipse 2.png'),
                          //   fit: BoxFit.fill,
                          // ),
                        ),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: Color(0xFF8950FC),
                          size: 20,
                        ),
                        height: 96,
                        width: 96,
                      )
                          : Container(
                        decoration: BoxDecoration(
                          // color: Colors.black12,
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            image: FileImage(File(profileImage!.path)),
                            fit: BoxFit.fill,
                          ),
                        ),
                        // child: Icon(Icons.camera_alt_outlined, color: bgPurple1,size: 28,),
                        height: 96,
                        width: 96,
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
                    AddParentTextfield("Password", "Sandra123", true,
                        "Please enter password", passController),
                    AddParentTextfield("Adress", "4999 Shadowmar Drive", false,
                        "Please enter adress", adressController),
                    AddParentTextfield("Emergency Pin", "1234", false,
                        "Please enter emergency pin", pinController),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF8950FC),
                          ),
                          onPressed: () async {
                            setState(() {
                              showSpinner = true;
                            });
                            if (_formKey.currentState!.validate()) {
                              await FirebaseFirestore.instance
                                  .collection('Parents')
                                  .add({
                                "firstName": fNameController.text,
                                "lastName": lNameController.text,
                                "phoneNumber": phoneController.text,
                                "email": emailController.text,
                                "password": passController.text,
                                "address": adressController.text,
                                "emergencyPin": pinController.text,
                                "profilePic": await uploadData(),
                              });
                              setState(() {
                                showSpinner = false;
                              });
                              Navigator.pop(context);
                            }
                            // else {

                            // }
                          },
                          child: const Text("Submit"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
// }
// QuerySnapshot snapshot = await FirebaseFirestore
//     .instance
//     .collection('Classes')
// .get();
// snapshot.docs[0].data();
// print(snapshot.docs[5].data());

//   showSpinner = false;
//   QuerySnapshot snapshot = await FirebaseFirestore
//       .instance
//       .collection('Classes')
//       .get();
//   snapshot.docs.forEach((element) {
//     print(element.toString());
//   });
