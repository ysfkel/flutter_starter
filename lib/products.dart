import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> products;

  Products([this.products =  []]) {
    print('[Products Widget] Constructor');
  }

  Widget _buildProductItem(BuildContext context, int index) {
     return Card(
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/food.jpg'),
                          Text(products[index])
                        ],
                      ),
                    );
  }

  @override
  Widget build(BuildContext context) {

     //RENDERING LISTVIEW FOR INFINIT LIST OF ITEMS
    return ListView.builder(
       itemBuilder: _buildProductItem,
       itemCount: products.length
     );

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
