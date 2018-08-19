import 'package:flutter/material.dart';

import './products.dart';

class ProductManager extends StatelessWidget {


  final List<Map<String, dynamic>> products;

  ProductManager(this.products);

  @override
  Widget build(BuildContext context) {
    print('[ProductManager State] build()');
    return Column(
      children: [
        //LIST VIEWS MUST BE WRAPPED IN A CONTAINER (HEIGHT MUST BE SPECIFIED) OR EXPANDED CONTAINER
        Expanded(
          child: Products(products)
        )
      ],
    );
  }
}
