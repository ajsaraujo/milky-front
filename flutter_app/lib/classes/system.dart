import 'package:flutter_app/classes/entity.dart'; 
import 'package:flutter/material.dart'; 
import 'package:flutter_app/widgets/custom_form_field.dart'; 
import 'package:flutter_app/control/validator.dart'; 
import 'package:flutter_app/widgets/custom_button.dart'; 

class System extends Entity {
  int _numOfPlanets; 
  int _numOfStars; 
  int _age; 

  System(String name, int id, this._numOfPlanets, this._numOfStars, this._age)
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

    final numOfPlanetsField = CustomFormField(
      initialValue: isCreationForm ? '' : _numOfPlanets.toString(),
      labelText: 'Número de planetas',
      inputType: TextInputType.number,
      validator: Validator.validateNumber,
      onSaved: (String val) => print('Número de planetas: $val'),
    );

    final numOfStarsField = CustomFormField(
      initialValue: isCreationForm ? '' : this._numOfStars.toString(),
      labelText: 'Número de estrelas',
      inputType: TextInputType.number,
      validator: Validator.validateNumber,
      onSaved: (String val) => print('Número de estrelas: ${val}')
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
          numOfPlanetsField, 
          SizedBox(height: 40.0), 
          numOfStarsField,
          SizedBox(height: 90.0), 
          submitButton
        ], 
    ));
  }
}