
import 'dart:convert';
import 'dart:io';

import'package:http/http.dart' as http; 
import 'package:romi/src/model/galeria_model.dart';
import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';

class GaleriaServicio {
  final String _url = 'https://romi-df78d.firebaseio.com';

   Future<bool> crearFoto(  GaleriaModel foto ) async {
     final url = '$_url/galeria.json';
     // peticion post para ingresar un producto

      final resp = await http.post(url, body: galeriaModelToJson(foto) );
      final decodeData = json.decode(resp.body);
      print(decodeData);

      return true;
  }

   Future<bool> editarFoto(  GaleriaModel foto ) async {
     final url = '$_url/galeria/${foto.id}.json';
     // peticion post para ingresar un producto

      final resp = await http.put(url, body: galeriaModelToJson(foto) ); // el put renplaza
      final decodeData = json.decode(resp.body);
      print(decodeData);

      return true;
  }

  Future<List<GaleriaModel>> cargarProductos() async {

    final url = '$_url/galeria.json';
      // peticion get
    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<GaleriaModel> fotos = new List();
    
    if (decodedData == null ) return [];

    if (decodedData['error'] != null ) return [];

    decodedData.forEach((id, fot){

     final prodTemp = GaleriaModel.fromJson(fot);
     prodTemp.id = id;
     fotos.add(prodTemp);


    });
    print(fotos);
    return (fotos);

    }

    Future<int> borrarProducto( String id  ) async{

      final url = '$_url/galeria/$id.json';
      final resp = await http.delete(url);

      print(resp.body);

      return 1;

    } 


    Future<String> subirImagen (File imagen) async {

        final url = Uri.parse('https://api.cloudinary.com/v1_1/dchnddgdn/image/upload?upload_preset=azqep9eq');
        final mimeType = mime(imagen.path).split('/'); //image/jpeg

        final imageUploadRequest = http.MultipartRequest(
          'POST',
          url

        );

        final file = await http.MultipartFile.fromPath(
          'file', 
          imagen.path,
          contentType: MediaType(mimeType[0], mimeType[1])
          
          );


        imageUploadRequest.files.add(file);

        final streamResponse = await imageUploadRequest.send(); // de esta manera se dispara la peticion 
        final resp = await http.Response.fromStream(streamResponse);

        if( resp.statusCode != 200 && resp.statusCode != 201 ){
          print('Algo salio mal');
          print(resp.body);
          return null;

        }

        final respData = json.decode(resp.body);
        print(respData);

        return respData['secure_url'];

      
    }
  

  }


