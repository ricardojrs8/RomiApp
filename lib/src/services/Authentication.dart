import 'package:firebase_auth/firebase_auth.dart';
import 'package:romi/src/model/auth_request.dart';
import 'package:http/http.dart';

class Authentication{

  final _auth = FirebaseAuth.instance;



  Future<AuthenticationRequiest> createUser({String email = "", String password = ""}) async {
         AuthenticationRequiest authRequest = AuthenticationRequiest();

    try{
       var user =  await _auth.createUserWithEmailAndPassword(email: email, password: password);
        if(user != null){
          authRequest.success = true;
        }
    }catch(e){
   _mapErrorMessage(authRequest, e.code);

    }
  return authRequest;
  }


   Future<FirebaseUser> getCurrentUser() async {

    try{
        return await _auth.currentUser();
    }catch(e){
    print(e);
    }
  return null;
  }

  // metodo que logea al usuario
   Future<AuthenticationRequiest> loginUser({String email = "", String password = ""}) async {
     AuthenticationRequiest authRequest = AuthenticationRequiest();
    try{
        // con este metodo signInWithEmailAndPassword podemos poder hacer un login de un usuario y password que ya existen en firebase
        var user = await _auth.signInWithEmailAndPassword(email: email, password: password);
        if(user != null){
          authRequest.success = true;
        }
    }catch(e){
    _mapErrorMessage(authRequest, e.code);
    }
  return authRequest;
  }

// metodo que cierra la sesion
 Future<void> singOut() async {

    try{
        return await _auth.signOut();
    }catch(e){
    print(e);
    }
  return null;
  }

  void _mapErrorMessage(AuthenticationRequiest authRequest, String code){
    switch(code){
      case 'ERROR_USER_NOT_FOUND':
        authRequest.errorMessage = "Usuario no encontrado";
        break;
       case 'ERROR_WRONG_PASSWORD':
        authRequest.errorMessage = "Contraseña invalida";
        break;
        case 'ERROR_NETWORK_REQUIEST_FAILED':
        authRequest.errorMessage = "Error de red";
        break;
        case 'ERROR_EMAIL_ALREADY_IN_USE':
        authRequest.errorMessage = "El usuario ya esta registrado";
        break;
        default:
        authRequest.errorMessage = code;
        


    }

  }


}