import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kingdum_care/Screens/login_screen.dart';
import 'package:kingdum_care/dashboard.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();


  FirebaseAuth _auth = FirebaseAuth.instance;
  bool passwordVisibile = false;
  late String email;
  late String password;


  void signUp ( ) async{
    String email = emailController.text.trim();
    String password = passController.text.trim();
    UserCredential? credential;


    try {
      credential = await _auth
          .createUserWithEmailAndPassword(
          email: email, password: password);

       if( credential != null) {
         // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Dashboard()));
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
           content: Text("New User Created"),
           backgroundColor:Color(0xFF00B925),
         ),
         );
       }


    } on FirebaseAuthException catch (ex) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(ex.code.toString()),
        backgroundColor: Colors.red,
      ),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height * 0.30,
                width: size.width,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage("images/login.png"))),
              ),
              Row(
                children: [
                  Text(
                    "Signup",
                    style: TextStyle(fontSize: 30, color: Color(0xFF8950FC)),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(hintText: "Email"),
              ),
              SizedBox(
                height: 15,
              ),
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
               SizedBox(height: 30.0,),

              SizedBox(
                width: double.infinity,
                child: CupertinoButton(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  color: Color(0xFF8950FC),
                  onPressed: () async {
                     signUp();
                  },
                  child: Text("SIGN UP",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                )

              ),
              SizedBox(height: 15.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  InkWell(
                      onTap: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));

                      },
                      child: Text(" log in",style: TextStyle(color: Colors.blue),)),


                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
