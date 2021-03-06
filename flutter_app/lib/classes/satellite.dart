import 'package:flutter_app/classes/entity.dart'; 
import 'package:flutter/material.dart'; 
import 'package:flutter_app/widgets/custom_form_field.dart'; 
import 'package:flutter_app/control/validator.dart'; 
import 'package:flutter_app/widgets/custom_button.dart'; 
import 'package:flutter_app/control/connection.dart'; 

class Satellite extends Entity {
  String _composition; 
  int _mass; 
  int _size; 

  Satellite(String name, int id, this._composition, this._mass, this._size)
    : super(name, id); 

  Satellite.emptySatellite() : super.emptyEntity();

  String get type => 'Satélite'; 
  String get arcticle => 'o';
  String get controlName => 'satellite';  

  Satellite fromJson(dynamic json) {
    return Satellite(json['name'], 
                     json['satellite_id'], 
                     json['composition'], 
                     json['weight'],
                     json['size']);
  }

  String toJson() {
    return '{"name": "$name", "composition": "$_composition", "weight": $_mass, "size": $_size }';
  }

  Widget makeForm(bool isCreationForm, GlobalKey<ScaffoldState> scaffoldKey) {
    final formKey = GlobalKey<FormState>(); 
    
    final nameField = CustomFormField(
      initialValue: isCreationForm ? '' : this.name ?? '',
      labelText: 'Nome',
      validator: Validator.validateEntityName,
      onSaved: (String val) => name = val,
    );

    final compositionField = CustomFormField(
      initialValue: isCreationForm ? '' : _composition ?? '',
      labelText: 'Composição',
      validator: Validator.validateLongString,
      onSaved: (String val) => _composition = val, 
    ); 

    final massField = CustomFormField(
      initialValue: isCreationForm ? '' : _mass.toString() ?? '',
      labelText: 'Massa',
      inputType: TextInputType.number,
      validator: Validator.validateNumber,
      onSaved: (String val) => _mass = int.parse(val),
    );

    final submitButton = CustomButton(
      text: 'Confirmar', 
      onPressed: () {
        print('Botao pressionado...');
        if (formKey.currentState.validate()) {
          formKey.currentState.save(); 
          print('Editar entidade'); 
          Connection.updateEntity(this, 'satellite', scaffoldKey); 
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
          SizedBox(height: 90.0), 
          submitButton
        ], 
    ));
  }
} 