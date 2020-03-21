import 'package:flutter/material.dart'; 
import 'package:flutter_app/classes/galaxy.dart'; 
import 'package:flutter_app/classes/planet.dart'; 
import 'package:flutter_app/classes/satellite.dart';
import 'package:flutter_app/classes/system.dart';
import 'package:flutter_app/classes/star.dart';
import 'package:flutter_app/classes/colored_star.dart'; 
import 'package:flutter_app/control/string_tuple.dart';

class Entity {
  String _name; 
  int _id;

  Entity(this._name, this._id);

  String get name => this._name;

  int get id => this._id;

  static Entity parseJson(dynamic json, StringTuple st) { 
    switch (st.controlName) {
      case 'galaxy':
        return Galaxy(json['name'], json['id'], json['numOfSystems'], 
                      json['distanceToEarth']);
      case 'planet':
        print('estou tentando fazer um planeta...'); 
        return Planet(json['name'], json['id'], json['size'], json['mass'], 
                      json['gravity'], json['composition']);
      case 'satellite':
        return Satellite(json['name'], json['id'], json['composition'], 
                         json['mass']);
      case 'system':
        return System(json['name'], json['id'], json['numOfPlanets'], 
                json['numOfStars'], json['age']);
      case 'star':
        return Star(json['id'], json['name'], json['age'], json['distanceToEarth'],
                    json['gravity']); 
      case 'colored_star':
        return ColoredStar(json['id'], json['name'], json['age'], json['gravity'], 
                           json['distanceToEarth'], json['size'], json['mass'],
                           json['starType']);
      default: 
        return Entity('Something went wrong', 0); 
    }
  }
  
  // Esse ListTile será utilizado para construir 
  // a ListView nas telas de listagem. 
  Widget makeListTile() {
    return ListTile(
      title: Text(this._name), 
      subtitle: Text('#${this._id}'),
    );
  }
}