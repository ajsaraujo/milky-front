import 'package:flutter_app/classes/entity.dart'; 

class Star extends Entity {
  int _age; 
  int _distanceToEarth; 
  int _gravity; 

  // Na regra de negócio, a classe Star não possui atributo _name.
  // Entretanto, sua classe filha, ColoredStar, possui tal atributo,
  // por isso este foi mantido no super-construtor. 

  // Para criar um objeto Star sem nome, basta passar null para 
  // o construtor.  
  Star(int id, String name, this._age, this._distanceToEarth, this._gravity)
    : super(name, id);  
}