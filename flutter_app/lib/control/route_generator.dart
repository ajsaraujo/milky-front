import 'package:flutter/material.dart';
import 'package:flutter_app/screens/edit.dart';
import 'package:flutter_app/screens/login.dart'; 
import 'package:flutter_app/screens/list_all.dart'; 
import 'package:flutter_app/screens/new_entity.dart'; 
import 'package:flutter_app/screens/sign_up.dart'; 
import 'package:flutter_app/control/string_tuple.dart'; 
import 'package:flutter_app/screens/dashboard.dart'; 
import 'package:flutter_app/classes/entity.dart'; 

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments; 

    switch (settings.name) {
      case '/dashboard': 
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/':
        return MaterialPageRoute(builder: (_) => Dashboard()); 
      case '/sign_up':
        print('Eu cheguei no RouteGenerator!'); 
        return MaterialPageRoute(builder: (_) => SignUpScreen()); 
      case '/list_all':
        if (args is StringTuple)
          return MaterialPageRoute(
            builder: (_) => ListAll(args));
        return _errorRoute(); 
      case '/new_entity':
        if (args is StringTuple) {
          final myPage = NewEntity(args); 
          return MaterialPageRoute(
            builder: (_) => myPage,
            maintainState: true,
          );
        }
        return _errorRoute(); 
      case '/show_entity': 
        if (args is Entity) {
          final myPage = EditScreen(entity: args); 
          return MaterialPageRoute(
            builder: (_) => myPage,
            maintainState: true,
          ); 
        }
        return _errorRoute();  
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('ERROR'), 
        ),
        body: Center(
          child: Text('ERROR'),
        ));
    });
  }
}