import 'package:flutter_app/classes/entity.dart'; 

class Galaxy extends Entity {
  int _numOfSystems; 
  int _distanceToEarth; 

  Galaxy(String name, int id, this._numOfSystems, this._distanceToEarth)
    : super(name, id); 
}