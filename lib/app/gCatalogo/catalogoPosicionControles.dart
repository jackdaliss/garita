import 'package:flutter/material.dart';

class CatalogoPosicionControles {
  static CatalogoPosicionControles _instance;
  factory CatalogoPosicionControles() =>
      _instance ??= new CatalogoPosicionControles._();
  CatalogoPosicionControles._();

  double _separacionInferiorBoton = 10.0;

  double get separacionInferiorBoton => _separacionInferiorBoton;

  obtenerUbicacionBotonInferior(context) {
    return MediaQuery.of(context).size.width - 20;
  }
}
