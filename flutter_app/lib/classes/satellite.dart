import 'package:flutter_app/classes/entity.dart'; 
import 'package:flutter/material.dart'; 
import 'package:flutter_app/widgets/custom_form_field.dart'; 
import 'package:flutter_app/control/validator.dart'; 
import 'package:flutter_app/widgets/custom_button.dart'; 

class Satellite extends Entity {
  String _composition; 
  int _mass; 
  int _size; 

  Satellite(String name, int id, this._composition, this._mass, this._size)
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

    final compositionField = CustomFormField(
      initialValue: isCreationForm ? '' : _composition,
      labelText: 'Composição',
      validator: Validator.validateLongString,
      onSaved: (String val) => print('Comp: ${val}')
    ); 

    final massField = CustomFormField(
      initialValue: isCreationForm ? '' : _mass.toString(),
      labelText: 'Massa',
      inputType: TextInputType.number,
      validator: Validator.validateNumber,
      onSaved: (String val) => print('Massa: $val'),
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
          SizedBox(height: 90.0), 
          submitButton
        ], 
    ));
  }
} 