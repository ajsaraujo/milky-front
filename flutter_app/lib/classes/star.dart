import 'package:flutter_app/classes/entity.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/custom_form_field.dart'; 
import 'package:flutter_app/widgets/custom_button.dart';
import 'package:flutter_app/control/validator.dart';

class Star extends Entity {
  int _age; 
  int _distanceToEarth; 
  int _gravity; 
  int _size; 
  bool _hasSatellite; 
  bool _isBlackhole; 
  bool _isDead; 
  String _starType; 

  // Na regra de negócio, a classe Star não possui atributo _name.
  // Entretanto, sua classe filha, ColoredStar, possui tal atributo,
  // por isso este foi mantido no super-construtor. 

  // Para criar um objeto Star sem nome, basta passar null para 
  // o construtor.  
  Star(int id, String name, this._age, this._distanceToEarth, this._gravity, 
    this._size, this._hasSatellite, this._isBlackhole, this._isDead, this._starType)
    : super(name, id);  

  @override 
  Widget makeForm(bool isCreationForm) {
    final formKey = GlobalKey<FormState>(); 
    
    final nameField = CustomFormField(
      initialValue: isCreationForm ? '' : this.name,
      labelText: 'Nome',
      validator: Validator.validateEntityName,
      onSaved: (String val) => print('Nome: ${val}'),
    );

    final gravityField = CustomFormField(
      initialValue: isCreationForm ? '' : _gravity.toString(),
      labelText: 'Gravidade',
      inputType: TextInputType.number,
      validator: Validator.validateNumber,
      onSaved: (String val) => print('Gravidade: $val'),
    );

    final distanceToEarthField = CustomFormField(
      initialValue: isCreationForm ? '' : this._distanceToEarth.toString(),
      labelText: 'Distância da terra',
      inputType: TextInputType.number,
      validator: Validator.validateNumber,
      onSaved: (String val) => print('Distancia: ${val}')
    ); 

    final ageField = CustomFormField(
      initialValue: isCreationForm ? '' : this._age.toString(),
      labelText: 'Idade',
      inputType: TextInputType.number,
      validator: Validator.validateNumber,
      onSaved: (String val) => print('Idade: ${val}'),
    );

    final submitButton = CustomButton(
      text: 'Confirmar', 
      onPressed: () {
        if (formKey.currentState.validate()) {
          print('Salvando mudanças'); 
          formKey.currentState.save(); 
        }
      },
    );

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          nameField, 
          SizedBox(height: 40.0), 
          gravityField, 
          SizedBox(height: 40.0), 
          distanceToEarthField,
          SizedBox(height: 40.0), 
          ageField,
          SizedBox(height: 90.0), 
          submitButton
        ], 
    ));
  }
}