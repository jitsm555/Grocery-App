import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grocery_app/screens/home_dashboad_screen.dart';
import 'package:grocery_app/util/responsive.dart';
import 'package:grocery_app/util/shopping_colors.dart';
import 'package:grocery_app/widgets/login/button_login_animation.dart';
import 'package:grocery_app/widgets/login/wave_clipper.dart';

class LoginUI extends StatefulWidget {
  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


  Widget _loginPanel(double w, double h) {
    return ListView(
      //  crossAxisAlignment: CrossAxisAlignment.start,
      //  mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _box(email, "Email", TextInputType.text),
        _box(password, "Password", TextInputType.text),
        Container(
            margin: EdgeInsets.only(
                top: h / 20, left: 25, right: 25, bottom: 25),
            child: ButtonLoginAnimation(
              label: "Login",
              fontColor: Colors.white,
              background: shrineGreen400,
              borderColor: shrineGreen400,
              child: HomeDashBoardScreen(),
            )),
        _facebookButton('f', shrineGreen400, 'Log in with Facebook',
            shrineGreen300),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 40),
            //     margin: EdgeInsets.only(top:h/15),
            height: h / 1.2,
            width: w,
            child: ClipPath(
              clipper: WaveClipper(),
              child: ColoredBox(
                color: shrineGreen400,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: h / 7, left: w / 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Welcome\nHere ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Responsive(
            mobile: Container(
              margin: EdgeInsets.only(top: h / 2.5),
              alignment: Alignment.center,
              child: _loginPanel(w, h),
            ),
            tablet: Container(
              margin: EdgeInsets.only(top: h / 2.5, left: w/4, right: w/4),
              alignment: Alignment.center,
              child: _loginPanel(w, h),
            ),
            desktop: Container(
              margin: EdgeInsets.only(top: h / 2.5, left: w/4, right: w/4),
              alignment: Alignment.center,
              child: _loginPanel(w, h),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _box(TextEditingController x, String label, TextInputType t) {
  return Container(
    margin: EdgeInsets.only(left: 20, right: 20, bottom: 8, top: 20),
    child: Form(
      //   key: formkey,
      child: TextFormField(
        controller: x,
        cursorColor: Colors.black,
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
        keyboardType: t,
        obscureText: label == 'Password' ? true : false,
        maxLines: 1,
        decoration: InputDecoration(
          hintText: label,
          labelStyle:
              TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
          hintStyle:
              TextStyle(color: Colors.grey[450], fontWeight: FontWeight.w600),
        ),
      ),
    ),
  );
}

Widget _facebookButton(
    String logoText, Color logoBgColor, String title, Color titleBgColor) {
  return Container(
    height: 50,
    margin: EdgeInsets.all(25),
    child: Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              color: logoBgColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topLeft: Radius.circular(15)),
            ),
            alignment: Alignment.center,
            child: Text(logoText,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w400)),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            decoration: BoxDecoration(
              color: titleBgColor,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  topRight: Radius.circular(15)),
            ),
            alignment: Alignment.center,
            child: Text(title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400)),
          ),
        ),
      ],
    ),
  );
}
