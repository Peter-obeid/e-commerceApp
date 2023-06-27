import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerceapp/pages/itemPage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'variables.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget({super.key});

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  Widget filled = Icon(Icons.favorite, color: Colors.red);
  Widget notfilled = Icon(
    Icons.favorite_outline,
    color: Colors.red,
  );

CollectionReference cartRef = FirebaseFirestore.instance.collection("cart");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: FirebaseFirestore.instance.collection("product").get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                   
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio:
                        0.50 
                    ),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, i) {
                  final item = snapshot.data!.docs[i];
                  return  Container(
  
                    child: GestureDetector(
                       behavior: HitTestBehavior.translucent,
                          onTap: () {
                        print("============================ about to print item");
                        if (item != null) {
                          Navigator.of(context)
                              .pushNamed("itemPage", arguments: item);
                          print("this is the item ========= $item");
                        } else {
                          print('item is null, cannot push route');
                        }},
                        
                        child: Container(
                        
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                            padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                          margin:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF4C53A5),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      "-50%",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      setState(() {
                                        item['_isFilled'] == !item['_isFilled'];
                                      });
                                      await FirebaseFirestore.instance
                                          .collection("product")
                                          .doc(snapshot.data?.docs[i].id)
                                          .update(
                                              {"_isFilled": !item['_isFilled']});
                                    },
                                    child: Container(
                                        child: item['_isFilled']
                                            ? filled
                                            : notfilled),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: (() {}),
                                child: InkWell(
                                 
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: 5, right: 5, top: 3, bottom: 3),
                                    child: Image.network(
                                      "${item['img']}",
                                      height: 150,
                                      width: 90,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 8),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${item['name']}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF4C53A5),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  " ${item['desc']}",
                                  style: TextStyle(
                                      fontSize: 10, color: Color(0xFF4C53A5)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${item['price']}\$",
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF4C53A5)),
                                    ),
                                    InkWell(
                                      onTap: ()async{
                                   
                                  
                              
                                   final productDoc = FirebaseFirestore.instance.collection("product").doc(snapshot.data!.docs[i].id);
                                   final productSnapshot = await productDoc.get();
                                      if(productSnapshot.exists){
                                         final data = productSnapshot.data();
                                     final cartSnapshot =  await FirebaseFirestore.instance.collection('cart').where("productId", isEqualTo: productDoc.id).get();
                                        if(cartSnapshot.docs.isEmpty){
                                           await FirebaseFirestore.instance.collection('cart').doc().set({
                                             ...data!,
                                            'productId': productDoc.id ,
                                            'total' : "${item['price']}",
                                           });
                                              Navigator.of(context).pushNamed("CartPage");
                                       print("=========================");
                                       print("Item added to cart");
                                        }else{
                                        AwesomeDialog( 
                                  context: context,
                                  dialogType: DialogType.infoReverse,
                                  animType: AnimType.rightSlide,
                                  title: 'Attention',
                                  desc: 'This Product already exist in the cart',
                                 
                                  btnCancelOnPress: () {},
                                  btnCancelColor: Color(0xFF4C53A5),
                                  width: 400,
                                  btnOkOnPress: () {},
                                  btnOkColor: Colors.blue[900],
                                  )..show();
                                        }
                                        
                                      }
                                       
                                  
                                 
                                       },
                                      
                                      
                                      child: Icon(
                                        Icons.shopping_cart_checkout,
                                        color: Color(0xFF4C53A5),
                                        size: 20,
                                      ),),],
                                    ))]
                               
                          ),)
                              ),
                          
                          );
           } );
                        
             
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
