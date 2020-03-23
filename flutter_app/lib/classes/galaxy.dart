import 'package:flutter_app/classes/entity.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/custom_button.dart'; 
import 'package:flutter_app/widgets/custom_form_field.dart'; 
import 'package:flutter_app/control/validator.dart';
import 'package:flutter_app/widgets/custom_scaffold.dart'; 

class Galaxy extends Entity {
  int _numOfSystems; 
  int _distanceToEarth; 

  static GlobalKey<FormState> formKey;  
  static GlobalKey<ScaffoldState> scaffoldKey; 

  Galaxy(String name, int id, this._numOfSystems, this._distanceToEarth)
    : super(name, id);

  int get numOfSystems => this._numOfSystems;
  int get distanceToEarth => this._distanceToEarth;
  String get type => 'Galáxia'; 

  @override 
  Widget makeForm(bool isCreationForm) {
    formKey = GlobalKey<FormState>(); 
    
    final nameField = CustomFormField(
      initialValue: isCreationForm ? '' : this.name,
      labelText: 'Nome',
      validator: Validator.validateEntityName,
      onSaved: (String val) => print('Nome: ${val}'),
    );

    final numOfSystemsField = CustomFormField(
      initialValue: isCreationForm ? '' : this._numOfSystems.toString(),
      labelText: 'Número de sistemas',
      validator: Validator.validateNumber, 
      inputType: TextInputType.number,
      onSaved: (String val) => print('Numero de sistemas: ${val}')
    ); 

    final distanceToEarthField = CustomFormField(
      initialValue: !isCreationForm ? this._distanceToEarth.toString() : '',
      labelText: 'Distância da terra',
      inputType: TextInputType.number,
      validator: Validator.validateNumber,
      onSaved: (String val) => print('Distancia: ${val}')
    ); 

    final submitButton = CustomButton(
      text: 'Confirmar', 
      onPressed: () {
        print('Botao pressionado...');
        if (formKey.currentState.validate()) {
          formKey.currentState.save(); 
          print('Editar entidade'); 
          // Fazer conexão 
          // Mostrar dialog caso tenha dado tudo certo
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