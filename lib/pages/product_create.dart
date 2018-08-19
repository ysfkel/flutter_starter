import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {

  final Function addProduct;
  final Function deleteProduct;

  ProductCreatePage(this.addProduct, this.deleteProduct);

  @override
  State<StatefulWidget> createState() {
     return _ProductCreatePageState();
  }

}

class _ProductCreatePageState extends State<ProductCreatePage> {

   String productTitle;
   String productDescription;
   double productPrice;

   @override
   Widget build(BuildContext context) {
       return Container(
           margin: EdgeInsets.all(10.0),
           child: ListView(
            children: <Widget>[
               TextField(
                 decoration: InputDecoration(labelText: 'Product title'),
                 onChanged: (String value) {
                       setState((){
                         productTitle = value;
                       });
                 },
               ),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(labelText: 'ProductDescription'),
                onChanged: (String value) {
                    productDescription = value;
                }
              ),
              TextField(
                 keyboardType: TextInputType.number,
                 decoration: InputDecoration(labelText: 'Product Price'),
                 onChanged: (String value) {
                     productPrice = double.parse(value);
                 }
              ),
              SizedBox(height: 10.0),
              RaisedButton(
                  child: Text('Save'),
                  color: Theme.of(context).accentColor,
                  textColor: Colors.white,
                  onPressed:() {
                     final Map<String, dynamic> product = {
                         'title': productTitle,
                          'description': productDescription,
                          'price': productPrice,
                          'image': 'assets/food.jpg'
                     };
                      widget.addProduct(product);
                      Navigator.pushReplacementNamed(context, '/products');
                  }
              )
            ]
          )
       );
   }
}

//class ProductCreatePage extends StatelessWidget {
//
//  @override
//  Widget build(BuildContext context) {
//
//    return Center(child: RaisedButton(
//         child: Text('Save'),
//         onPressed: () {
//             showModalBottomSheet(context: context, builder: (BuildContext context) {
//                 return Center(child: Text('This is a modal'));
//             });
//         }
//    ));
//  }
//}