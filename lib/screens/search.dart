import 'package:flutter/material.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class App extends StatefulWidget {
  final FirebaseFirestore fs;
  App({this.fs});
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  String country_id;
  List<String> country = [
    "Pencils",
    "Pens",
    "Drafters",
    "Chart",
    "Calculators",
    "Boxes",
    "Books",
    "Erasers",
    "Rulers"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dropdown Form"),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DropDownField(
              strict: false,
              onValueChanged: (dynamic value) async {
                country_id = value;
              },
              value: country_id,
              hintText: 'Choose an Item',
              labelText: 'Item',
              items: country,
            ),
          ],
        ),
      ),
    );
  }
}
