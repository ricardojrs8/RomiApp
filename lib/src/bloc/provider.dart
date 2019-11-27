import 'package:flutter/material.dart';

import 'package:romi/src/bloc/galeria.dart';
export 'package:romi/src/bloc/galeria.dart';

class Provider extends InheritedWidget {

  static Provider _instancia;

  final _galeriabloc = new ProductosBloc();

  factory Provider({ Key key, Widget child }) {

    if ( _instancia == null ) {
      _instancia = new Provider._internal(key: key, child: child );
    }

    return _instancia;

  }

  Provider._internal({ Key key, Widget child })
    : super(key: key, child: child );


  

  // Provider({ Key key, Widget child })
  //   : super(key: key, child: child );

 
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static ProductosBloc productosBloc ( BuildContext context ) {
    return ( context.inheritFromWidgetOfExactType(Provider) as Provider )._galeriabloc;
  }

}