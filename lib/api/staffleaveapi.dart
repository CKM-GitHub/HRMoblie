// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:hr_mobile/components/class.dart';
import 'package:http/http.dart';

Future<Staff> staff(id) async {
  // String username = 'KTP';
  // String password = 'KTP12345!';
  // String basicAuth =
  //     'Basic ' + base64Encode(utf8.encode('$username:$password'));
  // print(basicAuth);

  Response r = await post(
      Uri.parse("http://163.43.113.92/HRAPI/api/staffapi/getstaffleave"),
      // headers: <String, String>{
      //   'authorization': basicAuth
      // },
      body: <dynamic, dynamic>{
        "Staff_ID": id.toString(),
      });

  dynamic jsonData = jsonDecode(jsonDecode(r.body));

  Staff staff = Staff(
    jsonData[0]["ID"] == null ? "" : jsonData[0]["ID"].toString(),
    jsonData[0]["Staff_ID"] == null ? "" : jsonData[0]["Staff_ID"].toString(),
    jsonData[0]["Casual_Leave"] == null
        ? ""
        : jsonData[0]["Casual_Leave"].toString(),
    jsonData[0]["Earned_Leave"] == null
        ? ""
        : jsonData[0]["Earned_Leave"].toString(),
    jsonData[0]["Carrier_Leave"] == null
        ? ""
        : jsonData[0]["Carrier_Leave"].toString(),
    jsonData[0]["IsDeleted"] == null ? "" : jsonData[0]["IsDeleted"].toString(),
    jsonData[0]["ModifiedBy"] == null
        ? ""
        : jsonData[0]["ModifiedBy"].toString(),
    jsonData[0]["Other_Leave"] == null
        ? ""
        : jsonData[0]["Other_Leave"].toString(),
  );
  return staff;
  // print(jsonData);
}
