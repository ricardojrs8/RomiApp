import 'dart:ffi';

import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;
  final String name;
  final double horizontal1;
  final double vertical1;

  const AppButton({this.color, this.onPressed, this.name, this.horizontal1, this.vertical1 });

 @override
 Widget build(BuildContext context) {
  return Positioned(
          bottom: 60.0,
          child: RaisedButton(
          padding: EdgeInsets.symmetric(horizontal: horizontal1, vertical: vertical1),
          //padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
          ),
          child: Text(name),
          color: color,
          textColor: Colors.white,
          onPressed: onPressed
          ),
        );

 }



}