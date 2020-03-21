import 'package:flutter/material.dart';

class CustomAppBar {
  static AppBar makeAppBar(String title, BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: Text(title, 
        style: TextStyle(color: Theme.of(context).accentColor)),
      centerTitle: true,
      elevation: .1,
      actions: <Widget>[Icon(Icons.exit_to_app)],
    );
  }
}
