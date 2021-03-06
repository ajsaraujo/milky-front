import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.onPressed, this.text});

  final onPressed; 
  final text; 

  @override 
  Widget build(BuildContext context) {
    return Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Theme.of(context).primaryColor,
        child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: this.onPressed,
            child: Text(text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ))));
  } 
}