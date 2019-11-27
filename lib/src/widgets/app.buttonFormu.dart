import 'dart:ffi';

import 'package:flutter/material.dart';

class AppButtonFormu extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;
  final String name;
  final double horizontal1;
  final double vertical1;

  const AppButtonFormu({this.color, this.onPressed, this.name, this.horizontal1, this.vertical1 });

 @override
 Widget build(BuildContext context) {

  return RaisedButton(
   child: Container(
     padding: EdgeInsets.symmetric(horizontal: horizontal1, vertical: vertical1),
     child: Text(name),
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5.0)
  ),
  elevation: 0.0,
  color: color,
  textColor: Colors.white,
  onPressed: onPressed,
);

 }



}