import 'package:flutter_app/classes/entity.dart'; 
import 'package:flutter/material.dart'; 
import 'package:flutter_app/widgets/custom_form_field.dart'; 
import 'package:flutter_app/control/validator.dart'; 
import 'package:flutter_app/widgets/custom_button.dart'; 
import 'package:flutter_app/control/connection.dart'; 

class System extends Entity {
  int _numOfPlanets; 
  int _numOfStars; 
  int _age; 

  System(String name, int id, this._numOfPlanets, this._numOfStars, this._age)
    : super(name, id); 

  @override
  String toJson() {
    return '{"name": "$name", "numOfPlanets": $_numOfPlanets, "numOfStars": $_numOfStars, "age": $_age}';
  }
  
  @override 
  String get controlName => 'planetarySystem';  
  @override 
  String get arcticle => 'o'; 
  @override 
  String get type => 'Sistema Planetário'; 
  @override 
  Widget makeForm(bool isCreationForm, GlobalKey<ScaffoldState> scaffoldKey) {
    final formKey = GlobalKey<FormState>(); 
    
    final nameField = CustomFormField(
      initialValue: isCreationForm ? '' : this.name ?? '',
      labelText: 'Nome',
      validator: Validator.validateEntityName,
      onSaved: (String val) => name = val,
    );

    final numOfPlanetsField = CustomFormField(
      initialValue: isCreationForm ? '' : _numOfPlanets.toString() ?? '',
      labelText: 'Número de planetas',
      inputType: TextInputType.number,
      validator: Validator.validateNumber,
      onSaved: (String val) => _numOfPlanets = int.parse(val),
    );

    final numOfStarsField = CustomFormField(
      initialValue: isCreationForm ? '' : this._numOfStars.toString() ?? '',
      labelText: 'Número de estrelas',
      inputType: TextInputType.number,
      validator: Validator.validateNumber,
      onSaved: (String val) => _numOfStars = int.parse(val), 
    ); 

    final submitButton = CustomButton(
      text: 'Confirmar', 
      onPressed: () {
        if (formKey.currentState.validate()) {
          print('Salvando mudanças'); 
          formKey.currentState.save(); 
          Connection.updateEntity(this, 'planetarySystem', scaffoldKey); 
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
          numOfPlanetsField, 
          SizedBox(height: 40.0), 
          numOfStarsField,
          SizedBox(height: 90.0), 
          submitButton
        ], 
    ));
  }
}