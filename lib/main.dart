import 'package:flutter/material.dart';
import 'package:flutter_super_mart/pages/home.dart';
import 'package:flutter_super_mart/pages/loading.dart';
import 'package:flutter_super_mart/pages/products.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Super Mart App',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.grey[800],
        accentColor: Colors.grey[100],
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.grey[800]
          ),
          textTheme: TextTheme(
            title: TextStyle(color: Colors.grey[800], fontSize: 20),
          )
        ),
        fontFamily: 'Source Sans Pro',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => MyHomePage(title: 'Super Mart'),
        '/products': (context) => Products()
      },
    );
  }
}


