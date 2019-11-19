import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:romi/media_detail.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Colors.grey[800],
        elevation: 0.0,
      ),
      body: new Stack(
      alignment: Alignment.center,
      children: <Widget>[

      _crearFondo2(),
      _loginForm(context),
        
      ],
      )
    );
  }
}

Widget _crearFondo2(){

  final fondo = Image.asset('images/romi1.png',
    fit: BoxFit.cover,
       
       );

    final desenfoque_img = BackdropFilter(

      filter: new ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: new Container(
        color: Colors.black.withOpacity(0.7),
      ),

    );
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        fondo,
        desenfoque_img,
      ],

    );
}

Widget _loginForm(BuildContext context) {

  final size = MediaQuery.of(context).size;

  return SingleChildScrollView(
    child: Column(
      children: <Widget>[

        // SafeArea(

        //   child: Container(
        //     height: 1.0,
        //   ),

        // ),

        Container(
          width: size.width * 0.85,
          margin: EdgeInsets.symmetric(vertical: 10.0),
          padding: EdgeInsets.symmetric( vertical: 50.0),
          decoration: BoxDecoration(
            color: Colors.white38,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black26,
                blurRadius: 3.0,
                offset: Offset(0.0 ,5.0),
                spreadRadius:  3.0
              )
            ]

          ),
          child: Column(
            children: <Widget>[
              Text('Login', 
              style: TextStyle(fontSize: 50, color: Colors.white),
              ),

              SizedBox( height: 60.0, ),
              _crearEmail(),
              SizedBox( height: 30.0, ),
              _crearPassword(),
              SizedBox( height: 50.0, ),
              _crearBoton()

            ],

          ),
        ),

        SizedBox( height: 70.0, ),

        Text('¿Olvido la contraseña?',

        style: TextStyle(fontSize: 25, color: Colors.white),
        ),
         new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                children: <Widget>[
                    new Checkbox(value: false, 
                  onChanged: (bool value) {

                  },
                  ),
                  new Text("Recordar",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                  ),


                ] 
              
              
              ,),
                   Center(
                   
                   child: FlatButton(
                     child: new Text("Regístrate",  textAlign: TextAlign.end,
                     style: TextStyle(fontSize: 15, color: Colors.white),
                     ), 
                     
                     onPressed: (){
                                   Navigator.pushNamed(context, '/registration');
                     } 
 
                   
                   
                   ,)
                 
                 
        
                 ,)
    
                   
            ],
            
          ),


        SizedBox( height: 100.0, ) 
      ],


    ),
  );

}


Widget _crearEmail(){

  return Container(

    padding: EdgeInsets.symmetric(horizontal: 20.0),

    child: TextField(
      style:
      new TextStyle(fontSize: 22.0, color: Colors.white),
 
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon:  Icon( Icons.alternate_email, color: Colors.white, ),
        hintText: 'ejemplo@correo.com',
        labelText: 'Correo electrónico',
        labelStyle: TextStyle(color: Colors.white),

        focusColor: Colors.white
        
        

      ),

    ),


  );


}


Widget _crearPassword(){

  return Container(

    

    padding: EdgeInsets.symmetric(horizontal: 20.0),

    child: TextField(
      obscureText: true,
      style:
      new TextStyle(fontSize: 22.0, color: Colors.white),
 
      decoration: InputDecoration(
        icon:  Icon( Icons.lock_outline, color: Colors.white, ),
        fillColor: Colors.white,
        labelText: 'Contraseña',
        labelStyle: TextStyle(color: Colors.white),

      ),

    ),


  );


}

Widget _crearBoton(){

  return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 80.0, vertical: 15.0),
        child: Text('Ingresar'),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0)
      ),
      elevation: 0.0,
      color: Colors.yellow,
      textColor: Colors.white,
      onPressed: () {},

  );



}