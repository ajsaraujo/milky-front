import 'package:flutter/material.dart'; 
import 'package:flutter_app/widgets/custom_app_bar.dart'; 

class CustomScaffold extends StatelessWidget {
  CustomScaffold({this.title, this.scaffoldKey, this.formKey, this.children}); 

  final String title; 
  final GlobalKey<ScaffoldState> scaffoldKey; 
  final GlobalKey<FormState> formKey; 
  final List<Widget> children; 
  
  @override 
  build(BuildContext context) {
    return Scaffold(
        key: this.scaffoldKey, 
        appBar: CustomAppBar(
          title: this.title, 
        ),
        backgroundColor: Colors.white,
        body: Center(
            child: SingleChildScrollView(
                child: Container(
                    color: Colors.white,
                    child: Padding(
                        padding: const EdgeInsets.all(36.0),
                        child: Form(
                          //key: this.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: this.children
                          ),
                        ))))));
  }
}