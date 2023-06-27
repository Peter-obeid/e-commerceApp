import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerceapp/widgets/CartBottomNavBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'variables.dart';

class CartItemSamples extends StatefulWidget {
  const CartItemSamples({super.key});

  @override
  State<CartItemSamples> createState() => _CartItemSamplesState();
}

class _CartItemSamplesState extends State<CartItemSamples> {



CollectionReference cartRef = FirebaseFirestore.instance.collection("cart");
 
 int nb = 0;
 int nb2 = 0;


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection("cart").get(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return  InkWell(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: ((context, i) {
            final item = snapshot.data!.docs[i];
          return Dismissible(
            onDismissed: ((direction) async{
               await cartRef.doc(snapshot.data!.docs[i].id).delete();
               print("========================");
               print("item deleted");
            }),
               direction: DismissDirection.endToStart, // swipe to the left
    background: Container(
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: Padding(
            padding: EdgeInsets.only(right: 20),
            child: Text(
                'Delete',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                ),
            ),
        ),
    ),
           key: UniqueKey(),
            child: Center(
              child: Container(
                width: 300,
                height: 100,
                margin: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white ,
                  borderRadius: BorderRadius.circular(10),
                  
                ),
                
                child: Row(
                  children: [
                    Radio(value: "", groupValue: "", onChanged: (indx){},activeColor: Color(0xFF4C53A5),),
                    Container(
                      height: 40,
                      width: 40,
                      margin: EdgeInsets.only(right: 15),
                      child: Image.network("${item['img']}"),
                    ),
                
                    Padding(padding: EdgeInsets.symmetric(vertical: 7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                        
                          
                          child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                
                                    Text("${item['name']}",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color:Color(0xFF4C53A5) ),),
                                      
                                            
                       
                            
                             
                               
                                                
                                                ],
                                              
                            ),
                          
                        ),
                        Text(" ${item['desc']}",style: TextStyle(fontSize: 10,color:Color(0xFF4C53A5) ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text( "${item['price']}\$",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color:Color(0xFF4C53A5) ),),
                                  Container(
                                    margin: EdgeInsets.only(left: 75),
                                    height: 30,
                                    width: 65,
                 
                  child: ButtonTheme(
                    
                    child: ElevatedButton(
                              
                              
                              onPressed: (() {
                              showModalBottomSheet(context: context, builder: ((context) {
                                return   Container(
                              padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                              height: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  
                                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total: ",style: TextStyle(color: Color(0xFF4C53A5),fontSize: 10,fontWeight: FontWeight.bold),),
                        Text("${item['total']}\$",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Color(0xFF4C53A5)),)
                      ],
                                ),
                                
                                InkWell(
                                  onTap: (){
                      AwesomeDialog( 
                                  context: context,
                                  dialogType: DialogType.infoReverse,
                                  animType: AnimType.rightSlide,
                                  title: 'Fake',
                                  desc: 'This is a fake Shop You can\'t buy',
                                 
                                  btnCancelOnPress: () {},
                                  btnCancelColor: Color(0xFF4C53A5),
                                  width: 400,
                                  btnOkOnPress: () {},
                                  btnOkColor: Colors.blue[900],
                                  )..show();
                                  },
                                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFF4C53A5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text("Check Out",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                                  ),
                                )
                                
                                ],
                              ),
                    );
                              }));
                    }), child: Text("Buy Now",style: TextStyle(fontSize: 8),),  style: ElevatedButton.styleFrom(
                                primary: Color(0xFF4C53A5),
                                
                                  ),),
                  ),
                                  ),
                          ],
                        ),
                      ],
                    ),
                    ),
              
                
                
                
                   
                  ],
                ),
              ),
            ),
          );
        })),
      
      
    );
        }else{
       return  Center(
              child: CircularProgressIndicator(),
            );
      }
      
      }
      );
      
  }
}