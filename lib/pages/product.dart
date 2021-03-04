import 'package:flutter/material.dart';
import 'package:flutter_super_mart/pages/cart.dart';
import 'package:flutter_super_mart/shared/globals.dart' as globals;
import 'package:badges/badges.dart';

class ProductItem extends StatelessWidget {

  final Map product;
  ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Container(
        color: Colors.grey[100],
        padding: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: Hero(
                tag: 'location-$product.image',
                child: Image.network(
                  product['image'],
                  fit: BoxFit.contain,
                  height: 300,
                ),
              ),
            ),
            Divider(height: 20, color: Colors.white),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 200,
                    child: Text(
                      product['title'],
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      softWrap: false,
                    )
                  ),
                  Text(
                    '\$${product['price']}',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  )
                ],
              ),
            ),
            Divider(height: 20, color: Colors.white),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'Description',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 17
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      product['description'],
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 14
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // heroTag: 'cart-page-tag',
        // child: Icon(Icons.shopping_cart),
        child: Badge(
          badgeContent: Text('${globals.cartItems.length}', style: TextStyle(color: Colors.white)),
          child: Icon(Icons.shopping_cart),
        ),
        onPressed: () {
          globals.cartItems.add(product);
          Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).primaryColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () => {}
              )
            ],
          ),
        ),
      )
    );
  }
}
