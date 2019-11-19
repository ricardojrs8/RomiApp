import 'package:flutter/material.dart';


class MediaDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
      alignment: Alignment.center,
      children: <Widget>[

      _crearFondo(),
      _botonLogin(context),
        
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


Widget _botonLogin(BuildContext context){

  return Positioned(
          bottom: 60.0,
          child: RaisedButton(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
          ),
          child: Text('login'),
          color: Colors.grey[800],
          textColor: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, '/login');},
          ),
        );

}





}