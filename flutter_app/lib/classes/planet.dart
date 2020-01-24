import 'package:flutter_app/classes/entity.dart'; 

class Planet extends Entity {
  int _size;
  int _mass; 
  int _gravity;
  int _composition; 

  Planet (String name, int id, this._size, this._mass, this._gravity, this._composition)
    : super(name, id); 
}