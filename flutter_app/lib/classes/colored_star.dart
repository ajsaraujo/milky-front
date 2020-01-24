import 'package:flutter_app/classes/star.dart'; 

class ColoredStar extends Star {
  int _size;
  int _mass; 
  String _type; 

  // A String type pode assumir um entre os 4 valores a seguir:
  // 'red-dwarf', 'white-dwarf', 'blue-giant' ou 'red-giant'.

  // O atributo death só precisa ser informado quando a estrela
  // for do tipo Red Dwarf. Caso contrário, este pode ser pas-
  // sado como null.  
  ColoredStar(int id, String name, int age, int gravity, 
  int distanceToEarth, this._size, this._mass, this._type)
    : super(id, name, age, distanceToEarth, gravity); 
}