import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List bottomNav = [
    { 'label': 'Home', 'icon': Icon(Icons.home), 'route': '/'},
    { 'label': 'Products', 'icon': Icon(Icons.search), 'route': '/products'},
    { 'label': 'User', 'icon': Icon(Icons.account_circle), 'route': '/user'}
  ];
  List categories = [];

  _onBottomNavTap(int index) {
    Navigator.pushNamed(context, bottomNav[index]['route']);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Map args = ModalRoute.of(context).settings.arguments;
      setState(() => categories = args['categories']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/logo.png', fit: BoxFit.contain, height: 50, width: 50),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        color: Colors.grey[100],
        child: Column(
          children: <Widget>[
            Flexible(child: CategoryGrid(categories))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNav.map((e) => BottomNavigationBarItem(
          icon: e['icon'],
          label: e['label'],
        )).toList(),
        onTap: _onBottomNavTap,
      ),
    );
  }
}

class CategoryGrid extends StatelessWidget {

  final List categories;
  CategoryGrid(this.categories);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(5),
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      crossAxisCount: 2,
      children: categories.map((category) =>
        Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: InkWell(
            onTap: () => Navigator.pushReplacementNamed(context, '/products', arguments: {
              'category': category
            }),
            child: Image.asset(
              'assets/' + category.split(' ')[0] + '.jpg',
              fit: BoxFit.cover,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          elevation: 0
        )
      ).toList()
    );
  }
}