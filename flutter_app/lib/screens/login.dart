import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_app/screens/dashboard.dart';
import 'package:flutter_app/control/connection.dart'; 
import 'package:flutter_app/widgets/custom_button.dart'; 

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
    final emailField = TextFormField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Email",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      onSaved: (String value) => {this._data.email = value},
      validator: _validateEmail
    );
    
    final passwordField = TextFormField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Senha",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      //Função que será chamada ao salvar o formulário.
      onSaved: (String value) => {this._data.password = value},
      validator: _validatePassword,
    );
    final loginButton = CustomButton(
      text: 'Login',
      onPressed: () {
        print('Ola, sou seu novo botao!\n');
        _formKey.currentState.save(); 
        if (_formKey.currentState.validate())
          _auth(); 
      },
    ); 
    /*
    final loginButton = Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Theme.of(context).primaryColor,
        child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () {
              _formKey.currentState.save();
              if (_formKey.currentState.validate())
                _auth();
              },
            child: Text("Login",
                textAlign: TextAlign.center,
                style: style.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ))));*/ 
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
                            ],
                          ),
                        ))))));
  }
}
