import 'package:flutter/material.dart';
import './pages/products.dart';
import './pages/auth.dart';
import './pages/product_admin.dart';
import './pages/product.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
      return _MyAppState();
  }

}
class _MyAppState extends State<MyApp> {

  List<Map<String, String>> _products = [];



  void _addProduct(Map<String, String> product) {
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index) {
    setState((){
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepPurple
      ),

     // home: AuthPage(),//ProductsPage(),
      routes: {
        // back slash means home page, this cannot be used with the home property ,
        // if using / slash route, remove the home property
        '/': (BuildContext context) => ProductsPage(_products, _addProduct, _deleteProduct),
        'admin': (BuildContext context) => ProductAdmin()
      },
      onGenerateRoute: (RouteSettings settings) {
          final List<String> pathElements = settings.name.split('/');

          if(pathElements[0] != '') {
               return null;
          }

          if(pathElements[1] == 'product') {
               final index =  int.parse(pathElements[2]);
               return  MaterialPageRoute<bool>(
                 builder: (BuildContext context) =>ProductPage(_products[index]['title'],
                     _products[index]['image']),
               );
          }
      }
    );
  }
}
