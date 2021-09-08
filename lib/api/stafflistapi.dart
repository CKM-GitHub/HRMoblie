// ignore_for_file: avoid_print, non_constant_identifier_names, prefer_if_null_operators

import 'dart:convert';
import 'package:hr_mobile/components/class.dart';
import 'package:http/http.dart';

Future<List<Staff_List>> stafflist() async {
  // String username = 'KTP';
  // String password = 'KTP12345!';
  // String basicAuth =
  //     'Basic ' + base64Encode(utf8.encode('$username:$password'));
  // print(basicAuth);

  Response r = await post(
      Uri.parse("http://163.43.113.92/HRAPI/api/staffapi/getstafflist"),
      // headers: <String, String>{
      //   'authorization': basicAuth
      // },
      body: <String, String>{"ID": ""});

  var jsonData = jsonDecode(jsonDecode(r.body));

  print(jsonData);

  List<Staff_List> staff = [];
  for (var s in jsonData) {
    Staff_List staff_list = Staff_List(s["ID"].toString(), s["Name"],
        s["StaffPhoto"] == null ? "NoPhoto.jpg" : s["StaffPhoto"]);
    staff.add(staff_list);
  }
  return staff;
}
