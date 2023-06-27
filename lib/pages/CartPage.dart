import 'package:e_commerceapp/pages/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../widgets/CartAppBar.dart';
import '../widgets/CartBottomNavBar.dart';
import '../widgets/CartItemSamples.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: ListView(children: [
CartAppBar(),


 Container(
          
          padding: EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
            color: Color(0xFFEDECF2),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            )),
            child: Column(children: [
              InkWell(child: CartItemSamples(),
   
              
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20,horizontal: 15),
                padding: EdgeInsets.all(10),
                child: Row(children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF4C53A5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(Icons.add,color: Colors.white,),
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text("Add Coupon Code",style: TextStyle(color:Color(0xFF4C53A5),fontWeight: FontWeight.bold,fontSize: 16 ),),
                  )
                ],),
              )
            ],),
            
            ),


]),
      bottomNavigationBar : CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        onTap: (index){
       if (index == 1) {
              // check if first icon is tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            }
        },
        height: 70,
        color:Color(0xFF4C53A5) ,
        items : [
          Icon(CupertinoIcons.cart_fill,size: 30,color: Colors.white,),
        Icon(Icons.home,size: 30,color: Colors.white,),
        
       
      ]),
    );
  }
}