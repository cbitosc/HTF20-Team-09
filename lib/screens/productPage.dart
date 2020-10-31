import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  final String image, category, name, seller;
  //final List sellers;
  // final FirebaseFirestore fs;
  ProductPage({this.image, this.category, this.name, this.seller});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  var mp;
  String mail;
  FirebaseFirestore fs = FirebaseFirestore.instance;
  void getSeller() async {
    await fs
        .collection("Products")
        .doc(widget.seller)
        .get()
        .then((value) async {
      mail = value.data()['Seller'];
      var mp1 = Map();
      await fs.collection("Users").doc(mail).get().then((value) {
        print(mail);
        print(value.data());
        value.data().forEach((key, value) {
          mp1[key] = value;
        });
      });
      setState(() {
        mp = mp1;
      });
    });
  }

  void updateReceivedOrders() async {
    await fs.collection("Users").doc(mail).get().then((value) {
      var mp = Map();
      value.data().forEach((key, value) {
        if (key == "Recieved Orders") {
          mp[key] = value;
        }
      });
      print(mp);
      var s = mp["Recieved Orders"];
      print(s.runtimeType);
      s.add(widget.seller);

      fs.collection("Users").doc(mail).update({'Recieved Orders': s});
    });
  }

  @override
  void initState() {
    super.initState();
    getSeller();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlue.shade200,
        child: Column(
          children: [
            Hero(
              tag: widget.name,
              child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 10.0,
                    ),
                  ],
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(widget.image),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0.0, 2.0),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Text(
                widget.name,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0.0, 2.0),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Category: ",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Expanded(
                    child: Text(widget.category,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w800)),
                  ),
                ],
              ),
            ),
            //Text(widget.seller),

            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0.0, 2.0),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Center(
                  child: Text(mp == null ? "" : "Seller: " + mp["Name"])),
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0.0, 2.0),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Center(
                  child: Text(mp == null ? "" : "Phone no.: " + mp["PNO"])),
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0.0, 2.0),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Center(
                child: Text(mp == null
                    ? ""
                    : "Branch: " + mp["Branch"] + " " + mp["Year"] + "/4"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 120,
                    height: 80,
                    child: FlatButton(
                      onPressed: () {
                        updateReceivedOrders();
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.blue,
                      child: Text(
                        "Request Now",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    height: 80,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onPressed: () {},
                      color: Colors.blue,
                      child: Text(
                        "Add To Cart",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
