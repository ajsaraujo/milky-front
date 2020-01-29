import 'package:flutter/material.dart';
import 'package:flutter_app/control/route_generator.dart'; 

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Milky App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.white,
      ),
      // Agora que estamos administrando o roteamento com a classe
      // RouteGenerator, initialRoute cumpre o papel do 'home'. 
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute
    );
  }
}