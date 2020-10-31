import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './screens/home_screen.dart';

class ProfilePage extends StatefulWidget {
  final String email;
  ProfilePage({this.email});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Widget _greenColors() {
    return Positioned(
      top: 0,
      child: Container(
        color: Colors.lightBlue,
        height: 250,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }

  var mp;

  FirebaseFirestore fs = FirebaseFirestore.instance;
  void getSeller() async {
    var mp1 = Map();
    await fs.collection("Users").doc(widget.email).get().then((value) {
      print(value.data());
      value.data().forEach((key, value) {
        mp1[key] = value;
      });
    });
    setState(() {
      mp = mp1;
    });
  }

  @override
  void initState() {
    getSeller();
    super.initState();
  }

  Widget _getInfo() {
    return Positioned(
      top: 100,
      child: Container(
        margin: const EdgeInsets.all(20),
        height: 400,
        width: MediaQuery.of(context).size.width * 0.90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0.0, 2.0),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("User information:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 60,
                    child: Image(
                      image: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSzp5msT5b7xo01jyGDrCsYq0ygg6KSe_ux0w&usqp=CAU"),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Name:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    mp == null ? "" : mp["Name"],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Email:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    widget.email + "\n",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Branch:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(mp == null ? "" : mp["Branch"] + "\n",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Year:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(mp == null ? "" : mp["Year"] + "/4",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userAdress() {
    return Positioned(
      top: 380,
      child: Container(
        margin: EdgeInsets.all(20),
        height: 200,
        width: MediaQuery.of(context).size.width * 0.90,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "User Address:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Village:"),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Nongnioa village"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("District:"),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Sikhottabong district"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Province:"),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Vietiane capital"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            _greenColors(),
            _getInfo(),
            //_userAdress(),
          ],
        ),
      ),
    );
  }
}
