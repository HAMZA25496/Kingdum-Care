import 'package:flutter/material.dart';
import 'package:kingdum_care/dashboard.dart';
import 'package:kingdum_care/meal/add-meal.dart';
import 'package:kingdum_care/meal/meal_tabbar.dart';

class MealsHome extends StatefulWidget {
  const MealsHome({Key? key}) : super(key: key);

  @override
  State<MealsHome> createState() => _MealsHomeState();
}

class _MealsHomeState extends State<MealsHome>{
  @override
  Widget build(BuildContext context) {

    // Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Dashboard()));

                  }, icon: const Icon(Icons.keyboard_arrow_left,color: Color(0xFF00B925),size: 30,)),
                  const Center(
                    child: Text("Meal",
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Color(0xFF00B925),
                      ),
                    ),
                  ),
                   const Text("Meal",style: TextStyle(color: Colors.transparent),),


                    ],
              ),
            ),
             const SizedBox(height: 10,),

             SizedBox(
               // height: size.height ,
                 child: MealTabbar())

          ],),
        ),


      ),
      floatingActionButton: SizedBox(
        height: 50,
        width: 50,

        child: FittedBox(
          child: FloatingActionButton(

            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddMeal()));


            },
              backgroundColor: const Color(0xFF00B925)
            ,
             child:  const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
