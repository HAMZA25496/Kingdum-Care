import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:kingdum_care/teachers/teacher_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../models/teacher_model.dart';
import 'add_teachers_textfield.dart';
import 'package:image_picker/image_picker.dart';

class AddTeachers extends StatefulWidget {
  TeacherModel? teacherModel;
  bool editClass = false;

  AddTeachers( {Key? key, this.teacherModel,required this.editClass}) : super(key: key);

  @override
  State<AddTeachers> createState() => _AddTeachersState();
}

class _AddTeachersState extends State<AddTeachers> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  File? profileImage;
  bool showSpinner = false;
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameControllerd = TextEditingController();
  TextEditingController departController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passConroller = TextEditingController();
  TextEditingController adressController = TextEditingController();

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
    widget.teacherModel!.profilePic = imageUrl;
    await FirebaseFirestore.instance
        .collection("Teachers")
        .doc(widget.teacherModel!.id.toString())
        .set(widget.teacherModel!.tojson())
        .then((value) => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Data Uploaded"),
                backgroundColor: Colors.pink,
              ),
            ));
    // Navigator.popUntil(context, (route) => route.isFirst);
    // Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) =>
    //           // HomeScreen(widget.userModel, widget.firebaseuser),
    // );
  }

  // void demo() async {
  //   var pickedImage = await ImagePicker().pickImage(
  //       source: ImageSource.gallery);
  //
  //
  // Reference ref = FirebaseStorage.instance.ref().child("unique_name.jpg");//generate a unique name
  // await ref.putFile(File(pickedImage!.path));//you need to add path here
  // String imageUrl = await ref.getDownloadURL();

  // Future <String> uploadSingleFileToFirestore(String uId,String filePath) async {
  //   String url;
  //   if(await io.File(filePath).exists()){
  //     Reference reference =
  //     io.File(filePath).path.contains("mp4")?
  //     FirebaseStorage.instance.ref().child(uId.toString()+".mp4"):
  //     FirebaseStorage.instance.ref().child(uId.toString());
  //     UploadTask uploadTask = reference.putFile(io.File(filePath));
  //
  //     TaskSnapshot res=await uploadTask.whenComplete(() {});
  //     url =await res.ref.getDownloadURL();
  //     return  url;
  //   }
  //   else{
  //     url = filePath;
  //     return  url;
  //
  //   }
  //
  // }
  //
  // void selectImage(ImageSource source) async {
  //   XFile? pickedFile = await ImagePicker().pickImage(source: source);
  //
  //   if (pickedFile != null) {
  //     (pickedFile);
  //   }
  // }
  // void checkValues() {
  //
  //   if (imageFile == null) {
  //             print("select image First");
  //     // ScaffoldMessenger.of(context).showSnackBar(
  //     //   SnackBar(
  //     //     content: Text("Please Fill All tThe Fields First"),
  //     //     backgroundColor: Colors.red,
  //     //   ),
  //     // );
  //   } else {
  //     uploadData();
  //   }
  // }
  // void uploadData() async {
  //   // UIHelper.showLoadingDialog(context, "Uploading image");
  //   UploadTask uploadTask = FirebaseStorage.instance
  //       .ref("profilepictures")
  //       .child(widget.teacherModel!.id.toString())
  //       .putFile(File(pc));
  //   // Upload task ko run krna  ho ga phir // upload task k complete hony ka wait. OR mily ga TaskSnapshot;
  //
  //   TaskSnapshot snapshot = await uploadTask;
  //   // Phir profile pic ki url mily ga or hum usy store kr lyn gy imageURL me.
  //   String imageUrl = await snapshot.ref.getDownloadURL();
  //
  //   widget.teacherModel!.profilePic = imageUrl;
  //   await FirebaseFirestore.instance
  //       .collection("Teachers")
  //       .doc(widget.teacherModel!.id)
  //       .set(widget.teacherModel!.tojson())
  //       .then((value) =>
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           content: Text("Data Uploaded"),
  //           backgroundColor: Colors.pink,
  //         ),
  //       ));
  //   // Navigator.popUntil(context, (route) => route.isFirst);
  //   // Navigator.pushReplacement(
  //   //     context,
  //   //     MaterialPageRoute(
  //   //       builder: (context) =>
  //   //           // HomeScreen(widget.userModel, widget.firebaseuser),
  //   //     );
  //   // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          color: Color(0xFF00B925),
                          size: 30,
                        )),
                    const Padding(
                      padding: EdgeInsets.only(left: 12.0),
                      child: Text(
                        'Add Teachers',
                        style:
                            TextStyle(color: Color(0xFF00B925), fontSize: 24),
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
                            color: Color(0xFFCCFFD6),
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
                            color: Color(0xFF00B925),
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
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        AddTeachersTextfield(
                            "First Name", "Joffrey", false, fNameController),
                        AddTeachersTextfield(
                            "Last Name", "Baratheon", false, lNameControllerd),
                        AddTeachersTextfield("Department",
                            "Chemistry Department", false, departController),
                        AddTeachersTextfield(
                            "Phone ", "+1 234947533", false, phoneController),
                        AddTeachersTextfield("Email", "sandrawester@gmail.com",
                            false, emailController),
                        AddTeachersTextfield(
                            "Password", "Sandra123", true, passConroller),
                        AddTeachersTextfield("Adress", "4999 Shadowmar Drive",
                            false, adressController),
                      ],
                    )),
                const SizedBox(
                  height: 10.0,
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
                        setState(() {
                          showSpinner = true;
                        });
                        if (_formKey.currentState!.validate()) {
                          await FirebaseFirestore.instance
                              .collection('Teachers')
                              .add({
                            "firstName": fNameController.text,
                            "lastName": lNameControllerd.text,
                            "department": departController.text,
                            "phoneNumber": phoneController.text,
                            "email": emailController.text,
                            // " ${time.hour > 12 ? time.hour - 12 : time.hour} : ${time.minute} ${time.hour >= 12 ? "PM" : "AM"}",
                            "password": passConroller.text,
                            "address": adressController.text,
                            "profilePic": await uploadData(),
                            // " ${time1.hour > 12 ? time1.hour - 12 : time1.hour} : ${time1.minute} ${time1.hour >= 12 ? "PM" : "AM"}",
                          });
                          setState(() {
                            showSpinner = false;
                          });

                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> TeachersScreen()));

                        } else {
                          print("Something Went Wrong");
                        }
                      },
                      child: const Text("Submit"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
