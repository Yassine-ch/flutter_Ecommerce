import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {
  Function onPressed;
  final String name;
  MyButton({this.name,this.onPressed});
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 30,
      child: RaisedButton(
          child: Text(name),
          color: Colors.blueGrey,
          onPressed:onPressed,
      ),
    );
  }
}
