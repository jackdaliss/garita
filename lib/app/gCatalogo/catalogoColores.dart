import 'package:flutter/material.dart';

class CatalogoColores {
  static CatalogoColores _instance;
  factory CatalogoColores() => _instance ??= new CatalogoColores._();
  CatalogoColores._();

  Color _azulVerde = Color(0xff91C7C9);
  Color _blanco = Color(0xffFFFFFF);
  Color _azulBajo = Color(0xff6486A5);
  Color _azulMedio = Color(0xff005989);
  Color _azulAlto = Color(0xff051733);
  Color _amarilloBajo = Color(0xffFFE7B7);
  Color _amarilloMedio = Color(0xffFFE492);
  Color _amarilloAlto = Color(0xff4D4001);
  Color _rojoBajo = Color(0xffFFD7B7);
  Color _rojoMedio = Color(0xffFFB293);
  Color _rojoAlto = Color(0xff4D0301);
  Color _plomoFondo = Color(0xffE4E4E4);
  Color _plomoIcono = Color(0xff4c5264);
  Color _plomoLetra = Color(0xffBCC5D3);

  Color get azulVerde => _azulVerde;
  Color get blanco => _blanco;
  Color get azulBajo => _azulBajo;
  Color get azulMedio => _azulMedio;
  Color get azulAlto => _azulAlto;
  Color get amarilloBajo => _amarilloBajo;
  Color get amarilloMedio => _amarilloMedio;
  Color get amarilloAlto => _amarilloAlto;
  Color get rojoBajo => _rojoBajo;
  Color get rojoMedio => _rojoMedio;
  Color get rojoAlto => _rojoAlto;
  Color get plomoFondo => _plomoFondo;
  Color get plomoIcono => _plomoIcono;
  Color get plomoLetra => _plomoLetra;
}
