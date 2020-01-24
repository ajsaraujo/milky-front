import 'package:flutter_app/classes/entity.dart'; 

class Satellite extends Entity {
  int _composition; 
  int _mass; 

  Satellite(String name, int id, this._composition, this._mass)
    : super(name, id); 
}