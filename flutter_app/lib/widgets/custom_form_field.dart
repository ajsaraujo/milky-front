import 'package:flutter/material.dart'; 

class CustomFormField extends StatelessWidget {
  CustomFormField({this.hintText, this.obscureText, this.validator, this.onSaved}); 

  final String hintText; 
  final bool obscureText;
  final Function validator;
  final Function onSaved; 
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: this.obscureText,
      style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: this.hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      onSaved: this.validator,
      validator: this.validator
    );
  }
}