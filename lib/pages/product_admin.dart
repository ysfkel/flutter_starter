import 'package:flutter/material.dart';
import './products.dart';
import './product_create.dart';
import './product_list.dart';

class ProductAdmin extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    /**the DefaultTabController makes the page Tab bar controllable
     * */
      return DefaultTabController(length: 2,child: Scaffold(
        drawer: Drawer(
          child: Column(children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text('Choose')
            ),
            ListTile(title: Text('All Products'), onTap:(){
                Navigator.pushReplacementNamed(context, '/');
            })
          ])
        ),
        appBar: AppBar(
            title: Text('Product Admin'),
            bottom: TabBar(tabs: <Widget>[
                Tab(
                    icon: Icon(Icons.create),
                    text: 'Create Product'),
                Tab(
                    icon: Icon(Icons.list),
                    text: 'My Products')
            ]),
        ),
        body: TabBarView(
          children: <Widget>[
            ProductCreatePage(),
            ProductListPage()
          ]
        )
      ),);
  }
}