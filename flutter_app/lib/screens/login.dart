import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_app/screens/dashboard.dart';
import 'package:flutter_app/control/connection.dart'; 
import 'package:flutter_app/widgets/custom_button.dart'; 
import 'package:flutter_app/widgets/custom_form_field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginData {
  String email = '';
  String password = '';
}

class _LoginScreenState extends State<LoginScreen> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  _LoginData _data = _LoginData();
  
  static const Map<String, String> headers = {"Content-type": "application/json"};

  void _auth() async {
    print('Tentando conectar com o servidor...');
    print('URL = ${Connection.hostname()}'); 
    String json = '{"email": "${_data.email}", "password": "${_data.password}"}';
    var data = await http.post('${Connection.hostname()}/api/auth/', headers: headers, body: json);
    
    if(data.statusCode == 200) {
      Navigator.pushReplacement(context,
       new MaterialPageRoute(
           builder: (context) => new Dashboard()));
    }
    
    print('Ok! StatusCode: ${data.statusCode}');
  }

  // Essa verificação ainda pode melhorar. Por exemplo,
  // ela considera '@.' um e-mail válido.
  String _validateEmail(String email) {
    if (email.isEmpty)
      return 'Digite seu e-mail'; 
    if (!email.contains('@') || !email.contains('.'))
      return 'Insira um e-mail válido'; 
    return null;
  }

  String _validatePassword(String password) {
    // A validação pode verificar se o usuário utilizou
    // algum caractere proibido. 
    if (password.isEmpty)
      return 'Insira sua senha';
    return null; 
  }

  @override
  Widget build(BuildContext context) {
    final emailField = CustomFormField(
      obscureText: false,
      hintText: 'Email',
      onSaved: (String value) => {this._data.email = value},
      validator: _validateEmail,
    ); 
    
    final passwordField = CustomFormField(
      obscureText: true,
      hintText: 'Senha', 
      onSaved: (String value) => this._data.password = value,
      validator: _validatePassword,
    ); 
    
    final loginButton = CustomButton(
      text: 'Entrar',
      onPressed: () {
        print('Ola, sou seu novo botao!\n');
        _formKey.currentState.save(); 
        if (_formKey.currentState.validate())
          _auth(); 
      },
    ); 
    
    final signUpButton = CustomButton(
      text: 'Criar Conta',
      onPressed: () {
        print('Mande o usuário pra tela de criação de conta...'); 
      }); 
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: SingleChildScrollView(
                child: Container(
                    color: Colors.white,
                    child: Padding(
                        padding: const EdgeInsets.all(36.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                  height: 155.0,
                                  child: Image.asset("assets/logo.png",
                                      fit: BoxFit.contain)),
                              SizedBox(height: 45.0),
                              emailField,
                              SizedBox(height: 25.0),
                              passwordField,
                              SizedBox(height: 35.0),
                              loginButton,
                              SizedBox(height: 15.0),
                              signUpButton
                            ],
                          ),
                        ))))));
  }
}
