import 'package:flutter_app/classes/entity.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/custom_button.dart'; 
import 'package:flutter_app/widgets/custom_form_field.dart'; 
import 'package:flutter_app/control/validator.dart';
import 'package:flutter_app/control/connection.dart'; 

class Galaxy extends Entity {
  int _numOfSystems; 
  int _distanceToEarth; 

  static GlobalKey<FormState> formKey;  

  Galaxy(String name, int id, this._numOfSystems, this._distanceToEarth)
    : super(name, id);
  
  Galaxy.emptyGalaxy() : super.emptyEntity();

  int get numOfSystems => this._numOfSystems;
  int get distanceToEarth => this._distanceToEarth;
  String get arcticle => 'a'; 
  String get controlName => 'galaxy';
  String get type => 'Galáxia'; 

  Galaxy fromJson(dynamic json) {
    return Galaxy(json['name'], json['galaxy_id'], json['earth_distance'], 
          json['num_of_systems']);
  }
  
  String toJson() {
    return '{"name": "${name}", "numOfSystems": ${_numOfSystems}, "earthDistance": ${distanceToEarth}}';
  }
  
  Widget makeForm(bool isCreationForm, GlobalKey<ScaffoldState> scaffoldKey) {
    formKey = GlobalKey<FormState>(); 

    final nameField = CustomFormField(
      initialValue: isCreationForm ? '' : this.name ?? '',
      labelText: 'Nome',
      validator: Validator.validateEntityName,
      onSaved: (String val) => super.name = val,
    );

    final numOfSystemsField = CustomFormField(
      initialValue: isCreationForm ? '' : this._numOfSystems.toString() ?? '',
      labelText: 'Número de sistemas',
      validator: Validator.validateNumber, 
      inputType: TextInputType.number,
      onSaved: (String val) => _numOfSystems = int.parse(val)
    ); 

    final distanceToEarthField = CustomFormField(
      initialValue: !isCreationForm ? this._distanceToEarth.toString() ?? '' : '',
      labelText: 'Distância da terra',
      inputType: TextInputType.number,
      validator: Validator.validateNumber,
      onSaved: (String val) => _distanceToEarth = int.parse(val)
    ); 

    final submitButton = CustomButton(
      text: 'Confirmar', 
      onPressed: () {
        print('Botao pressionado...');
        if (formKey.currentState.validate()) {
          formKey.currentState.save(); 
          print('Editar entidade'); 
          Connection.updateEntity(this, 'galaxy', scaffoldKey); 
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
          numOfSystemsField,
          SizedBox(height: 40.0), 
          distanceToEarthField, 
          SizedBox(height: 90.0), 
          submitButton
        ], 
    ));
  }
}