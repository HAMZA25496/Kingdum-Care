// import 'package:flutter/material.dart';
// import 'package:kingdum_care/class/class_list.dart';
// import 'package:kingdum_care/class/select_class.dart';
//
// class AddClassCard extends StatefulWidget {
//
//
//
//   @override
//   State<AddClassCard> createState() => _AddClassCardState();
// }
//
// class _AddClassCardState extends State<AddClassCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 64,
//       decoration: BoxDecoration(
//         color: const Color(0xFFEA706F),
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       child: ListTile(
//         leading: CircleAvatar(
//           backgroundColor: Colors.transparent,
//           backgroundImage: AssetImage("images/class.png"),
//           radius: 20,
//         ),
//         title: Text(ClassList().class.toString(),style: const TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         trailing:  Transform.translate(
//           offset: const Offset(16,0),
//           child: PopupMenuButton(
//             // add icon, by default "3 dot" icon
//
//               icon: const Icon(Icons.more_vert,color: Colors.white,),
//               itemBuilder: (context){
//                 return [
//                   const PopupMenuItem<int>(
//                     value: 0,
//                     child: Text("Edit"),
//                   ),
//
//                   const PopupMenuItem<int>(
//                     value: 1,
//                     child: Text("Delete"),
//                   ),
//                 ];
//               },
//               onSelected:(value){
//                 if(value == 0){
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>  SelectClass()));
//                 }else if(value == 1){
//                   setState(() {
//                   });
//                 }
//               }
//           ),
//         ),
//       ),
//     );
//     }
//   }
//
