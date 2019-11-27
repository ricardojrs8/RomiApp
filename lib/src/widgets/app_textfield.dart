import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {

  final String labelText;
  final String hintText;

  final ValueChanged<String> onSaved;
  final bool obscureText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final FormFieldValidator<String> validator;
  final bool autoValidate;
  final Icon icono;

  const AppTextField({this.labelText,this.icono, this.hintText, this.onSaved, this.obscureText, this.controller, this.focusNode,this.validator,this.autoValidate });

 @override

 Widget build(BuildContext context) {
   
     return TextFormField(

      autovalidate: autoValidate,
      validator: validator,
      focusNode: focusNode, 
      controller: controller, 
      style:new TextStyle(fontSize: 22.0, color: Colors.white),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon:  icono,
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white),
        focusColor: Colors.white
      ),
      onSaved: onSaved,
      textAlign: TextAlign.center,
      obscureText: obscureText == null ? false : obscureText,
    );
   
   
 }  

}