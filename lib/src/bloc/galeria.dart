import 'dart:io';

import 'package:romi/src/services/galeria_servicio.dart';
import 'package:rxdart/rxdart.dart';

import 'package:romi/src/model/galeria_model.dart';


// notifico mis aplicaciones atravez de un stream
class ProductosBloc {
  
  final _galeriaController = new BehaviorSubject<List<GaleriaModel>>();
    final _cargandoController = new BehaviorSubject<bool>();
    final _galeriaServicios = new GaleriaServicio();

    Stream<List<GaleriaModel>> get galeriaStream => _galeriaController;
    Stream<bool> get cargando => _cargandoController.stream; // ecucha un bool


    void cargarGaleria() async {

      final productos = await _galeriaServicios.cargarProductos();
      _galeriaController.sink.add( productos);


    }


    void agregarGaleria(  GaleriaModel galeria ) async {


      _cargandoController.sink.add(true);
      await _galeriaServicios.crearFoto(galeria);
      _cargandoController.sink.add(false);


    }

     Future<String> subirFoto(  File foto ) async {


      _cargandoController.sink.add(true);
      final fotoUrl = await _galeriaServicios.subirImagen(foto);
      _cargandoController.sink.add(false);

        return fotoUrl;

    }


    void editarGaleria(  GaleriaModel galeria ) async {


      _cargandoController.sink.add(true);
      await _galeriaServicios.editarFoto(galeria);
      _cargandoController.sink.add(false);


    }

    void borrarGaleria(  String id ) async {


     
      await _galeriaServicios.borrarProducto(id);
      


    }


    dispose() {
      _galeriaController?.close();
      _cargandoController?.close();

    }







} 