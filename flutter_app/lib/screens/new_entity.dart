import 'package:flutter/material.dart'; 
import 'package:flutter_app/classes/entity.dart';
import 'package:flutter_app/widgets/custom_app_bar.dart'; 
import 'package:flutter_app/control/validator.dart';
import 'package:flutter_app/control/connection.dart'; 
import 'package:flutter_app/widgets/custom_button.dart';
import 'package:flutter_app/widgets/error_snackbar.dart'; 
import 'package:flutter_app/widgets/custom_form_field.dart'; 
import 'dart:convert';  
import 'package:http/http.dart' as http;

class NewEntity extends StatefulWidget {
  Entity entity;

  NewEntity(this.entity); 

  @override
  _NewEntityState createState() => _NewEntityState();
}

class _NewEntityState extends State<NewEntity> {
 
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();  
  static final _map = Map(); 

  void sendData() async {

    bool isConnected = await Connection.isConnected(); 
          
    if (!isConnected) {
      final noConnectionSnackBar = ErrorSnackBar(
        errorMessage: 'Conecte-se à internet.', 
        scaffoldKey: _scaffoldKey,
      ); 

      noConnectionSnackBar.display();
      return;  
    }

    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      final waitingSnackBar = ErrorSnackBar(
        errorMessage: 'Criando ${widget.entity.type}...', 
        duration: Duration(minutes: 1), 
        backgroundColor: Colors.purple, 
        scaffoldKey: _scaffoldKey,
      );

      // Gambiarra! A SnackBar fica com duração fixa de 1 minuto 
      // e é removida quando chega a resposta. O correto era ela ser
      // mostrada com programação assíncrona. Ou não!
      waitingSnackBar.display(); 

      final jsonString = json.encode(_map);
      print('Estou enviando a seguinte string:'); 
      print(jsonString); 

      var data = await http.post(
        '${Connection.hostname()}/api/${widget.entity.controlName}',
        body: jsonString, 
        headers: Connection.headers); 

      _scaffoldKey.currentState.removeCurrentSnackBar();
      
      print('Ok! Status Code: ${data.statusCode}'); 
      if(data.statusCode == 201) {
        print('Tudo certo, entidade criada!');
      } else {
      final authErrorSnackBar = ErrorSnackBar(
        errorMessage: 'Oops... Algo deu errado!', 
        scaffoldKey: _scaffoldKey
      );
      authErrorSnackBar.display(); 
    }
    }


  }
  final nameField = CustomFormField(
      labelText: 'Nome', 
      validator: Validator.validateNickname, 
      onSaved: (String val) => _map['name'] = val   
    );

  final numOfSysField = CustomFormField(
      labelText: 'Número de sistemas',
      validator: Validator.validateNumber, 
      inputType: TextInputType.number,
      onSaved: (String val) => _map['num_of_systems'] = int.parse(val)  
    ); 

    final distanceToEarthField = CustomFormField(
      labelText: 'Distância da terra', 
      validator: Validator.validateNumber, 
      inputType: TextInputType.number,
      onSaved: (String val) => _map['distance_to_earth'] = int.parse(val) 
    ); 

    final sizeField = CustomFormField(
      labelText: 'Tamanho',
      validator: Validator.validateNumber,
      inputType: TextInputType.number, 
      onSaved: (String val) => _map['size'] = int.parse(val) 
    ); 

    final massField = CustomFormField(
      labelText: 'Massa',
      validator: Validator.validateNumber, 
      inputType: TextInputType.number,
      onSaved: (String val) => _map['weight'] = int.parse(val) 
    ); 

    final rotationSpeedField = CustomFormField(
      labelText: 'Velocidade de Rotação', 
      validator: Validator.validateNumber,
      inputType: TextInputType.number,
      onSaved: (String val) => _map['rotation_speed'] = int.parse(val) 
    ); 

    final compositionField = CustomFormField(
      labelText: 'Composição',
      validator: Validator.validateLongString, 
      onSaved: (String val) => _map['composition'] = val 
    );

    final gravityField = CustomFormField(
      labelText: 'Gravidade', 
      validator: Validator.validateLongString, 
      onSaved: (String val) => _map['gravity'] = int.parse(val) 
    ); 

    final numOfPlanetsField = CustomFormField(
      labelText: 'Número de planetas',
      validator: Validator.validateNumber,
      inputType: TextInputType.number,
      onSaved: (String val) => _map['num_of_planets'] = int.parse(val) 
    ); 

    final ageField = CustomFormField(
      labelText: 'Idade', 
      validator: Validator.validateNumber, 
      inputType: TextInputType.number, 
      onSaved: (String val) => _map['age'] = int.parse(val) 
    ); 

    final numOfStarsField = CustomFormField(
      labelText: 'Número de estrelas', 
      validator: Validator.validateNumber, 
      inputType: TextInputType.number,
      onSaved: (String val) => _map['num_of_stars'] = int.parse(val)
    );
  
  @override
  Widget build(BuildContext context) {
    List<Widget> myFields = List<Widget>(); 

    myFields.add(nameField); 
    myFields.add(SizedBox(height: 40.0)); 

    switch (widget.entity.controlName) {
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
      onPressed: sendData
    ); 

    myFields.add(SizedBox(height: 90.0)); 
    myFields.add(submitButton); 
    
    return Scaffold(
      key: _scaffoldKey, 
      appBar: CustomAppBar(
        title: 'Criar nov${widget.entity.arcticle} ${widget.entity.type}'),
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