import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:path/path.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseFirestore fs = FirebaseFirestore.instance;
  List<Container> l = [];
  getData(String category) async {
    l = [];
    var ref = fs.collection("Products").doc(category);
    ref.get().then((value) {
      value.data().forEach((key, value) {
        print(key);
        print(value);
        var v = Map.from(value);
        l.add(Container(
          width: 200,
          height: 200,
          child: Text(v["Name"]),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(v["Image"]),
            ),
          ),
        ));
      });
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: ListView(
            children: [
              Row(
                children: [
                  FlatButton(
                    minWidth: 5,
                    onPressed: () async {
                      getData("Fruits");
                    },
                    child: Text("Fruits"),
                  ),
                  FlatButton(
                    onPressed: () async {
                      getData("Vegetables");
                    },
                    child: Text("Vegetables"),
                  ),
                  FlatButton(
                    onPressed: () async {
                      getData("Kharif Cereals");
                    },
                    child: Text("Kharif"),
                  ),
                  FlatButton(
                    onPressed: () async {
                      getData("Rabi Cereals");
                    },
                    child: Text("Rabi"),
                  ),
                ],
              ),
              l.isEmpty
                  ? Container()
                  : Column(
                      children: l,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
