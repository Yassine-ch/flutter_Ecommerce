import 'package:e_commerce/screens/login.dart';
import 'package:e_commerce/widget/changescreen.dart';
import 'package:e_commerce/widget/mybutton.dart';
import 'package:e_commerce/widget/mytextformfield.dart';
import 'package:e_commerce/widget/passwordtextformfield.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText =true;

class _SignUpState extends State<SignUp> {
  void validation (){
    final FormState _form = _formKey.currentState;
    if (_form.validate()){
      print("yes");
    }
    else {
      print("no");
    }
  }
  Widget _buildAllTextFormField(){
    return Container(
      height: 340,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:<Widget> [
          MyTextFormField(
            name: "UserName",
            validator: (value) {
              if (value.length < 6) {
                return "Please Fill UserName";

              } else if (value =="") {
                return "UserName Is Too SHort";
              }
              return "";
            },
          ),
          MyTextFormField(
            name: "Email",
            validator: (value) {
              if (value == "") {
                return "Please fill Email";
              } else if (!regExp.hasMatch(value)) {
                return "Email Is Invalid";
              }
              return "";
            },
          ),


          PassWordTextFormField(
            obserText: obserText,
            name: "PassWord",
            validator: (value) {
              if (value == "") {
                return "Please fill Password";
              } else if (value.length < 8) {
                return "Password is too short";
              }
              return "";
            },
            onTap: () {
              obserText = !obserText;
              FocusScope.of(context).unfocus();
            },
          ),
          MyTextFormField(
            name: "PhoneNumber",
            validator: (value) {
              if (value == "") {
                return "Please fill a phone Number ";
              } else if (value.length < 8) {
                return "Phone Number Must be 8";
              }
              return "";
            },
          ),
        ],
      ),
    );
  }
  Widget _buildBottomPart(){
    return    Container(
      height: 400,
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: Column(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildAllTextFormField(),

          MyButton(onPressed: (){
            validation();
          },
            name: "Sign Up",
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                  height: 100,
                  width: 200,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                _buildBottomPart(),
            SizedBox(
              height: 15,
            ),
            ChangeScreen(name: "Login",
              whichAccount: "I Already Have An Account",
              onTap: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => Login(),
                ),
                );
              },
            ),
              ],
            ),
          ),
        ));
  }
}
