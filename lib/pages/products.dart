import 'package:flutter/material.dart';
import '../product_manager.dart';

class ProductsPage extends StatelessWidget {
  final List<Map<String, dynamic>> _products;

  ProductsPage(this._products);

  @override
  Widget build(BuildContext context) {
   return  Scaffold(
      drawer: Drawer(
        child: Column(children: <Widget>[
          AppBar(
            //to disable the hamburger icon on the AppBar
            //automaticallyImplyLeading means it automatically tries to infer
            //what the first icon or action is in the appbar
            automaticallyImplyLeading: false,
            title: Text('Choose'),
          ),
          ListTile(title: Text('Manage Products'), onTap:(){
            Navigator.pushReplacementNamed(context, 'admin');
//             Navigator.pushReplacement(context, MaterialPageRoute(builder:
//                 (BuildContext context) => ProductAdmin())

          })
        ])
      ),
      appBar: AppBar(
        title: Text('EasyList'),
      ),
      body: ProductManager(_products),
    );
  }
}
