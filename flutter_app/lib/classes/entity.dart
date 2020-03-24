import 'package:flutter/material.dart'; 
import 'package:flutter_app/classes/galaxy.dart'; 
import 'package:flutter_app/classes/planet.dart'; 
import 'package:flutter_app/classes/satellite.dart';
import 'package:flutter_app/classes/system.dart';
import 'package:flutter_app/classes/star.dart';
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
  
  // Função sobrescrita pelas classes filhas. 
  String toJson() {
    return null; 
  }
  
  static Entity parseJson(dynamic json, String entityType) { 
    switch (entityType) {
      case 'galaxy':
        return Galaxy(json['name'], json['galaxy_id'], json['earth_distance'], 
          json['num_of_systems']); 
      case 'planet':
        return Planet(json['name'], json['planet_id'], json['size'], json['weight'],
          json['rotation_speed'], json['composition'], json['has_satellite']); 
      case 'satellite':
        return Satellite(json['name'], json['satellite_id'], json['composition'], 
                         json['weight'], json['size']);
      case 'planetarySystem':
        return System(json['name'], json['system_id'], json['num_of_planets'], 
                json['num_of_stars'], json['age']);
      case 'star':
        return Star(json['star_id'], json['name'], json['age'], json['distance_to_earth'],
          json['gravity'], json['size'], json['has_satellite'], json['is_blackhole'],
          json['is_dead'], json['startype']); 
      default: 
        print('Ops, algo deu errado!'); 
        print(entityType);
    }
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