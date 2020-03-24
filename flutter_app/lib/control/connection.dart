import 'package:connectivity/connectivity.dart';
import 'package:flutter_app/classes/entity.dart'; 
import 'package:flutter_app/widgets/error_snackbar.dart'; 
import 'package:flutter/material.dart'; 
import 'dart:convert'; 
import 'package:http/http.dart' as http;

class Connection {
  static const Map<String, String> headers = {"Content-type": "application/json"};
  
  static String hostname() {
    var location = 'cloud'; 
    
    switch (location) {
      case 'cloud':
        return 'https://milkyandbeyond.herokuapp.com'; 
      case 'nelson':
        return 'http://192.168.1.5:3000'; 
      case 'allan':
        return 'http://192.168.1.12:3000';
      case 'allanPhone':
        return 'http://172.16.5.67:3000'; 
      case 'shoppingJardins':
        return 'http://172.16.5.67:3000';
    }
  }

  static Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity()); 
    if (connectivityResult == ConnectivityResult.mobile) 
      return true; 
    if (connectivityResult == ConnectivityResult.wifi)
      return true; 
    return false; 
  }

  static void deleteEntity(Entity e, GlobalKey<ScaffoldState> scaffoldKey) async {
    final data = await http.delete('${Connection.hostname()}/api/${e.controlName}/${e.id}');
    if (data.statusCode == 200) {
      print('nice'); 
    } else {
      print('batendo na url ${Connection.hostname()}/api/${e.controlName}/${e.id}');
      print('${data.statusCode}');
      print('o-oh'); 
    }
  }

  static void updateEntity(Entity e, String entityType, GlobalKey<ScaffoldState> scaffoldKey) async {
    final isConnected = await Connection.isConnected(); 

    if (!isConnected) {
      final noConnectionSnackBar = ErrorSnackBar(
        errorMessage: 'Conecte-se à internet.', 
        scaffoldKey: scaffoldKey
      ); 

      noConnectionSnackBar.display(); 
      return;  
    }

    final waitingSnackBar = ErrorSnackBar(
      errorMessage: 'Salvando mudanças...', 
      duration: Duration(minutes: 1), 
      backgroundColor: Colors.purple, 
      scaffoldKey: scaffoldKey,
    );

    waitingSnackBar.display(); 

    final jsonString = e.toJson(); 
    print('Request batendo em ${Connection.hostname()}/api/$entityType/${e.id}');
    final data = await http.put('${Connection.hostname()}/api/$entityType/${e.id}',
      body: jsonString, 
      headers: Connection.headers
    ); 

    scaffoldKey.currentState.removeCurrentSnackBar(); 

    if (data.statusCode == 200) {
      print('ok'); 
    } else {
      print(data.statusCode);
      print(data.body);
      print('deu merda'); 
    }
  }
}