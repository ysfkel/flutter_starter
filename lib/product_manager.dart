import 'package:flutter/material.dart';

import './products.dart';
import './product_control.dart';

class ProductManager extends StatelessWidget {

  final Function addProduct;
  final Function deleteProduct;
  final List<Map<String, String>> products;

  ProductManager(this.products, this.addProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    print('[ProductManager State] build()');
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: ProductControl(addProduct),
        ),
        //LIST VIEWS MUST BE WRAPPED IN A CONTAINER (HEIGHT MUST BE SPECIFIED) OR EXPANDED CONTAINER
        Expanded(
          child: Products(products, deleteProduct: deleteProduct)
        )
      ],
    );
  }
}
