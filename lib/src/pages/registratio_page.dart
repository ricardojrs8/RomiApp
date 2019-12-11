import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'dart:ui' as ui;
import 'package:romi/src/mixins/validation_mixins.dart';
import 'package:romi/src/services/Authentication.dart';
import 'package:romi/src/services/usuario_provide.dart';
import 'package:romi/src/widgets/app.buttonFormu.dart';
import 'package:romi/src/widgets/app_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = '/registration';
  @override
  _RegisterPageState createState() => _RegisterPageState();
}
class _RegisterPageState extends State<RegisterPage> with  ValidationMixins{

 // al colocar el guin bajo le estamos diciendo a dart que es una varible local
  final auth = FirebaseAuth.instance;

  FocusNode _focusNode;
  TextEditingController _nombreController = TextEditingController();
  TextEditingController _edadController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool showSpinner = false;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>(); // instancia
  bool _autoValidar = false;

  final usuarioProvider = new UsuarioProvider();

  @override
  void initState() { 
    super.initState();
    _focusNode = FocusNode();
    //_nombreController = TextEditingController();
    //_edadController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    
  }

  // con la funcion dispose libero todos los recursos que no se estan utilizando
  @override
  void dispose(){
    super.dispose();
    _focusNode.dispose();
    _nombreController.dispose();
    _edadController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(""),
        backgroundColor: Colors.grey[800],
        elevation: 0.0,
      ),
      backgroundColor: Colors.transparent,
      body: ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Form(
      key: _formkey,
      child: new Stack( 
      alignment: Alignment.center,
      children: <Widget>[

      _crearFondo2(),
      _loginForm(context),
        
      ],
      )
      )
      )
    );
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
              _nameField(),
              SizedBox( height: 30.0, ),
              _edadField(),
              SizedBox( height: 30.0, ),
              _emailField(),
              SizedBox( height: 30.0, ),
              _passwordField(),
              SizedBox( height: 50.0, ),
              _submitButton()

            ],

          ),
        ),

        SizedBox( height: 70.0, ),
      ],


    ),
  );




  }


  Widget _nameField(){
    return AppTextField(
              focusNode: _focusNode,
              autoValidate: _autoValidar,
              validator: validateNombre,
              controller: _nombreController,
              hintText: 'Pedrojr',
              labelText: 'Nombre',
              icono: Icon( Icons.accessibility_new, color: Colors.white, ),
              onSaved: (value) { },

        );

  }

  Widget _edadField(){
    return   AppTextField(
              controller: _edadController,
              autoValidate: _autoValidar,
              validator: validateEdad,
              hintText: '23',
              labelText: 'Edad',
              icono: Icon( Icons.nature_people, color: Colors.white, ),
              onSaved: (value) { 
              _emailController.text = value;
              print('Email $_emailController');
              },
              
              );

  }

  Widget _emailField(){

    return    AppTextField(
              controller: _emailController,
              autoValidate: _autoValidar,
              validator: validateEmail,
              hintText: 'ejemplo@correo.com',
              labelText: 'Correo electrónico',
              icono:  Icon( Icons.alternate_email, color: Colors.white, ),
              onSaved: (value) { },
              );
  }

  Widget _passwordField(){
    return   AppTextField(
              controller: _passwordController,
              autoValidate: _autoValidar,
              validator: validatePassword,
              icono:  Icon( Icons.lock_outline, color: Colors.white, ),

              labelText: 'Contraseña',
              obscureText: true,
              onSaved: (value) { },
              );


  }

  Widget _submitButton(){
    return   AppButtonFormu(
                color: Colors.yellow,
                name: "LoGin3",
                horizontal1: 10.0,
                vertical1: 15.0,
                onPressed: () async {
                  if(_formkey.currentState.validate()){
                  var newUser = await Authentication().createUser(email: _emailController.text, password: _passwordController.text);
                  if(newUser != null){
                    Navigator.pushNamed(context, '/shopscreen');
                  }
                  _nombreController.text = "";
                  _edadController.text = "";
                  _emailController.text = "";
                  _passwordController.text = "";
                  FocusScope.of(context).requestFocus(_focusNode);
                  }else{
                    setState(() => _autoValidar = true);
                  } 
                },
                
              );

  }




}



