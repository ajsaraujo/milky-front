import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar({this.title}); 
  
  final String title; 
  
  @override 
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
   
  @override 
  Widget build(BuildContext context) {
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
