import 'package:flutter/material.dart'; 
import 'package:flutter_app/control/string_tuple.dart';
import 'package:flutter_app/widgets/custom_app_bar.dart'; 
import 'package:flutter_app/classes/star.dart';
import 'package:flutter_app/classes/planet.dart';
import 'package:flutter_app/classes/galaxy.dart'; 
import 'package:flutter_app/classes/satellite.dart'; 
import 'package:flutter_app/classes/system.dart'; 
import 'package:flutter_app/classes/entity.dart'; 



class NewEntity extends StatefulWidget {
  StringTuple _myStringTuple;

  NewEntity(this._myStringTuple); 

  @override
  _NewEntityState createState() => _NewEntityState();
}

class _NewEntityState extends State<NewEntity> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  
  Widget makeTextFormField(String fieldLabel, String fieldType) {
    return TextFormField(
      keyboardType: fieldType == 'number' ? TextInputType.number : TextInputType.text,
      obscureText: false,
      style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
      decoration: InputDecoration(
        hintText: fieldLabel
      ),
      onSaved: (value) {}
    );
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> myFields = List<Widget>(); 

    myFields.add(makeTextFormField('Nome', 'text'));
    SizedBox(height: 40.0); 
    myFields.add(makeTextFormField('id', 'number')); 
    SizedBox(height: 40.0);

    Entity myEntity; 

    switch (widget._myStringTuple.controlName) {
      case 'star':
        myFields.add(makeTextFormField('Massa', 'number')); 
        SizedBox(height: 40.0);
        myFields.add(makeTextFormField('Distância da terra', 'number'));
        SizedBox(height: 40.0);        
        myFields.add(makeTextFormField('Gravidade', 'number'));
        SizedBox(height: 40.0);                
        myFields.add(makeTextFormField('Idade', 'number'));
        break; 
      case 'planet':
        myFields.add(makeTextFormField('Tamanho', 'number'));
        SizedBox(height: 100.0);
        myFields.add(makeTextFormField('Massa', 'number'));
        SizedBox(height: 100.0);
        myFields.add(makeTextFormField('Gravidade', 'number')); 
        SizedBox(height: 100.0);
        myFields.add(makeTextFormField('Composição', 'text')); 
        break;
      case 'galaxy':
        myEntity = Galaxy(null, null, null, null); 
        myFields.add(makeTextFormField('Número de sistemas', 'number')); 
        SizedBox(height: 100.0);
        myFields.add(makeTextFormField('Distância da terra', 'number')); 
        break; 
      case 'satellite':
        myFields.add(makeTextFormField('Composição', 'text')); 
        SizedBox(height: 10.0);
        myFields.add(makeTextFormField('Massa', 'number'));
        break; 
      case 'system':
        myEntity = System(null, null, null, null, null, ); 
        myFields.add(makeTextFormField('Número de planetas', 'number'));
        SizedBox(height: 10.0);
        myFields.add(makeTextFormField('Número de estrelas', 'number')); 
        SizedBox(height: 10.0);
        myFields.add(makeTextFormField('Idade', 'number')); 
        break; 
      default:
        myFields.add(makeTextFormField('Erro', 'text'));  
    }
    
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Criar nov${widget._myStringTuple.arcticle} ${widget._myStringTuple.viewName}'),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height, 
            color: Theme.of(context).accentColor, 
            child: Padding(
              padding: const EdgeInsets.all(36.0), 
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: myFields,)
              ),

            )
          )
        )
      )
    );
  }
}