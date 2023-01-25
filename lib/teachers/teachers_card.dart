import 'package:flutter/material.dart';

class TeachersCard extends StatelessWidget {
    String title;
    String subtitle;
    String  image;

   TeachersCard(@required this.title, @required this.subtitle,@required this.image,);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 64,
      decoration: BoxDecoration(
          color: Color(0xFF00B925),
          borderRadius: BorderRadius.circular(10.0)
      )
      ,child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(image),
          radius: 30,
        ),
        title: Text(title,style: TextStyle(color: Colors.white),),
        subtitle: Text(subtitle,style: TextStyle(color: Colors.white)),
        trailing: Icon(Icons.more_vert,color: Colors.white,),
      ),
    );
  }
}
