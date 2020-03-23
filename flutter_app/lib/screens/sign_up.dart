import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/error_snackbar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/control/validator.dart'; 
import 'package:flutter_app/control/connection.dart'; 
import 'package:flutter_app/widgets/custom_app_bar.dart';
import 'package:flutter_app/widgets/custom_form_field.dart'; 
import 'package:flutter_app/widgets/custom_button.dart'; 

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  static final _nicknameController = new TextEditingController(); 
  static final _emailController = new TextEditingController(); 
  static final _passwordController1 = new TextEditingController();
  static final _passwordController2 = new TextEditingController(); 

  static final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  static final GlobalKey<FormState> _formKey = new GlobalKey<FormState>(); 

  static final hintTextStyle = TextStyle(fontFamily: 'Montserrat', fontSize: 16.0); 
  
  static void _createUser() async {
    bool isConnected = await Connection.isConnected(); 

    // Repetição do mesmo código que aparece em login.dart. Modularize assim que possível
    if (!isConnected) {
      final noConnectionSnackBar = ErrorSnackBar(
        errorMessage: 'Conecte-se à Internet.',
        backgroundColor: Colors.red,
        scaffoldKey: _scaffoldKey
      ); 

      noConnectionSnackBar.display();
      return;  
    }

    final waitingSnackBar = SnackBar(
      content: Text(
        'Conectando com o servidor...',
        style: TextStyle(fontFamily: 'Montserrat', color: Colors.white),
        textAlign: TextAlign.center,
      ),
      duration: Duration(minutes: 1), 
      backgroundColor: Colors.purple,
    ); 

    _scaffoldKey.currentState.showSnackBar(waitingSnackBar); 
    
    final String json = '''
      {
        "name": "${_nicknameController.text}",
        "email": "${_emailController.text}",
        "password": "${_passwordController1.text}" 
      }
    ''';

    print('Requisição batendo no URL ${Connection.hostname()}/api/users/'); 
    print('Headers: ${Connection.headers}'); 

    final data = await http.post('${Connection.hostname()}/api/users/',
      headers: Connection.headers, 
      body: json
    );

    _scaffoldKey.currentState.removeCurrentSnackBar(); 
    
    if (data.statusCode == 201) {
      print('Usuário criado com sucesso!');
    } else if (data.statusCode == 401) {
      print('O email já está em uso!'); 
    } else {
      print('Algo estranho aconteceu...'); 
      print(data.statusCode); 
      print(data.body);
    }
  }

  final nicknameField = CustomFormField(
    obscureText: false,
    labelText: 'Seu nome de usuário',
    hintText: 'Ex: cj_og97',
    hintStyle: hintTextStyle,
    validator: Validator.validateNickname,
    controller: _nicknameController,
  ); 

  final emailField = CustomFormField(
    obscureText: false,
    labelText: 'Seu email',
    hintText: 'carljohnson@lsmail.com',
    hintStyle: TextStyle(fontFamily: 'Montserrat', fontSize: 16.0),
    validator: Validator.validateEmail,
    controller: _emailController,
    inputType: TextInputType.emailAddress, 
  );

  final passwordField = CustomFormField(
    obscureText: true,
    labelText: 'Sua senha',
    controller: _passwordController1,
    validator: Validator.validatePassword,
  );

  final confirmPasswordField = CustomFormField(
    obscureText: true,
    labelText: 'Confirme sua senha',
    controller: _passwordController2,
    validator: (String value) {
      print('Validando campo de confirmação de senha:');
      print('SENHA1 = ${_passwordController1.text}');
      print('SENHA2 = ${_passwordController2.text}');
      if (_passwordController1.text != _passwordController2.text)
        return 'As senhas não coincidem.'; 
      return Validator.validatePassword(value); 
    },
  );

  final submitButton = CustomButton(
    text: 'Criar', 
    onPressed: () {
      _formKey.currentState.save(); 
      if (_formKey.currentState.validate()) {
        _createUser(); 
      }
    },
  ); 

  @override
  Widget build(BuildContext context) {
    print('Agora, vou tentar renderizar a tela!'); 
    return Scaffold(
      key: _scaffoldKey,
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