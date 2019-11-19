import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:romi/media_detail.dart';
import 'package:romi/src/mixins/validation_mixins.dart';
import 'package:romi/src/widgets/app_textfield.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = '/registration';
  @override
  _RegisterPageState createState() => _RegisterPageState();
}
class _RegisterPageState extends State<RegisterPage> with  ValidationMixins{
 // al colocar el guin bajo le estamos diciendo a dart que es una varible local

  FocusNode _focusNode;
  TextEditingController _emailController;
  TextEditingController _passwordController;
  bool _autoValidate = false;
  String _errorMessage = "";

  @override
  void initState(){
    super.initState();
    _focusNode = FocusNode();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }
  @override

  void dispose(){
    super.dispose();  
     _focusNode.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    
    }


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
              Text('Crea una cuenta', 
              style: TextStyle(fontSize: 40, color: Colors.white),
              ),

              SizedBox( height: 50.0, ),
              _crearNombreU(context),
              SizedBox( height: 30.0, ),
              _crearEdas(),
              SizedBox( height: 30.0, ),
              _crearEmail(),
              SizedBox( height: 30.0, ),
              _crearPassword(),
              SizedBox( height: 50.0, ),
              _crearBoton()

            ],

          ),
        ),

        SizedBox( height: 70.0, ),
      ],


    ),
  );

}


Widget _crearNombreU(BuildContext context){

  

    var onChanged;
    return Container(
  
      padding: EdgeInsets.symmetric(horizontal: 20.0),
  
      child: TextField(
        style:
        new TextStyle(fontSize: 22.0, color: Colors.white),
   
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon:  Icon( Icons.accessibility_new, color: Colors.white, ),
          hintText: 'Pedrojr',
          labelText: 'Nombre',
          labelStyle: TextStyle(color: Colors.white),
          hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
  
          focusColor: Colors.white
          
          
  
        ),
        onChanged: onChanged,
    ),

  
  );


}

Widget _crearEdas(){

  return Container(

    padding: EdgeInsets.symmetric(horizontal: 20.0),

    child: TextField(
      style:
      new TextStyle(fontSize: 22.0, color: Colors.white),
 
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon:  Icon( Icons.alternate_email, color: Colors.white, ),
        hintText: '23',
        labelText: 'Edad',
        labelStyle: TextStyle(color: Colors.white),
        focusColor: Colors.white
        
        

      ),

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