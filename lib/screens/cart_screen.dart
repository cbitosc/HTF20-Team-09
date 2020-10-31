import 'package:flutter/material.dart';
import '../models/product_model.dart';

class CartScreen extends StatefulWidget {
  final Function update;

  CartScreen({this.update});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  _buildCartProduct(int index) {
    return ListTile(
      contentPadding: EdgeInsets.all(20.0),
      leading: Image(
        height: double.infinity,
        width: 100.0,
        image: AssetImage(
          cart[index].imageUrl,
        ),
        fit: BoxFit.contain,
      ),
      title: Text(
        cart[index].name,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        'x1',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Text(
        '\$${cart[index].price.toStringAsFixed(2)}',
        style: TextStyle(
          color: Colors.orange,
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Shopping Cart (${cart.length})',
            style: TextStyle(color: Colors.black),
          ),
          leading: Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: InkResponse(
              onTap: () {
                cart = [];
                widget.update();
                setState(() {});
              },
              child: Icon(
                Icons.delete,
                size: 30.0,
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: ListView.separated(
          padding: EdgeInsets.all(20.0),
          itemCount: cart.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildCartProduct(index);
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.black54,
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Add your onPressed code here!
          },
          label: Text('Buy now!'),
          icon: Icon(Icons.local_grocery_store),
          backgroundColor: Colors.blueAccent[100],
        ));
  }
}
