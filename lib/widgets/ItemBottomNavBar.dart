import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemBottomNavBar extends StatefulWidget {
  final item;
  const ItemBottomNavBar({super.key, required this.item});

  @override
  State<ItemBottomNavBar> createState() => _ItemBottomNavBarState();
}

class _ItemBottomNavBarState extends State<ItemBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 10,
                offset: Offset(0, 3),
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${widget.item['price'] }\$",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4C53A5)),
            ),
          
            ElevatedButton.icon(
              onPressed: () {  AwesomeDialog( 
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
                                  )..show();},
              icon: Icon(CupertinoIcons.check_mark),
              label: Text(
                "Check Out",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF4C53A5)),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 13, horizontal: 15)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)))),
            )
          ],
        ),
      ),
    );
  }
}
