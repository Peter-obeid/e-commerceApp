import 'package:clippy_flutter/arc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../widgets/ItemAppBar.dart';
import '../widgets/ItemBottomNavBar.dart';

class ItemPage extends StatefulWidget {
   final QueryDocumentSnapshot<Object?>  item; //QueryDocumentSnapshot<Object?>
  const ItemPage({super.key,  required  this.item});
 
  @override
  State<ItemPage> createState() => _ItemPageState();
}
 
class _ItemPageState extends State<ItemPage> {
  @override
  void initState() { 
    // TODO: implement initState
    super.initState();
    print("===========================================");
    print(widget.item);     
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      body: widget.item != null ? ListView(children: [
        ItemAppBar(),
        Padding(
          padding: EdgeInsets.all(16),
          child: Image.network(
            "${widget.item['img'] }",
            height: 300,
          ),
        ),
        Arc(
            // this is for arcing the image using a package called clippy_flutter
            edge: Edge.TOP,
            arcType: ArcType.CONVEY,
            height: 30,
            child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 50, bottom: 20),
                        child: Row(
                          children: [
                            Text(
                              "${widget.item['name'] }",
                              style: TextStyle(
                                fontSize: 28,
                                color: Color(0xFF4C53A5),
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RatingBar.builder(
                                // this is for the rating stars using a package called flutter_rating_bar
                                initialRating: 4,
                                minRating: 0,
                                direction: Axis.horizontal,
                                itemCount: 4,
                                itemSize: 20,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4),
                                itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                onRatingUpdate: (index) {}),
                          
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          "${widget.item['desc'] }",
                          style:
                              TextStyle(fontSize: 17, color: Color(0xFF4C53A5)),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            Text(
                              "Size:",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF4C53A5),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Row(
                              children: [
                                for (int i = 5; i < 10; i++)
                                  Container(
                                    height: 30,
                                    width: 30,
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(30),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 8,
                                          )
                                        ]),
                                    child: Text(
                                      "$i",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF4C53A5)),
                                    ),
                                  )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )))
      ]) : Center(
              child: CircularProgressIndicator(),
            ),
      bottomNavigationBar:  ItemBottomNavBar(item:  widget.item,), 
    );
  }
}
