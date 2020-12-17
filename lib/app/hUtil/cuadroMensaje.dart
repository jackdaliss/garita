import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:garita/app/dAdaptadorNegocio/iadaptadorNegocio.dart';
import 'package:garita/app/gCatalogo/catalogoColores.dart';

class CuadroMensaje {
  //implements IMensaje {
  static CuadroMensaje _instance;
  factory CuadroMensaje() => _instance ??= new CuadroMensaje._();
  CuadroMensaje._();

  Future<void> mostrarMensaje(String _mensage, _context, _colorFondoMensaje,
      _colorMensajeDetalle) async {
    try {
      await _mensaje(
          _mensage, _context, _colorFondoMensaje, _colorMensajeDetalle);
    } catch (ex) {}
  }

  _mensaje(String _mensage, context, _colorFondoMensaje,
      _colorMensajeDetalle) async {
    return Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
      title: "Alerta!",
      messageText: Text(
        _mensage,
        style: TextStyle(
            fontSize: 18.0,
            color: _colorMensajeDetalle,
            fontFamily: "ShadowsIntoLightTwo"),
      ),
      backgroundColor: _colorFondoMensaje,
      duration: Duration(seconds: 3),
    )..show(context);
  }
}
