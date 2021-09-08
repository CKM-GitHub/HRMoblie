// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, avoid_print, unused_field, unnecessary_null_comparison, prefer_final_fields
import 'package:flutter/material.dart';
import 'package:hr_mobile/api/stafflistapi.dart';

class StaffList extends StatefulWidget {
  const StaffList({Key? key}) : super(key: key);

  @override
  _StaffListState createState() => _StaffListState();
}

class _StaffListState extends State<StaffList> {
  Icon _searchIcon = Icon(Icons.search);
  Text _appBarTitle = Text("Staff List");
  String? _result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 1.0,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        title: _appBarTitle,
        centerTitle: true,
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          IconButton(
            icon: _searchIcon,
            tooltip: "Search",
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        color: Colors.green,
        child: FutureBuilder(
          future: stafflist(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                  child: Center(child: CircularProgressIndicator()));
            } else {
              return ListView.builder(
                // separatorBuilder: (context, index) => Divider(
                //   color: Color.fromRGBO(143, 148, 251, 1),
                // ),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                            "http://163.43.113.92/HR_Management/Photo/" +
                                snapshot.data[index].StaffPhoto),
                      ),
                      title: Text(snapshot.data[index].StaffName),
                      subtitle: Text(snapshot.data[index].StaffCode),
                      trailing: Icon(Icons.arrow_right),
                      onTap: () {},
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
