// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 1.0,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          "Home Page",
        ),
        centerTitle: true,
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          Icon(
            Icons.more_vert,
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(10, (index) {
          return Card(
            color: Colors.white,
            elevation: 10.0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            clipBehavior: Clip.antiAlias,
            //semanticContainer: false,
            // child: getChild(Icons.pedal_bike, "Staff"),
            child: showData(index),
          );
        }),
      ),
    );
  }

  showData(int index) {
    if (index == 0) {
      return Container(child: getChild(Icons.people_alt, "Staff"));
    }
    if (index == 1) {
      return Container(child: getChild(Icons.ac_unit, "AAA"));
    }
    if (index == 2) {
      return Container(child: getChild(Icons.access_alarm_sharp, "BBB"));
    }
    if (index == 3) {
      return Container(child: getChild(Icons.baby_changing_station, "CCC"));
    }
    if (index == 4) {
      return Container(child: getChild(Icons.cabin, "DDD"));
    }
    if (index == 5) {
      return Container(child: getChild(Icons.backpack_rounded, "EEE"));
    }
    if (index == 6) {
      return Container(child: getChild(Icons.people_alt, "Staff"));
    }
    if (index == 7) {
      return Container(child: getChild(Icons.people_alt, "Staff"));
    }
    if (index == 8) {
      return Container(child: getChild(Icons.people_alt, "Staff"));
    }
    if (index == 9) {
      return Container(child: getChild(Icons.people_alt, "Staff"));
    }
  }
}

getChild(image, text) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Icon(
            image,
            size: 60,
            color: Colors.black45,
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 22,
              color: Colors.black45,
            ),
          )
        ],
      )
    ],
  );
}
