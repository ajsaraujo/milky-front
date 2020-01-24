import 'package:flutter_app/classes/entity.dart'; 

class System extends Entity {
  int _numOfPlanets; 
  int _numOfStars; 
  int _age; 

  System(String name, int id, this._numOfPlanets, this._numOfStars, this._age)
    : super(name, id); 
}