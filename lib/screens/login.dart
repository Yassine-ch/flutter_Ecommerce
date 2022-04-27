 import 'package:e_commerce/screens/signup.dart';
import 'package:e_commerce/widget/changescreen.dart';
import 'package:e_commerce/widget/mybutton.dart';
import 'package:flutter/material.dart';
import '../widget/mybutton.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}
 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 String p =
     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

 RegExp regExp = new RegExp(p);
 bool obserText =true;
 void validation (){
   final FormState _form = _formKey.currentState;
   if (_form.validate()){
     print("yes");
   }
   else {
     print("no");
   }
 }
class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Login",style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),),
                    TextFormField(
                      validator: (value) {
                        if (value == "") {
                          return "Please fill Email";
                        } else if (!regExp.hasMatch(value)) {
                          return "Email Is Invalid";
                        }
                        return "";
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.black)
                      ),
                    ),
                    TextFormField(

                      obscureText:obserText ,
                      validator: (value) {
                        if (value == "") {
                          return "Please fill Password";
                        } else if (value.length < 8) {
                          return "Password is too short";
                        }
                        return "";
                      },
                      decoration: InputDecoration(
                        hintText: "PassWord",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            obserText=!obserText;
                            FocusScope.of(context).unfocus();
                          },
                          child: Icon(
                            obserText==true?
                            Icons.visibility:Icons.visibility_off,
                            color: Colors.black,
                          ),
                        ),
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ////// Button
                    MyButton(onPressed: (){
                      validation();
                    },
                    name: "Login",
                    ),
                    ChangeScreen(name: "Sign up",
                      whichAccount: "I Have Not Account",
                      onTap: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => SignUp(),
                        ),
                        );
                      },
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
