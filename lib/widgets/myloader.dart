import 'package:flutter/material.dart';

class MyLoader extends StatelessWidget {
  final String description;

  MyLoader({this.description});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 80,
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              description,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CircularProgressIndicator(
              strokeWidth: 10,
            ),
          ],
        ),
      ),
    );
  }
}
