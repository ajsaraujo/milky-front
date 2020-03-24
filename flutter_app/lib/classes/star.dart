import 'package:flutter_app/classes/entity.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/custom_form_field.dart'; 
import 'package:flutter_app/widgets/custom_button.dart';
import 'package:flutter_app/control/validator.dart';
import 'package:flutter_app/control/connection.dart'; 

class Star extends Entity {
  int _age; 
  int _distanceToEarth; 
  int _gravity; 
  int _size; 
  bool _hasSatellite; 
  bool _isBlackhole; 
  bool _isDead; 
  String _starType; 

  Star(int id, String name, this._age, this._distanceToEarth, this._gravity, 
    this._size, this._hasSatellite, this._isBlackhole, this._isDead, this._starType)
    : super(name, id);  

  String get controlName => 'star';  
  String get arcticle => 'a'; 
  String get type => 'Estrela'; 

  Star fromJson(dynamic json) {
    return Star(json['star_id'], 
                json['name'], 
                json['age'], 
                json['distance_to_earth'],
                json['gravity'], 
                json['size'], 
                json['has_satellite'], 
                json['is_blackhole'],
                json['is_dead'], 
                json['startype']); 
  }
  
  String toJson() {
    return '{"name": "$name", "age": $_age, "earthDistance": $_distanceToEarth, "gravity": $_gravity, "size": $_size, "hasSatellite": $_hasSatellite, "isBlackhole": $_isBlackhole, "isDead": $_isDead, "startype": "$_starType"}';
  }

  Widget makeForm(bool isCreationForm, GlobalKey<ScaffoldState> scaffoldKey) {
    final formKey = GlobalKey<FormState>(); 
    
    final nameField = CustomFormField(
      initialValue: isCreationForm ? '' : this.name ?? '',
      labelText: 'Nome',
      validator: Validator.validateEntityName,
      onSaved: (String val) => name = val,
    );

    final gravityField = CustomFormField(
      initialValue: isCreationForm ? '' : _gravity.toString() ?? '',
      labelText: 'Gravidade',
      inputType: TextInputType.number,
      validator: Validator.validateNumber,
      onSaved: (String val) => _gravity = int.parse(val),
    );

    final distanceToEarthField = CustomFormField(
      initialValue: isCreationForm ? '' : this._distanceToEarth.toString() ?? '',
      labelText: 'Distância da terra',
      inputType: TextInputType.number,
      validator: Validator.validateNumber,
      onSaved: (String val) => _distanceToEarth = int.parse(val),
    ); 

    final ageField = CustomFormField(
      initialValue: isCreationForm ? '' : this._age.toString() ?? '',
      labelText: 'Idade',
      inputType: TextInputType.number,
      validator: Validator.validateNumber,
      onSaved: (String val) => _age = int.parse(val),
    );

    final submitButton = CustomButton(
      text: 'Confirmar', 
      onPressed: () {
        if (formKey.currentState.validate()) {
          print('Salvando mudanças'); 
          formKey.currentState.save();
          Connection.updateEntity(this, 'star', scaffoldKey); 
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