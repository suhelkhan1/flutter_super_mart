import 'package:flutter/material.dart';
import 'package:flutter_super_mart/services/api.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  @override
  void initState() {
    super.initState();
    getCategories();
  }

  getCategories() async {
    List categories = await getFromApi('products/categories');
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'categories': categories
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Super Mart', style: TextStyle(color: Colors.white, fontSize: 27)),
            Divider(height: 20),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
