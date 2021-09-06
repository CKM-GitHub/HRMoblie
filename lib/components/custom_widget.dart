// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class W1 extends StatefulWidget {
  final String val1;
  final String val2;
  const W1(this.val1, this.val2);
  @override
  _W1State createState() => _W1State();
}

class _W1State extends State<W1> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(widget.val1),
        trailing: Text(widget.val2),
        contentPadding: EdgeInsets.only(left: 10, right: 10),
        dense: true,
      ),
    );
  }
}
