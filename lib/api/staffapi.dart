// ignore_for_file: avoid_print, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hr_mobile/screens/home.dart';
import 'package:http/http.dart';

loginClick(String user, String pwd, BuildContext context) async {
  // String username = 'KTP';
  // String password = 'KTP12345!';
  // String basicAuth =
  //     'Basic ' + base64Encode(utf8.encode('$username:$password'));
  // print(basicAuth);

  Response r = await post(
      Uri.parse("http://163.43.113.92/HRAPI/api/staffapi/getstafflogin"),
      // headers: <String, String>{
      //   'authorization': basicAuth,
      // },
      body: <String, String>{"LoginName": user, "Password": pwd});

  dynamic jsonObject = jsonDecode(jsonDecode(r.body));
  // print(user);
  // print(pwd);
  // print(r.statusCode)
  var staffId = jsonObject[0]["ID"];
  if (jsonObject != null && jsonObject.length != 0) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => HomePage(staffId)));
    print(jsonObject);
  } else {
    print("error");
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert!!"),
          content: Text("Username : " +
              user.toString() +
              "\n" +
              "Password : " +
              pwd.toString() +
              "\n" +
              "are wrong"),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  //var staff_id = jsonObject[0]["ID"];
  //return staff_id;
}
