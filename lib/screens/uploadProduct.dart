import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart';
import '../widgets/myloader.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class UploadProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
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
  bool showSpinner = false;

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
          addPoduct(_item, furl, _price, _category, "kalyanburriwar@gmail.com");
        });
      });
    });
  }

  void addPoduct(
      String name, String url, String price, String cat, String mail) async {
    String y;
    //Map<String, dynamic> mp = {"test": "test"};
    await fs.collection("Products").add(
      {
        "Name": name,
        "Price": price,
        "Category": cat,
        "Image": url,
        "Seller": mail,
        "State": 0,
      },
    ).then((value) {
      y = value.id;
      print(y);
    });
    fs.collection("Users").doc(mail).get().then((value) {
      var mp = Map();
      value.data().forEach((key, value) {
        if (key == "Products") {
          mp[key] = value;
        }
      });
      print(mp);
      var s = mp["Products"];
      print(s.runtimeType);
      s.add(y);

      fs.collection("Users").doc(mail).update({'Products': s});
      mail = mail.replaceAll(".", "'");
      fs.collection("Categories").doc(cat).update({mail + name: y});
    });

    //   mp[0].add(y);
    //   print(mp);
    // var s = mp["Products"];
    // s.add(y);
    // print(s);

    // });

    // var prod = mp["Products"];
    // prod.add(y);
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
        hintText: 'Name',
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
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        progressIndicator: MyLoader(
          description: "Uploading Files",
        ),
        child: Center(
          child: SingleChildScrollView(
            // mainAxisAlignment: MainAxisAlignment.center,
            child: Column(
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
                        ? AssetImage("images/add.png")
                        : FileImage(imagefilepath),
                  )),
                ),
                RaisedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          clickphoto();
          //_incrementCounter();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add_a_photo),
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
