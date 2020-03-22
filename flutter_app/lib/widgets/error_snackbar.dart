import 'package:flutter/material.dart'; 

// Esse Widget está bugado e precisa ser consertado :(
class ErrorSnackBar extends SnackBar {
  ErrorSnackBar({this.errorMessage}); 

  final errorMessage; 

  @override 
  Widget build(BuildContext context) {
    return SnackBar(
        content: Text(
          errorMessage ?? 'Algo deu errado...',
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'Montserrat',)
        ),
        backgroundColor: Colors.red,
    );
  }
}