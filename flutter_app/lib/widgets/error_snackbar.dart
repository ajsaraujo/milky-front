import 'package:flutter/material.dart'; 

class ErrorSnackBar extends StatelessWidget {
  ErrorSnackBar({this.errorMessage}); 

  final errorMessage; 

  @override 
  Widget build(BuildContext context) {
    return SnackBar(
        content: Text(
          errorMessage,
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'Montserrat',)
        ),
        backgroundColor: Colors.red,
    );
  }
}