import 'package:flutter/material.dart'; 
import 'package:flutter_app/widgets/custom_button.dart';
import 'package:flutter_app/widgets/custom_dialog.dart'; 

class Entity {
  String _name; 
  String _arcticle; 
  int _id;

  Entity(this._name, this._id);

  // Getters 
  int get id => this._id;
  String get name => this._name;
  String get arcticle => 'a'; 
  String get type => 'Entidade';
  String get controlName => 'entity';  
  
  // Setter 
  void set name(String name) => this._name = name;  
  
  // JSON
  String toJson() {
    return null; 
  }
  
  Entity fromJson(dynamic json) {
    return Entity(json['name'], -1); 
  }
  
  Widget makeListTile(BuildContext context) {
    return ListTile(
      title: Text(this._name), 
      subtitle: Text('#${this._id}'),
      onTap: () => Navigator.of(context).pushNamed('/show_entity',
        arguments: this,  
      ),
      onLongPress: () => CustomDialog.showDeleteDialog(
        context: context, 
        entity: this 
      )
    );
  }

  Widget makeForm(bool isCreationForm, GlobalKey<ScaffoldState> scaffoldKey) {
    final formKey = GlobalKey<FormState>(); 

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
          submitButton
        ], 
    ));
  }
}