import 'package:flutter/material.dart';
import 'package:garita/app/aVista/vistaInicioRegistro.dart';
import 'package:garita/app/aVista/vistaLogo.dart';
import 'package:garita/app/cNegocio/negocioSinConexion.dart';
import 'package:garita/app/fEntidad/entidadAlerta.dart';
import 'package:garita/app/gCatalogo/catalogoColores.dart';
import 'package:garita/app/gCatalogo/catalogoTextos.dart';
import 'package:garita/app/hUtil/dialogoEspera.dart';
import 'package:garita/main.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

import 'package:progress_dialog/progress_dialog.dart';

class AdaptadorSinConexion extends GetxController {
  NegocioSinConexion negocioSinConexion = new NegocioSinConexion();
  String vista;
  bool estado = true;
  @override
  void onInit() {
    super.onInit();
//    vista = Get.arguments;
  }

  Future<bool> puedoContinuar(_contexto) async {
    /*progressDialog = DialogoEspera()
        .dameDialogoEspera(CatalogoTextos().espereUnMomentPorFavor, _contexto);*/
    //await progressDialog.show();

    //waitDialog(_contexto, duration: Duration(seconds: 3));

    print('>>>>(1) INICIO DE PROCESO');
    bool retorno = await negocioSinConexion.puedoContinuar();
    print('>>>>(11) FIN DE PROCESO');
    /*if (retorno) {
      _abrirVistaLogo();
    }*/
    //}
    //await _esperaUnMomento();
    print('>>>>(12) ANTES DE OCULTAR PROGRES DIALOG');
    //progressDialog.hide();
    print('>>>>(13) DESPUES DE OCULTAR PROGRES DIALOG');
    return retorno;
  }

  _esperaUnMomento() async {
    await Future.delayed(const Duration(seconds: 3), () {
      int i = 0;
    });
  }

  _abrirVistaLogo() async {
    //Get.to(VistaLogo());
    Get.back(result: '');
  }

  mostrar() {
    estado = true;
    update(['01']);
  }

  ocultar() {
    estado = false;
    update(['01']);
  }
}
