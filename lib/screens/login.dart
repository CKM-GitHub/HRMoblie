// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:hr_mobile/components/background.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  TextStyle labelStyle1 = TextStyle();
  TextStyle labelStyle2 = TextStyle();
  // late TextStyle labelStyle;

  @override
  void initState() {
    super.initState();
    focusNode1.addListener(onFocusChange);
    focusNode2.addListener(onFocusChange);
  }

  void onFocusChange() {
    setState(() {
      labelStyle1 = (focusNode1.hasFocus
          ? TextStyle(color: Colors.green)
          : TextStyle(color: Colors.black54));
      labelStyle2 = (focusNode2.hasFocus
          ? TextStyle(color: Colors.green)
          : TextStyle(color: Colors.black54));
    });
  }

  @override
  void dispose() {
    focusNode1.removeListener(onFocusChange);
    focusNode2.removeListener(onFocusChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "CKM HR Login",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade500,
                    fontSize: 35),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                focusNode: focusNode1,
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  labelStyle: labelStyle1,
                  labelText: "Username",
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                focusNode: focusNode2,
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: labelStyle2,
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                ),
                obscureText: true,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              // ignore: deprecated_member_use
              child: RaisedButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: size.width * 0.5,
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(80.0),
                      gradient: new LinearGradient(
                          // ignore: prefer_const_literals_to_create_immutables
                          colors: [
                            Color.fromARGB(70, 0, 255, 0),
                            Color.fromARGB(140, 0, 255, 0)
                          ])),
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    "LOGIN",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
