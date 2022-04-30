import 'package:flutter/material.dart';
class ChangeScreen extends StatelessWidget {
  final Function onTap;
  final String name;
  final String whichAccount;
  ChangeScreen({this.name,this.onTap,this.whichAccount});
  @override
  Widget build(BuildContext context) {
    return  Row(
        children: <Widget>[
        Text(whichAccount),
    SizedBox(width: 30,),
    GestureDetector(
    onTap: onTap,
    child: Text(name,style: TextStyle(
    color: Colors.cyan,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    ),),
    )
    ],
    );
  }
}
