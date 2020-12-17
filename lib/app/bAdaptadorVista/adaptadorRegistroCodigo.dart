import 'package:flutter/material.dart';

import 'package:garita/app/aVista/vistaInicioRegistro.dart';
import 'package:garita/app/aVista/vistaSinConexion.dart';
import 'package:garita/app/cNegocio/negocioLogo.dart';
import 'package:garita/app/cNegocio/negocioRegistroCodigo.dart';
import 'package:garita/app/gCatalogo/catalogoPantallas.dart';
import 'package:garita/app/gCatalogo/catalogoTextos.dart';
import 'package:get/get.dart';

class AdaptadorRegistroCodigo extends GetxController {
  NegocioRegistroCodigo negocioRegistroCodigo = NegocioRegistroCodigo();
  var controladorTextoCodigo = TextEditingController();
  String mensajeError = '';

  void onInit() {
    super.onInit();
  }

  _abrirVistaInicioRegistro() {
    Get.to(VistaInicioRegistro());
  }

  Future<bool> puedoContinuar() async {
    bool retorno = false;

    try {
      if (controladorTextoCodigo.text.isNotEmpty) {
        retorno = await negocioRegistroCodigo
            .puedoRegistrarNuevaGarita(controladorTextoCodigo);
      } else {
        negocioRegistroCodigo.mensajeError =
            CatalogoTextos().elCampoCodigoEstaVacio;
        retorno = false;
      }
    } catch (ex) {
      retorno = false;
    }
    this.mensajeError = negocioRegistroCodigo.mensajeError;
    return retorno;
  }
}
