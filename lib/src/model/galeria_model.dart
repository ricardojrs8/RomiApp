// To parse this JSON data, do
//
//     final galeriaModel = galeriaModelFromJson(jsonString);

import 'dart:convert';

GaleriaModel galeriaModelFromJson(String str) => GaleriaModel.fromJson(json.decode(str));

String galeriaModelToJson(GaleriaModel data) => json.encode(data.toJson());

class GaleriaModel {
    String id;
    String titulo;
    String comentario;
    String comentario2;
    String fotoUrl;

    GaleriaModel({
        this.id,
        this.titulo = '',
        this.comentario = '',
        this.comentario2 = '',
        this.fotoUrl,
    });

    factory GaleriaModel.fromJson(Map<String, dynamic> json) => GaleriaModel(
        id          : json["id"],
        titulo      : json["titulo"],
        comentario  : json["comentario"],
        comentario2  : json["comentario2"],
        fotoUrl     : json["fotoUrl"],
    );

    Map<String, dynamic> toJson() => {
       // "id"          : id,
        "titulo"      : titulo,
        "comentario"  : comentario,
        "comentario2"  : comentario2,
        "fotoUrl"     : fotoUrl,
    };
}
