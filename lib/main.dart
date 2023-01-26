import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kingdum_care/meal/meal_home.dart';
import 'Screens/login_screen.dart';


void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}
// FlutterNativeSplash.remove();

class MyApp extends StatelessWidget {
  const MyApp

  ({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("Build Call}");
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Quicksand'),
      home: LoginScreen(),
    );
  }
}