import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garita/library/variables_globales.dart' as global;

class Alertas {
  Alertas(DocumentSnapshot doc) {
    UsAlerta usAlerta = new UsAlerta();
    usAlerta.codigo = doc['codigo'];
    usAlerta.duracion = doc['duracion'];
    usAlerta.direccion = doc['direccion'];
    usAlerta.tipo = doc['tipo'];
    usAlerta.familia = doc['familia'];
    usAlerta.documentId = doc.documentID;
    global.lista_alertas.add(usAlerta);
  }
}

class Garita {
  List<UsAlerta> alertasJson;
  String codGarita;
  List<UsCodigoAlertaJson> codigoAlertaJson;
  String fechaRegistro;
  String generador;
  String nombreGarita;
  String documentId;

  Garita(
      {this.codGarita,
      this.fechaRegistro,
      this.generador,
      this.nombreGarita,
      this.documentId});
}

class UsAlerta {
  String documentId;
  String codigo;
  String duracion;
  String fecha;
  String hashId;

  String tipo;
  String familia;
  String direccion;

  UsAlerta(
      {this.codigo,
      this.duracion,
      this.fecha,
      this.hashId,
      this.tipo,
      this.familia,
      this.direccion});
}

class UsCodigoAlertaJson {
  String codigo;
  UsCodigoAlertaJson({this.codigo});
}

class Campos {
  static String alertas_json = 'alertas_json';
  static String cod_garita = 'cod_garita';
  static String codigos_alerta_json = 'codigos_alerta_json';
  static String fecha_registro = 'fecha_registro';
  static String generador_residente = 'generador_residente';
  static String generador_alerta = 'generador_alerta';
  static String nombre_garita = 'nombre_garita';
  static String document_id = 'document_id';
}

class Coleccion {
  static String registro_garita = 'registro_garita';
  static String alerta = 'alerta';
}

class MyColors{
 static Color sapphire=Color(0xff0A1C66);
 static Color white=Color(0xffFFFFFF);
 static Color moccasin=Color(0xffFDE0B4);
 static Color lavender_blue=Color(0xffC7DBFE);
 static Color grey30=Color(0xff595856);
 static Color grey60=Color(0xff9A9997);
 static Color tory_blue=Color(0xff2B4292);
 static Color white_grey=Color(0xffFEFEFE);
 static Color white_grey_ligth=Color(0xffF9FAF5);
}

class TamanioTexto{
  static double logo=26.0;
  static double titulo=22.0;
  static double subtitulo=18.0;
  static double texto_pequenio=15.0;
}

class Posiciones{
  static double separacion_inferior_boton=10.0;
  static double obtenerAnchoBotonInferior(context){
    return MediaQuery.of(context).size.width - 20;
  }
}