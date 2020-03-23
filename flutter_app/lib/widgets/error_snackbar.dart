import 'package:flutter/material.dart'; 

class ErrorSnackBar {
  ErrorSnackBar({this.errorMessage, this.duration, this.backgroundColor, this.scaffoldKey}); 

  final String errorMessage; 
  final Duration duration; 
  final Color backgroundColor;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override 
  Widget build(BuildContext context) {
    return SnackBar(
        content: Text(
          this.errorMessage,
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'Montserrat',)
        ),
        backgroundColor: this.backgroundColor,
        duration: this.duration 
    );
  }

  void display() {
    SnackBar mySnackBar = SnackBar(
      content: Text(
        this.errorMessage, 
        textAlign: TextAlign.center,
        style: TextStyle(fontFamily: 'Montserrat'),
      ),
      backgroundColor: this.backgroundColor ?? Colors.red, 
      duration: this.duration ?? Duration(seconds: 4),
    );

    scaffoldKey.currentState.showSnackBar(mySnackBar); 
  }
}