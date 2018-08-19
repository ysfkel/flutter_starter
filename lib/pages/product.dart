import 'package:flutter/material.dart';
import 'dart:async';

class ProductPage extends StatelessWidget {

  final String title;
  final String imageUrl;

  ProductPage(this.title, this.imageUrl);

  _showWarningDialog(BuildContext context) {
    showDialog(context: context, builder:(BuildContext context) {
      return AlertDialog(
          title: Text('Are you sure?'),
          content: Text('This action cannot be undone'),
          actions: <Widget>[
            FlatButton(child: Text('DISCARD'), onPressed:(){
              //close dialog
              Navigator.pop(context);
            }),
            FlatButton(child: Text('CONTINUE'), onPressed: (){
              //closse dialog
              Navigator.pop(context);
              //navigate
              Navigator.pop(context, true /**data to pass back*/);
            })
          ]
      );

    });
  }

  @override
  Widget build(BuildContext context) {
    //the willPropScope widget listens for the hardware back button press
    //onWillPop function called when back button is pressed
    return WillPopScope(onWillPop: (){
      print("back button pressed");
      Navigator.pop(context, false);
      //return Future.value(true);
    } , child: Scaffold(
        appBar: AppBar(
            title: Text(title)
        ),
        body:  Column(
          //vertical
          // mainAxisAlignment: MainAxisAlignment.center,
          //horizontal
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(imageUrl),
              Container(padding: EdgeInsets.all(10.0), child:Text(title),),
              Container(padding:EdgeInsets.all(10.0),child:RaisedButton(
                color: Theme.of(context).accentColor,

                child: Text('DELETE'),
                onPressed: () => _showWarningDialog(context),
              )
              ),
            ]
        )
    ),);
  }
}
