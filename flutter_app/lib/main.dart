import 'package:flutter/material.dart';
import 'package:flutter_app/screens/login.dart'; 
import 'package:flutter_app/screens/dashboard.dart'; 
import 'package:flutter_app/screens/listGalaxy.dart';
import 'package:flutter_app/screens/list_all.dart';

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
      home: Dashboard(),
    );
  }
}