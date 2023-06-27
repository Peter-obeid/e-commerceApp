import 'package:flutter/material.dart';


class CartAppBar extends StatelessWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
color: Colors.white,
padding: EdgeInsets.all(25),

child: Row(children: [

  InkWell(
   
    child: Icon(
      Icons.shopping_bag_outlined,size: 30,
      color: Color(0xFF4C53A5),),
  ),
    
  Padding(
    padding: EdgeInsets.only(left: 50), 
    child: Text("Cart", 
    style: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold, 
      color:  Color(0xFF4C53A5),),) ,),

      Spacer(),

      Icon(Icons.more_vert,size: 32,color:  Color(0xFF4C53A5),),
    
    
    ]
    
    
    )
    );
  }
}