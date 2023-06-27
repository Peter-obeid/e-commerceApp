import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerceapp/pages/CartPage.dart';
import 'package:e_commerceapp/pages/HomePage.dart';
import 'package:e_commerceapp/pages/itemPage.dart';
import 'package:e_commerceapp/widgets/ItemWidget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import '../widgets/variables.dart';

void main() async {
     WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       onGenerateRoute:(settings) {
        if (settings.name == "itemPage"){
          print("=================================");
          print("on generate is being called");
          print(settings.arguments);
          
          return MaterialPageRoute(builder: (context) => ItemPage(item: settings.arguments as dynamic));
        }
        return null;
      }, 
      
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
       scaffoldBackgroundColor: Colors.white,
      
      ),
      home: HomePage(),
     
     routes: {
      
      "CartPage": (context) => CartPage(),
     

           },
    );
  }
}
  