import 'package:flutter/material.dart';
import 'package:flutter_app/screens/login.dart'; 
import 'package:flutter_app/screens/list_all.dart'; 
import 'package:flutter_app/control/string_tuple.dart'; 

// Um RouteGenerator permite que façamos o roteamento passando
// dados para as páginas que estão sendo criadas. Isto será
// especialmente importante para a tela de listagem de uma entidade
// específica. 
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Argumentos que foram passados na chamada de Navigator.pushNamed(). 
    final args = settings.arguments; 

    switch (settings.name) {
      case '/': 
        return MaterialPageRoute(builder: (_) => LoginScreen()); 
      case '/list_all':
        // O programa espera que args contenha duas Strings, uma contendo
        // o nome da entidade no formato entityType e outra no formato que será
        // exibido para o usuário. 
        // Ex: ['galaxy', 'Galáxias'], ['planet', 'Planetas']... 
        if (args is StringTuple)
          return MaterialPageRoute(
            builder: (_) => ListAll(args));
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