import 'dart:convert';

import 'package:http/http.dart' as http;

class UsuarioProvider{

  final String firebasetoken = 'AIzaSyCuRSGb6a9jpIsNRMccGra5Dorbzt7EjtA';


  Future nuevoUsuario(String email, String password) async {

    final authData = {
      'email'   : email,
      'password': password,
      'returnSecureToken': true

    };

    final resp = await http.post(

      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithCustomToken?key=$firebasetoken',
      body: json.encode(authData)
    );

  Map<String, dynamic> decodeResp = json.decode(resp.body);
  print(decodeResp);

  }




}