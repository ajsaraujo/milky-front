import 'package:flutter/material.dart'; 

class CustomDialog {

  static const style = TextStyle(fontFamily: 'Montserrat', color: Colors.white); 

  static Widget showMyDialog({BuildContext context, String title, String content}) {
    showDialog(
      context: context, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title, style: CustomDialog.style),
          content: Text(content, style: CustomDialog.style),
          elevation: 24.0,
          backgroundColor: Colors.purple,
          actions: <Widget>[
            FlatButton(child: Text('Legal!',
              style: CustomDialog.style),
              onPressed: () => Navigator.of(context).pushReplacementNamed('/') 
          ), 
          ],
        );
      }
    );
  }
}