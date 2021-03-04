import 'package:flutter/material.dart';
import 'package:flutter_super_mart/shared/globals.dart' as globals;

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {

  List<Widget> _productTiles = [];
  final GlobalKey _listKey = GlobalKey();
  int _itemCount = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _itemCount = globals.cartItems.length;
        this._addProducts();
      });
    });
  }

  void _addProducts() {
    globals.cartItems.forEach((p) {
      _productTiles.add(_buildTile(p));
    });
  }

  Widget _buildTile(product) {
    return ListTile(
      contentPadding: EdgeInsets.all(25),
      title: Text(product['title'], style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor)),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          product['image'],
          fit: BoxFit.contain,
          height: 50.0,
        ),
      ),
      trailing: Text('\$${product['price']}'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        key: _listKey,
        itemCount: _itemCount != null ? _itemCount : 0,
        itemBuilder: (context, index) {
          return _productTiles[index];
        },
      ),
    );
  }
}
