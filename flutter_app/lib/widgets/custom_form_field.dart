import 'package:flutter/material.dart'; 

class CustomFormField extends StatelessWidget {
  CustomFormField({this.controller, this.hintText, this.hintStyle, this.obscureText, this.validator, this.onSaved, this.labelText}); 

  final TextEditingController controller; 
  final String hintText;
  final String labelText;
  final TextStyle hintStyle;   
  final bool obscureText;
  final Function validator;
  final Function onSaved; 
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: this.controller, 
      obscureText: this.obscureText,
      style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        labelText: this.labelText,
        hintText: this.hintText,
        hintStyle: this.hintStyle,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      onSaved: this.validator,
      validator: this.validator
    );
  }
}