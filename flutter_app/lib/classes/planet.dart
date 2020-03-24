import 'package:flutter_app/widgets/custom_form_field.dart'; 
import 'package:flutter_app/widgets/custom_button.dart';
import 'package:flutter_app/classes/entity.dart'; 
import 'package:flutter_app/control/validator.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter_app/control/connection.dart'; 

class Planet extends Entity {
  int _size;
  int _mass; 
  int _rotationSpeed;
  String _composition; 
  bool _hasSatellite; 

  Planet (String name, int id, this._size, this._mass, this._rotationSpeed, this._composition,
    this._hasSatellite)
    : super(name, id); 

  @override
  String get type => 'Planeta'; 
  @override
  String get arcticle => 'o'; 
  String get controlName => 'planet';  

  @override 
  String toJson() {
    return '{"size": ${_size}, "name": "${name}", "weight": ${_mass}, "rotationSpeed": ${_rotationSpeed}, "composition": "${_composition}", "hasSatellite": ${_hasSatellite}}';
  }
  @override 
  Widget makeForm(bool isCreationForm, GlobalKey<ScaffoldState> scaffoldKey) {
    final formKey = GlobalKey<FormState>(); 
    
    final nameField = CustomFormField(
      initialValue: !isCreationForm ? this.name ?? '' : '',
      labelText: 'Nome',
      validator: Validator.validateEntityName,
      onSaved: (String val) => name = val,
    );

    final compositionField = CustomFormField(
      initialValue: !isCreationForm ? _composition ?? '' : '',
      labelText: 'Composição',
      validator: Validator.validateLongString,
      onSaved: (String val) => _composition = val
    ); 

    final massField = CustomFormField(
      initialValue: !isCreationForm ? _mass.toString() ?? '' : '',
      labelText: 'Massa',
      inputType: TextInputType.number,
      validator: Validator.validateNumber,
      onSaved: (String val) => _mass = int.parse(val),
    ); 

    final rotationSpeedField = CustomFormField(
      initialValue: isCreationForm ? '' : _rotationSpeed.toString() ?? '',
      labelText: 'Velocidade de rotação',
      inputType: TextInputType.number,
      validator: Validator.validateNumber,
      onSaved: (String val) => _rotationSpeed = int.parse(val),
    );

    final submitButton = CustomButton(
      text: 'Confirmar', 
      onPressed: () {
        print('Botao pressionado...');
        if (formKey.currentState.validate()) {
          formKey.currentState.save(); 
          print('Editar entidade'); 
          Connection.updateEntity(this, 'planet', scaffoldKey); 
        }
      }
    );

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          nameField,
          SizedBox(height: 40.0),
          compositionField,
          SizedBox(height: 40.0), 
          massField,
          SizedBox(height: 40.0), 
          rotationSpeedField,
          SizedBox(height: 40.0), 
          massField,  
          SizedBox(height: 70.0), 
          submitButton
        ], 
    ));
  }
}