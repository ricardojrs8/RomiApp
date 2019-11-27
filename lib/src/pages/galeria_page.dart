
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:romi/src/bloc/galeria.dart';
import 'package:romi/src/bloc/provider.dart';
import 'package:romi/src/mixins/validation_mixins.dart';
import 'package:romi/src/model/galeria_model.dart';

import 'package:romi/src/widgets/app.buttonFormu.dart';
import 'package:image_picker/image_picker.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class GaleriaPage extends StatefulWidget {
  static const String routeName = '/galeria';

  @override
  _GaleriaPageState createState() => _GaleriaPageState();
}

class _GaleriaPageState extends State<GaleriaPage> with ValidationMixins {


  final GlobalKey<FormState> _formkey = GlobalKey<FormState>(); // instancia
  final  scaffoldKey = GlobalKey<ScaffoldState>(); // instancia

  ProductosBloc productosBloc;

  GaleriaModel galeria = new GaleriaModel();
  bool _guardando = false;
  File fotog;

  
  var selectedCurrency, selectedType;

    List<String> _suelos = <String>[
    'Arenosos',
    'Calizos',
    'Limosos',
    'Humíferos o de tierra negra',
    'Arcillosos',
    'Pedregosos',
    'Turba',
    'Salinos',

  ];
     List<String> _clima = <String>[
    'Tropical',
    'seco',
    'Moderado',
    'Continental'
    'Polar',
    'Tierras altas'
  ];


  @override
  Widget build(BuildContext context) {

    productosBloc = Provider.productosBloc(context);

    final GaleriaModel galeData = ModalRoute.of(context).settings.arguments;
    if(galeData != null){
      galeria = galeData; // precarga la info
    }

    return Scaffold(
      key: scaffoldKey,
        appBar: AppBar(
          title: Text("Registros"),
          backgroundColor: Colors.grey[800],
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.photo_size_select_actual),
              onPressed: _seleccionarFoto,
            ),
             IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: _tomarFoto,
            ),
          
         
       ],
      ),
    body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              _mostrarFoto(),
              _crearNombre(),
              SizedBox( height: 10.0, ),
              _crearComentario(),
              SizedBox( height: 30.0, ),
              _bropdown(),
              SizedBox( height: 20.0, ),
              _bropdown2(),
              SizedBox( height: 40.0, ),

              _dectecto(),

              SizedBox( height: 30.0, ),
              _submitButton(),
              SizedBox( height: 60.0, ),
              

              
              




            ],

          ),
          
          
          ),
      ),

    ),

    );
  }


  Widget _crearNombre(){
    return TextFormField(
      initialValue: galeria.titulo.toString(),
      onSaved: (value) => galeria.titulo = value,
      validator: validateNombre_galeri,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Nombre'

      ),
    );
  }



  Widget _crearComentario(){
  return new TextFormField(
  initialValue: galeria.comentario.toString(),
  onSaved: (value) => galeria.comentario = value,
  validator: comentario,
  keyboardType: TextInputType.multiline,
  maxLines: 2,
   decoration: InputDecoration(
        labelText: '¿Qué pasó?'

      ),
  
  );
  }

  Widget _dectecto(){
  return new TextFormField(
  initialValue: galeria.comentario.toString(),
  onSaved: (value) => galeria.comentario = value,
  validator: comentario,
  keyboardType: TextInputType.multiline,
  maxLines: 2,
   decoration: InputDecoration(
        labelText: '¿Qué detecto?'

      ),
  
  );
  }



  Widget _bropdown(){
    return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.seedling,
                    size: 25.0,
                    color: Color(0xff11b719),
                  ),
                  SizedBox(width: 50.0),
                  DropdownButton(
                    items: _suelos
                        .map((value) => DropdownMenuItem(
                              child: Text(
                                value,
                                style: TextStyle(color: Color(0xff11b719)),
                              ),
                              value: value,
                            ))
                        .toList(),
                    onChanged: (selectedAccountType) {
                      print('$selectedAccountType');
                      setState(() {
                        selectedType = selectedAccountType;
                      });
                    },
                    value: selectedType,
                    isExpanded: false,
                    hint: Text(
                      'Suelo',
                      style: TextStyle(color: Color(0xff11b719)),
                    ),
                  )
                ],
              );



  }

    Widget _bropdown2(){
    return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.globeAmericas,
                    size: 25.0,
                    color: Color(0xff11b719),
                  ),
                  SizedBox(width: 50.0),
                  DropdownButton(
                    items: _clima
                        .map((value) => DropdownMenuItem(
                              child: Text(
                                value,
                                style: TextStyle(color: Color(0xff11b719)),
                              ),
                              value: value,
                            ))
                        .toList(),
                    onChanged: (selectedAccountType) {
                      print('$selectedAccountType');
                      setState(() {
                        selectedType = selectedAccountType;
                      });
                    },
                    value: selectedType,
                    isExpanded: false,
                    hint: Text(
                      'Clima',
                      style: TextStyle(color: Color(0xff11b719)),
                    ),
                  )
                ],
              );



  }





  Widget _submitButton(){

    return AppButtonFormu(
                color: Colors.grey[800],
                name: "Enviar",
                horizontal1: 10.0,
                vertical1: 15.0,
                onPressed: (_guardando) ? null : _submit,
       


      );
  }

    void _submit() async {

                _formkey.currentState.validate();
                _formkey.currentState.save();// esto dispara el save de todos los texfiedl que esten dentro de ese formulario

                
                setState(() {
                  _guardando = true;
                });

                if (fotog != null){
                  galeria.fotoUrl = await productosBloc.subirFoto(fotog);



                }

                if(galeria.id == null){
                  productosBloc.agregarGaleria(galeria);

                }else{
                  productosBloc.editarGaleria(galeria);
                  }
                  //setState(() { _guardando = false; });
                  mostrarSnackbar('Registro guardado');
                  Navigator.pop(context);



    }
               
       
       void mostrarSnackbar(String mensaje){

            final snackbar = SnackBar(
              content: Text(mensaje),
              duration: Duration( milliseconds:  1500),
            );

            scaffoldKey.currentState.showSnackBar(snackbar);


        }  

     Widget _mostrarFoto(){

          if( galeria.fotoUrl != null ){

            return FadeInImage(
              image: NetworkImage(galeria.fotoUrl),
              placeholder: AssetImage('images/jar-loading.gif'),
              height: 300.0,
              fit: BoxFit.contain,


            );
          } else {

            return Image(
              image: AssetImage( fotog?.path ??  'images/no-image.png'), // pregunta si la foto tiene un valor y si tiene un valor entonces toma el path si es null usa este cogigo
              height: 300.0,
              fit: BoxFit.cover,

            );

          }

        }

        _seleccionarFoto() async {
          
          _procesarImagen(ImageSource.gallery);

        }


        _tomarFoto() async{
          
          _procesarImagen(ImageSource.camera);

        }


        _procesarImagen( ImageSource origen ) async {

             fotog = await ImagePicker.pickImage(
            source: origen
          );

          if( fotog != null ){
            // limpieza
              galeria.fotoUrl = null;

          }

            setState(() {});


        }
    
    
}






