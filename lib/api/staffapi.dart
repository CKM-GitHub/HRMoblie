// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart';

loginClick(String user, String pwd) async {
  // String username = 'KTP';
  // String password = 'KTP12345!';
  // String basicAuth =
  //     'Basic ' + base64Encode(utf8.encode('$username:$password'));
  // print(basicAuth);

  Response r = await post(
      Uri.parse("http://192.168.43.77/HRWeb/api/staffapi/getstafflogin"),
      // headers: <String, String>{
      //   'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      //   // "Content-Type": 'application/x-www-form-urlencoded; charset=UTF-8'
      //   // "Content-Type": "application/json",
      //   // // 'authorization': basicAuth,
      //   // //"Accept": "application/json",
      //   // "Access-Control_Allow_Origin": "*"
      // },
      body: <String, String>{"LoginName": user, "Password": pwd});

  dynamic jsonObject = jsonDecode(jsonDecode(r.body));
  print(user);
  print(pwd);
  print(r.statusCode);
  if (r.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return print(jsonObject);
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}
