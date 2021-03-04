import 'package:flutter/material.dart';
import 'package:flutter_super_mart/pages/product.dart';
import 'package:flutter_super_mart/services/api.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  List products = [];

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  getProducts() async {
    products = await getFromApi('products');
    setState(() => print('state update after product api call'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        color: Colors.grey[100],
        child: Column(
          children: <Widget>[
            FilterChips(),
            Flexible(
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(5),
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                crossAxisCount: 2,
                children: products.map((p) => ProductCard(p)).toList()
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  
  final product;
  ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      elevation: 0,
      child: InkWell(
        // onTap: () => Navigator.pushNamed(context, '/product', arguments: {'product': product}),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductItem(product))),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'location-$product.image',
                child: Image.network(
                  product['image'],
                  fit: BoxFit.contain,
                  height: 80,
                  width: 80,
                ),
              ),
              Divider(height: 10, color: Colors.white),
              Text(
                '\$${product['price']}',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Divider(height: 10, color: Colors.white),
              Text(
                '${product['title']}',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FilterChips extends StatefulWidget {
  @override
  _FilterChipsState createState() => _FilterChipsState();
}

class _FilterChipsState extends State<FilterChips> {

  List categories = [
    'electronics',
    'jewelery',
    'men clothing',
    'women clothing',
  ];
  int selectedCategory;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Map args = ModalRoute.of(context).settings.arguments;
      setState(() => selectedCategory = categories.indexOf(args['category']));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) =>
          Container(
            margin: EdgeInsets.all(5),
            child: ChoiceChip(
              labelStyle: TextStyle(color: Colors.white),
              backgroundColor: Colors.grey[500],
              selectedColor: Theme.of(context).primaryColor,
              selected: selectedCategory == categories.indexOf(category),
              label: Text(category),
              onSelected: (bool selected) {
                setState(() => selectedCategory = selected ? categories.indexOf(category) : null);
              },
            ),
          )
        ).toList(),
      ),
    );
  }
}



