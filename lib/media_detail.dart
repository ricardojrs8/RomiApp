import 'package:flutter/material.dart';
import 'package:romi/src/widgets/app_button.dart';


class MediaDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: new Stack(
      alignment: Alignment.center,
      children: <Widget>[
      _crearFondo(),
      AppButton(
                color: Colors.grey[800],
                onPressed: () {Navigator.pushNamed(context, '/login');},
                name: "LoGinr",
                horizontal1: 10.0,
                vertical1: 15.0,
              )
      //_botonLogin(context),
        
      ],
      )
   
    );
  }

Widget _crearFondo(){

  final fondo = Image.asset('images/romi1.png',
       fit: BoxFit.cover,
       
       );
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        fondo
      ],

    );
}
}