// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:hr_mobile/api/staffleaveapi.dart';
import 'package:hr_mobile/components/custom_widget.dart';
import 'package:hr_mobile/components/staffleave.dart';

class LeavePage extends StatefulWidget {
  final int staffId;
  const LeavePage(this.staffId);
  // const LeavePage({Key? key}) : super(key: key);
  @override
  _LeavePageState createState() => _LeavePageState();
}

class _LeavePageState extends State<LeavePage> {
  // ignore: recursive_getters

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Types of Leaves"),
      ),
      body: FutureBuilder(
        future: staff(widget.staffId),
        builder: (context, snapshot) {
          Staff staff;
          if (snapshot.hasData) {
            staff = snapshot.data as Staff;
          } else {
            staff = Staff("", "", "", "", "", "", "", "");
          }
          return snapshot.hasData
              ? Column(
                  children: [
                    W1("Other Leave", staff.Other_Leave),
                    W1("Casual Leave", staff.Casual_Leave),
                    W1("Earned Leave", staff.Earned_Leave),
                    W1("Carrier Leave", staff.Carrier_Leave),
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
