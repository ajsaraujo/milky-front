import 'package:flutter/material.dart';
import 'package:flutter_app/control/validator.dart'; 
import 'package:flutter_app/widgets/custom_app_bar.dart';
import 'package:flutter_app/widgets/custom_form_field.dart'; 
import 'package:flutter_app/widgets/custom_button.dart'; 

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  static String _nickname; 
  static String _email; 
  static String _password; 

  static final GlobalKey<FormState> _formKey = new GlobalKey<FormState>(); 
  static final hintTextStyle = TextStyle(fontFamily: 'Montserrat', fontSize: 16.0); 
  
  final nicknameField = CustomFormField(
    obscureText: false,
    labelText: 'Seu nome de usuário',
    hintText: 'Ex: cj_og97',
    hintStyle: hintTextStyle,
    validator: Validator.validateNickname,
    onSaved: (String value) { _nickname = value; },
  ); 

  final emailField = CustomFormField(
    obscureText: false,
    labelText: 'Seu email',
    hintText: 'carljohnson@lsmail.com',
    hintStyle: TextStyle(fontFamily: 'Montserrat', fontSize: 16.0),
    onSaved: (String value) {},
    validator: (String value) { return null; },
  );

  final passwordField = CustomFormField(
    obscureText: true,
    labelText: 'Sua senha',
    onSaved: (String value) {},
    validator: (String value) { return null; },
  );

  final confirmPasswordField = CustomFormField(
    obscureText: true,
    labelText: 'Confirme sua senha',
    onSaved: (String value) {},
    validator: (String value) { return null; },
  );

  final submitButton = CustomButton(
    text: 'Criar', 
    onPressed: () {
      _formKey.currentState.save(); 
      if (_formKey.currentState.validate()) {
        print('Vamos criar essa conta!'); 
      }
    },
  ); 

  @override
  Widget build(BuildContext context) {
    print('Agora, vou tentar renderizar a tela!'); 
    return Scaffold(
      appBar: CustomAppBar(title: 'Criar conta'),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height, 
            color: Colors.white, 
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey, 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //SizedBox(height: 45.0), 
                    nicknameField,
                    SizedBox(height: 40.0), 
                    emailField,
                    SizedBox(height: 40.0),
                    passwordField,
                    SizedBox(height: 40.0), 
                    confirmPasswordField,
                    SizedBox(height: 90.0),
                    submitButton
                  ]
                )
              )
            )
          )
        )
      )
    );
  }
}