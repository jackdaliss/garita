import 'package:flutter/material.dart';

class CatalogoEstadoAlerta {
  static CatalogoEstadoAlerta _instance;
  factory CatalogoEstadoAlerta() => _instance ??= new CatalogoEstadoAlerta._();
  CatalogoEstadoAlerta._();

  String _nueva = '0';
  String _aprobada = '1';
  String _rechazada = '2';

  String get nueva => _nueva;
  String get aprobada => _aprobada;
  String get rechazada => _rechazada;
}
