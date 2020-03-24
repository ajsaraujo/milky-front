import 'package:flutter/material.dart'; 
import 'package:flutter_app/classes/entity.dart'; 
import 'package:flutter_app/control/connection.dart'; 

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

  static Widget showDeleteDialog({BuildContext context, String title, String content, Entity entity, GlobalKey<ScaffoldState> scaffoldKey}) {
    showDialog(
      context: context, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Deseja deletar ${entity.arcticle} ${entity.type} ${entity.id}?', style: style), 
          elevation: 24.0,
          backgroundColor: Colors.purple,
          actions: <Widget>[
            FlatButton(child: Text('Sim', 
              style: TextStyle(fontFamily: 'Montserrat', color: Colors.white)),
              onPressed: () {
                Connection.deleteEntity(entity, scaffoldKey); 
                Navigator.of(context).pop(); 
              } 
            ), 
            FlatButton(child: Text('Cancelar',
              style: TextStyle(fontFamily: 'Montserrat', color: Colors.white)),
              onPressed: () => Navigator.of(context).pop(), 
            ),
          ],
        );
      });
  }
}