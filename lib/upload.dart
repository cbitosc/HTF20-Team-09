import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart';

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
  // int _counter = 0;
  var fs = FirebaseFirestore.instance;
  String _category = "";
  String _item = "";
  String _price = "";
  var fa = FirebaseAuth.instance;

  File imagefilepath;
  var imgurl;
  var furl;

  clickphoto() async {
    var picker = ImagePicker();

    await picker
        .getImage(
      source: ImageSource.camera,
      //  maxWidth: 200,
      //  maxHeight: 200,
    )
        .then((value) {
      var filename = basename(value.path);
      setState(() {
        imagefilepath = File(value.path);
      });
      var fbstorage = FirebaseStorage.instance.ref().child(filename);
      fbstorage.putFile(imagefilepath).onComplete.then((_) {
        FirestoreService.loadImage(filename).then((value) {
          furl = value.toString();
          fs.collection("Products").doc("$_category").collection("$_item").add(
            {
              "price": _price,
              "image": furl,
            },
          );
        });
      });
    });
  }

  Widget _buildCategory() {
    return TextFormField(
      decoration: InputDecoration(
        focusColor: Colors.green,
        hintText: 'Category',
        filled: true,
        fillColor: Colors.grey,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Category is Required';
        }

        return null;
      },
      onChanged: (String value) {
        _category = value;
      },
    );
  }

  Widget _buildItem() {
    return TextFormField(
      decoration: InputDecoration(
        focusColor: Colors.green,
        hintText: 'Item',
        filled: true,
        fillColor: Colors.grey,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Item is Required';
        }

        return null;
      },
      onChanged: (String value) {
        _item = value;
      },
    );
  }

  Widget _buildPrice() {
    return TextFormField(
      decoration: InputDecoration(
        focusColor: Colors.green,
        hintText: 'Price',
        filled: true,
        fillColor: Colors.grey,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Item is Required';
        }

        return null;
      },
      onChanged: (String value) {
        _price = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildCategory(),
            SizedBox(
              height: 20,
            ),
            _buildItem(),
            SizedBox(
              height: 20,
            ),
            _buildPrice(),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 200,
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: imagefilepath == null
                    ? NetworkImage(
                        "https://i.ibb.co/kDC1bpg/532d0341186be12412c6a4362cc08710.jpg")
                    : FileImage(imagefilepath),
              )),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          clickphoto();
          //_incrementCounter();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class FirestoreService {
  FirestoreService();
  static Future<dynamic> loadImage(String image) async {
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }
}
