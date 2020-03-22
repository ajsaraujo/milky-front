import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_app/control/connection.dart'; 
import 'package:flutter_app/control/validator.dart'; 
import 'package:flutter_app/screens/dashboard.dart';
import 'package:flutter_app/widgets/custom_button.dart'; 
import 'package:flutter_app/widgets/custom_form_field.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();

  static const Map<String, String> headers = {"Content-type": "application/json"};

  void _auth() async {
    print('Tentando conectar com o servidor...');
    print('URL = ${Connection.hostname()}'); 
    String json = '{"email": "${_emailController.text}", "password": "${_passwordController.text}"}';
    var data = await http.post('${Connection.hostname()}/api/auth/', headers: headers, body: json);
    
    if(data.statusCode == 200) {
      Navigator.of(context).pushReplacementNamed('/dashboard'); 
    }
    
    print('Ok! StatusCode: ${data.statusCode}');
  }

  @override
  Widget build(BuildContext context) {
    final emailField = CustomFormField(
      obscureText: false,
      hintText: 'Email',
      validator: Validator.validateEmail,
      controller: _emailController, 
    ); 
    
    final passwordField = CustomFormField(
      obscureText: true,
      hintText: 'Senha', 
      validator: (String password) => password.isEmpty ? 'Digite sua senha.' : null,
      controller: _passwordController, 
    ); 
    
    final loginButton = CustomButton(
      text: 'Entrar',
      onPressed: () {
        print('Ola, sou seu novo botao!\n');
        _formKey.currentState.save(); 
        print('Email: ${_emailController.text}');
        print('Password: ${_passwordController.text}');
        if (_formKey.currentState.validate())
          _auth(); 
      },
    ); 

    final signUpRichText = RichText(
      text: TextSpan(
        text: 'Não tenho uma conta',
        style: TextStyle(fontFamily: 'Montserrat', color: Colors.purple, fontSize: 20.0),
        recognizer: TapGestureRecognizer() 
          ..onTap = () { 
            print('Gesto reconhecido, vamos lá!');
            Navigator.of(context).pushNamed('/sign_up'); 
          }
      )
    );
    
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
                              SizedBox(height: 25.0),
                              signUpRichText
                            ],
                          ),
                        ))))));
  }
}
