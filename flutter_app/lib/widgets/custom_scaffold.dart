import 'package:flutter/material.dart'; 

class CustomScaffold extends StatelessWidget {
  CustomScaffold({this.scaffoldKey, this.formKey, this.children}); 

  final GlobalKey<ScaffoldState> scaffoldKey; 
  final GlobalKey<FormState> formKey; 
  final List<Widget> children; 
  
  @override 
  build(BuildContext context) {
    return Scaffold(
        key: this.scaffoldKey, 
        backgroundColor: Colors.white,
        body: Center(
            child: SingleChildScrollView(
                child: Container(
                    color: Colors.white,
                    child: Padding(
                        padding: const EdgeInsets.all(36.0),
                        child: Form(
                          key: this.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: this.children
                          ),
                        ))))));
  }
}