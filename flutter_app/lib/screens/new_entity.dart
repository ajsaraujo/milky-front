import 'package:flutter/material.dart'; 
import 'package:flutter_app/control/string_tuple.dart';
import 'package:flutter_app/widgets/custom_app_bar.dart'; 
import 'package:flutter_app/control/validator.dart';
import 'package:flutter_app/widgets/custom_button.dart';
import 'package:flutter_app/widgets/custom_form_field.dart'; 

class NewEntity extends StatefulWidget {
  StringTuple _myStringTuple;

  NewEntity(this._myStringTuple); 

  @override
  _NewEntityState createState() => _NewEntityState();
}

class _NewEntityState extends State<NewEntity> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  Function nameLoader; 
  Function numOfSysLoader; 
  Function distanceToEarthLoader; 
  Function sizeLoader; 
  Function massLoader; 
  Function rotationSpeedLoader; 
  Function compositionLoader; 
  Function gravityLoader; 
  Function numOfPlanetsLoader; 
  Function numOfStarsLoader; 

  final nameField = CustomFormField(
      labelText: 'Nome', 
      validator: Validator.validateNickname, 
      onSaved: (String) { print('Something'); }
    );

  final numOfSysField = CustomFormField(
      labelText: 'Número de sistemas',
      validator: Validator.validateNumber, 
      inputType: TextInputType.number,
      onSaved: (String) { print('Something'); }
    ); 

    final distanceToEarthField = CustomFormField(
      labelText: 'Distância da terra', 
      validator: Validator.validateNumber, 
      inputType: TextInputType.number,
      onSaved: (String) { print('Something'); }
    ); 

    final sizeField = CustomFormField(
      labelText: 'Tamanho',
      validator: Validator.validateNumber,
      inputType: TextInputType.number, 
      onSaved: (String) { print('Something'); }
    ); 

    final massField = CustomFormField(
      labelText: 'Massa',
      validator: Validator.validateNumber, 
      inputType: TextInputType.number,
      onSaved: (String) { print('Something'); },
    ); 

    final rotationSpeedField = CustomFormField(
      labelText: 'Velocidade de Rotação', 
      validator: Validator.validateNumber,
      inputType: TextInputType.number,
      onSaved: (String) { print('Something'); }
    ); 

    final compositionField = CustomFormField(
      labelText: 'Composição',
      validator: Validator.validateLongString, 
      onSaved: (String) { print('Something'); }
    );

    final gravityField = CustomFormField(
      labelText: 'Gravidade', 
      validator: Validator.validateLongString, 
      onSaved: (String) { print('Something'); }
    ); 

    final numOfPlanetsField = CustomFormField(
      labelText: 'Número de planetas',
      validator: Validator.validateNumber,
      inputType: TextInputType.number,
      onSaved: (String) { print('Something'); },
    ); 

    final numOfStars = CustomFormField(
      labelText: 'Número de estrelas',
      validator: Validator.validateNumber, 
      inputType: TextInputType.number,
      onSaved: (String) { print('Something'); },
    ); 

    final ageField = CustomFormField(
      labelText: 'Idade', 
      validator: Validator.validateNumber, 
      inputType: TextInputType.number, 
      onSaved: (String) { print('Something'); }
    ); 

    final numOfStarsField = CustomFormField(
      labelText: 'Número de estrelas', 
      validator: Validator.validateNumber, 
      inputType: TextInputType.number,
      onSaved: (String) { print('Something'); }
    );
  
  @override
  Widget build(BuildContext context) {
    List<Widget> myFields = List<Widget>(); 

    myFields.add(nameField); 
    myFields.add(SizedBox(height: 40.0)); 

    switch (widget._myStringTuple.controlName) {
      case 'galaxy': 
        myFields.add(numOfSysField); 
        myFields.add(SizedBox(height: 40.0)); 
        myFields.add(distanceToEarthField);
        break;  
      case 'planet':
        myFields.add(sizeField); 
        myFields.add(SizedBox(height: 40.0)); 
        myFields.add(massField);
        myFields.add(SizedBox(height: 40.0)); 
        myFields.add(rotationSpeedField); 
        myFields.add(SizedBox(height: 40.0)); 
        myFields.add(compositionField); 
        //myFields.add(hasSatelliteField);
        break; 
      case 'satellite':
        myFields.add(compositionField);
        myFields.add(SizedBox(height: 40.0)); 
        myFields.add(sizeField);
        myFields.add(SizedBox(height: 40.0)); 
        myFields.add(massField);
        break; 
      case 'star':
        myFields.add(sizeField);
        myFields.add(SizedBox(height: 40.0)); 
        myFields.add(ageField); 
        myFields.add(SizedBox(height: 40.0)); 
        myFields.add(gravityField); 
        myFields.add(SizedBox(height: 40.0)); 
        myFields.add(distanceToEarthField); 
        myFields.add(SizedBox(height: 40.0)); 
        break; 
      case 'planetarySystem': 
        myFields.add(numOfPlanetsField); 
        myFields.add(SizedBox(height: 40.0)); 
        myFields.add(numOfStarsField); 
        myFields.add(SizedBox(height: 40.0)); 
        myFields.add(ageField);
    }


    final submitButton = CustomButton(
      text: 'Criar', 
      onPressed: () {}
    ); 

    myFields.add(SizedBox(height: 90.0)); 
    myFields.add(submitButton); 
    
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
                  children: myFields,
                  )
              ),

            )
          )
        )
      )
    );
  }
}