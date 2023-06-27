import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
color: Colors.white,
padding: EdgeInsets.all(25),

child: Row(children: [

  Icon(
    Icons.sort,size: 30,
    color: Color(0xFF4C53A5),),


  Padding(
    padding: EdgeInsets.only(left: 20), 
    child: Text("W Shop", 
    style: TextStyle(
      fontSize: 23,
      fontWeight: FontWeight.bold, 
      color:  Color(0xFF4C53A5),),) ,),

      Spacer(),

    
         InkWell(
         
          child: Icon(Icons.shopping_bag_outlined,size: 32,color:  Color(0xFF4C53A5),),
        ) ,
      


]),
    );
  }
}