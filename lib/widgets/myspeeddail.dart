import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../profile.dart';
import '../screens/uploadProduct.dart';

class MySpeedDail extends StatelessWidget {
  final FirestoreFirebase fs;
  final String mail;
  const MySpeedDail({
    this.fs,
    this.mail,
  });

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      marginRight: 18,
      marginBottom: 20,
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22.0),
      closeManually: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => print('OPENING DIAL'),
      onClose: () => print('DIAL CLOSED'),
      tooltip: 'Speed Dial',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 8.0,
      shape: CircleBorder(),
      children: [
        SpeedDialChild(
          child: Icon(Icons.search),
          backgroundColor: Colors.orange,
          label: 'Search',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () {},
        ),
        SpeedDialChild(
          child: Icon(Icons.add_shopping_cart),
          backgroundColor: Colors.red,
          label: 'Sell',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => UploadProduct()),
            );
          },
        ),
        SpeedDialChild(
          child: Icon(Icons.brush),
          backgroundColor: Colors.blue,
          label: 'Purchase History',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () {},
        ),
        SpeedDialChild(
          child: Icon(Icons.accessibility),
          backgroundColor: Colors.green,
          label: 'Profile',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(email: mail),
              ),
            );
          },
        ),
      ],
    );
  }
}

class FirestoreFirebase {}
