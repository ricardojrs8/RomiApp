import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:romi/src/bloc/provider.dart';
import 'package:romi/src/model/galeria_model.dart';



class ListGaleria extends StatelessWidget {
  static const String routeName = '/galeria1';
     

  
  @override
  Widget build(BuildContext context) {

    //final bloc = Provider.of(context);
    final galeriaBloc = Provider.productosBloc(context);
    galeriaBloc.cargarGaleria();
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.grey[800],
      ),
      body: _crearListado(galeriaBloc),
      floatingActionButton: _crearBoton( context ),

    );

  
  }


  Widget _crearListado( ProductosBloc  productosBloc ) {

    return StreamBuilder(

      stream: productosBloc.galeriaStream,
      builder: (BuildContext context, AsyncSnapshot<List<GaleriaModel>> snapshot){
       if ( snapshot.hasData){

          final foto = snapshot.data;
          return ListView.builder(
            itemCount: foto.length,
            itemBuilder: (context, i) => _crearItem(context, productosBloc, foto[i]),

          );

         } else {

           return Center( child: CircularProgressIndicator());

          }
      },

    
    );


    }


    Widget _crearItem(BuildContext context, ProductosBloc productosBloc, GaleriaModel  foto){

      return Dismissible(
        key:  UniqueKey(),
        background: Container(
        color: Colors.red,
        ),
        onDismissed: (direccion) => productosBloc.borrarGaleria(foto.id),

          child: Card( // mejorar las cartas 
            child: Column(
              children: <Widget>[

                  (foto.fotoUrl == null)
                  ? Image(image: AssetImage('images/no-image.png'))
                  : FadeInImage(
                    image: NetworkImage(foto.fotoUrl),
                    placeholder: AssetImage('images/jar-loading.gif'),
                    height: 300.0,
                    width: double.infinity,
                    fit: BoxFit.cover,

                  ),
                    ListTile(
                    title:  Text('${ foto.titulo}'),
                    subtitle: Text( '${foto.comentario}' ),
                   onTap: () => Navigator.pushNamed(context, '/galeria', arguments: foto),
                     ),

              ],
            ),


          ), 
      );

    }

  

   Widget _crearBoton(BuildContext context){

      return FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[800],
        onPressed: ()=> Navigator.pushNamed(context, '/galeria'),
      );


    }


  
}