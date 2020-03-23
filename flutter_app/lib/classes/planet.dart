import 'package:flutter_app/widgets/custom_form_field.dart'; 
import 'package:flutter_app/widgets/custom_button.dart';
import 'package:flutter_app/classes/entity.dart'; 
import 'package:flutter_app/control/validator.dart'; 
import 'package:flutter/material.dart';

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
  Widget makeForm(bool isCreationForm) {
    final formKey = GlobalKey<FormState>(); 
    
    final nameField = CustomFormField(
      initialValue: !isCreationForm ? this.name : '',
      labelText: 'Nome',
      validator: Validator.validateEntityName,
      onSaved: (String val) => print('Nome: ${val}'),
    );

    final compositionField = CustomFormField(
      initialValue: !isCreationForm ? _composition : '',
      labelText: 'Composição',
      validator: Validator.validateLongString,
      onSaved: (String val) => print('Comp: ${val}')
    ); 

    final massField = CustomFormField(
      initialValue: !isCreationForm ? _mass.toString() : '',
      labelText: 'Massa',
      inputType: TextInputType.number,
      validator: Validator.validateNumber,
      onSaved: (String val) => print('Massa: $val'),
    ); 

    final rotationSpeedField = CustomFormField(
      initialValue: isCreationForm ? '' : _rotationSpeed.toString(),
      labelText: 'Velocidade de rotação',
      inputType: TextInputType.number,
      validator: Validator.validateNumber,
      onSaved: (String val) => print('VelRot: $val'),
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