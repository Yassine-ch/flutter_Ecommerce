import 'package:e_commerce/screens/login.dart';
import 'package:e_commerce/screens/signup.dart';
import 'package:flutter/material.dart';

main (){
  runApp(
    MaterialApp(
      home: HomePage(),),
  );
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
   theme: ThemeData(
     primaryColor: Color(0xffaf7373),
     visualDensity: VisualDensity.adaptivePlatformDensity,
   ),
      home: Login(),
    );
  }
}


