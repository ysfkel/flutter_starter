import 'package:flutter/material.dart';
import './pages/product.dart';

class Products extends StatelessWidget {
  final List<Map> products;
  final Function deleteProduct;

//  Products([this.products =  const[]]) {
  Products(this.products, {this.deleteProduct}) {
    print('[Products Widget] Constructor');
  }


  Widget _buildProductItem(BuildContext context, int index) {
     return Card(
                      child: Column(
                        children: <Widget>[
                          Image.asset(products[index]['image']),
                          Container(padding:EdgeInsets.all(10.0),child:Text(products[index]['title'])),
                          ButtonBar(
                              alignment: MainAxisAlignment.center,
                              children: <Widget>[FlatButton(
                             child: Text('Details'),

                             onPressed:() => Navigator.pushNamed<bool/**the boolean indicates
                                 the return type of the future*/>(context,'/product/' +index.toString()).then((bool value) {
                                  print( value);
                                  if(value) {
                                    deleteProduct(index);
                                  }
                             }),
                          )])
                        ],
                      ),
                    );
  }

  Widget _buildProductsList() {
    Widget productCard =  Center( child: Text("No Products found, please add some")); //or return an empty container Container();

    if(products.length > 0 ) {
      productCard = ListView.builder(
          itemBuilder: _buildProductItem,
          itemCount: products.length
      );
    }
    //RENDERING LISTVIEW FOR INFINIT LIST OF ITEMS
    return productCard;
  }

  @override
  Widget build(BuildContext context) {

       return _buildProductsList();
    //using the list view in this way is ok for
    // a finite list of items
//        return ListView(
//          children: products
//              .map(
//                (element) => Card(
//                      child: Column(
//                        children: <Widget>[
//                          Image.asset('assets/food.jpg'),
//                          Text(element)
//                        ],
//                      ),
//                    ),
//              )
//              .toList(),
//        );
  }
}
