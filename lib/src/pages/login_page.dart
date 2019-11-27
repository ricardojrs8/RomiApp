import 'package:flutter/material.dart';
import 'package:romi/src/mixins/validation_mixins.dart';
import 'package:romi/src/services/Authentication.dart';
import 'dart:ui' as ui;
import 'package:romi/src/widgets/app.buttonFormu.dart';
import 'package:romi/src/widgets/app_error_message.dart';
import 'package:romi/src/widgets/app_textfield.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with  ValidationMixins {

  
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode _focusNode;
  bool showSpinner = false;
  bool _autoValidate = false;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>(); // instancia
  String _errorMessage = "";
  @override
  void initState() { 
    super.initState();
    _focusNode = FocusNode();
    
  }

  // con la funcion dispose libero todos los recursos que no se estan utilizando
  @override
  void dispose(){
    super.dispose();
    _focusNode.dispose();
     _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

    void setSpinnerStatus(bool status){
  
    setState(() {
    showSpinner = status;
    }); 
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Form(
        key: _formkey,
      child: new Stack(
      alignment: Alignment.center,
      children: <Widget>[

      _crearFondo2(),
      
      _loginForm(context, showSpinner),
        
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

Widget _loginForm(BuildContext context, bool showSpinner) {
  bool showSpinner = false;

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
              Text('Login', 
              style: TextStyle(fontSize: 50, color: Colors.white),
              ),
              SizedBox( height: 60.0, ),
              _emailField(),
              SizedBox( height: 30.0, ),
              _passwordField(),
              SizedBox( height: 50.0, ),
              _showErrorMessage(),
              SizedBox( height: 30.0, ),
              _submitButton(),

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

  Widget _emailField(){
    return  AppTextField(
              focusNode: _focusNode,
              autoValidate: _autoValidate,
              controller: _emailController,
              validator: validateEmail,
              labelText:'Correo electrónico',
              hintText: 'ejemplo@correo.com',
              icono: Icon( Icons.alternate_email, color: Colors.white, ),
              onSaved: (value){},
              
              );

  }

  Widget _passwordField(){
    return    AppTextField(
                autoValidate: _autoValidate,
                controller: _passwordController,
                validator: validatePassword,
                labelText:'Contraseña',
                icono: Icon( Icons.lock_outline, color: Colors.white, ),
                onSaved: (value){},
                obscureText: true,
                
                );
    
  }

  Widget _submitButton(){

    return AppButtonFormu(
                color: Colors.yellow,
                name: "LoGinr",
                horizontal1: 10.0,
                vertical1: 15.0,
                
                onPressed: () async {
                  if(_formkey.currentState.validate()){
                  setSpinnerStatus(true);
                  var auth = await Authentication().loginUser(email: _emailController.text, password: _passwordController.text);
              
                  if(auth.success){
                    Navigator.pushNamed(context, '/shopscreen');
                    FocusScope.of(context).requestFocus(_focusNode);
                  _emailController.text = ""; // aqui limpiamos el texto
                  _passwordController.text = "";
                  }else{
                print(auth.errorMessage);
              setState(() {
                _errorMessage = auth.errorMessage;
              });
              }
               
                  
                  
                  
                  
                  
                  setSpinnerStatus(false);
                  }else{
                    setState(() => _autoValidate = true);
                  }
                },
              
              );
    
  }

  Widget _showErrorMessage(){

  if(_errorMessage.length > 0 && _errorMessage != null){
    return ErrorMessage(errorMessage: _errorMessage);


  }else{
    return Container(
      height: 0.0,

    );
  }
}



}


















