import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dbtest/widgets/product_carousel.dart';
import 'package:flutter/material.dart';

class SellerProfile extends StatefulWidget {
  final String email;
  final FirebaseFirestore fs;

  SellerProfile({this.email, this.fs});

  @override
  _SellerProfileState createState() => _SellerProfileState();
}

class _SellerProfileState extends State<SellerProfile> {
  List<Container> sellerProducts = [];

  void getData() async {
    var ref = widget.fs.collection("Sellers").doc(widget.email);
    ref.get().then((value) {
      for (var s in value.data()["Products"]) {
        sellerProducts.add(
          Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(10.0),
            width: 150.0,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: NetworkImage(
                  s["imUrl"],
                ),
              ),
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0.0, 2.0),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: Text(
              s["Name"],
              style: TextStyle(
                color: Colors.red,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Text(
                widget.email,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.86,
                width: double.infinity,
                child: sellerProducts.isEmpty
                    ? Center(
                        child: Text(
                          "Getting Data",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                          ),
                        ),
                      )
                    : ListView(
                        children: sellerProducts,
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
