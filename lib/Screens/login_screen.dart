import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kingdum_care/Screens/families.dart';
import 'package:kingdum_care/Screens/signup_screen.dart';
import 'package:kingdum_care/dashboard.dart';
import 'package:kingdum_care/teachers/teacher_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../staff/staff_dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool showSpinner = false;
   bool isChecked = false;
   bool passwordVisibile = false;
  FirebaseAuth _auth = FirebaseAuth.instance;


  void login ( ) async{
     String email = emailController.text.trim();
     String password = passController.text.trim();
     UserCredential? credential;

         setState(() {

           showSpinner = true;
         });
     try {
         credential = await _auth
           .signInWithEmailAndPassword(
           email: email, password: password);

       if( credential != null) {
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Dashboard()));
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
           content: Text("Login Successfull"),
           backgroundColor:Color(0xFF00B925),         ),
         );
       }


     } on FirebaseAuthException catch (ex) {
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
         content: Text(ex.code.toString()),
         backgroundColor: Colors.red,

       ),
       );
       print(ex.code);
     }

     setState(() {

       emailController.clear();
       passController.clear();
       showSpinner = false;
     });
   }

   @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,

        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      height: size.height * 0.30,
                       width: size.width,
                       decoration: BoxDecoration(
                         image: DecorationImage(
                           image: AssetImage("images/login.png")
                         )
                       ),
                    ),

                    Row(
                      children: [
                        Text("Login",style: TextStyle(fontSize: 30,color: Color(0xFF8950FC)),),
                      ],
                    )  ,
                    SizedBox(height: 15,),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Email"

                      ),
                    ),
                    SizedBox(height: 15,),


                    TextField(
                      controller: passController,
                      obscureText:  passwordVisibile ? false : true,
                      decoration: InputDecoration(
                          hintText: "Password",

                        suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                passwordVisibile = !passwordVisibile;
                              });
                              print(passwordVisibile);

                            },

                            child: passwordVisibile == true ? Icon( Icons.visibility_outlined,color: Color(0xFFA8A8A8),):  Icon(Icons.visibility_off_outlined,color: Color(0xFFA8A8A8),))

                      ),
                    ),
                    Row( mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(onPressed: (){

                        }, child: Text("Forgot?")),
                      ],
                    ),


                    Container(
                      child: Transform.scale(
                        scaleX: 1.2,
                        child: Theme(
                          data: ThemeData(
                              unselectedWidgetColor: Colors.grey[300]),
                          child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: const Text(
                              'Remember me',style: TextStyle(fontSize: 12),
                            ),
                            value: isChecked,
                            onChanged: (bool? newValue) {
                              setState(() {
                                isChecked = newValue!;
                              });
                            },
                            activeColor: const Color(0xFF8950FC),
                            checkColor: Colors.white,
                          ),
                        ),
                      ),
                    ),

                     SizedBox(
                       width: double.infinity,
                       child: CupertinoButton(
                         padding: EdgeInsets.symmetric(vertical: 15.0),
                         color:Color(0xFF8950FC) ,
                           onPressed: () async {
                             if (_formKey.currentState!.validate()) {
                               setState(() {
                                 showSpinner = true;
                               });

                               //Admin Login Firebase Logic
                               QuerySnapshot res = await FirebaseFirestore
                                   .instance
                                   .collection("Admin")
                                   .where("email",
                                   isEqualTo: emailController.text.trim())
                                   .where("password",
                                   isEqualTo: passController.text.trim())
                                   .get();

                               if (res.size > 0) {
                                 Navigator.push(
                                     context,
                                     MaterialPageRoute(
                                         builder: (context) => Dashboard()));
                               }

                               //Teacher Login Firebase Logic
                               else {
                                 QuerySnapshot response = await FirebaseFirestore
                                     .instance
                                     .collection("Teachers")
                                     .where("email",
                                     isEqualTo: emailController.text.trim())
                                     .where("password",
                                     isEqualTo: passController.text.trim())
                                     .get();
                                 if (response.docs.length > 0) {
                                   //setTeacherValue()get value and store on local storage
                                   // await setTeacherValue(response.docs.first.id);
                                   Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                           builder: (context) => StaffDashboard())

                                   );
                                 }

                                 //Parent Login Firebase Logic
                                 // else {
                                 //   QuerySnapshot log = await FirebaseFirestore
                                 //       .instance
                                 //       .collection("Parents")
                                 //       .where("Email", isEqualTo: emailController.text.trim())
                                 //       .where("Password",
                                 //       isEqualTo: passController.text.trim())
                                 //       .get();
                                 //
                                 //   if (log.docs.length > 0) {
                                 //     //setParentValue()get value and store on local storage
                                 //     // await setParentValue(log.docs.first.id);
                                 //
                                 //     Navigator.push(
                                 //       context,
                                 //       MaterialPageRoute(
                                 //         builder: (context) => Families(),
                                 //       ),
                                 //     );
                                 //   }
                                 //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                 //     content: Text("no paRENTS"),
                                 //     backgroundColor:Color(0xFF00B925),         ));
                                 //
                                 //
                                 // }

                               }



                               setState(() {
                                 showSpinner = false;
                               });
                             }
                           }
                           // login();
                        ,

                         child: Text("LOG IN",style:
                         TextStyle(
                             fontSize: 17,
                           fontWeight: FontWeight.bold
                         )),
                       ),
                     ),
                      SizedBox(height: 15.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?"),
                  InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupScreen()));

                      },
                      child: Text(" sign up",style: TextStyle(color: Colors.blue),)),


            ],
                      )

                  ],
                ),
              ),
            ),
          ),
        ),
      )

    );
  }
}
