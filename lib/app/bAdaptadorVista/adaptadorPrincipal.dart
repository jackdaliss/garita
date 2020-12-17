import 'package:flutter/material.dart';

import 'package:garita/app/aVista/vistaInicioRegistro.dart';
import 'package:garita/app/cNegocio/negocioLogo.dart';
import 'package:garita/app/cNegocio/negocioPrincipal.dart';
import 'package:garita/app/eRepositorio/baseCloudStore.dart';
import 'package:garita/app/fEntidad/entidadAlerta.dart';
import 'package:garita/app/fEntidad/entidadGarita.dart';
import 'package:get/get.dart';

class AdaptadorPrincipal extends GetxController {
  NegocioPrincipal negocioPrincipal = new NegocioPrincipal();
  var textBusquedaAlerta = TextEditingController();

  static RxInt dat = 0.obs;
  static RxList<EntidadAlerta> listaAlertasFiltrada =
      new List<EntidadAlerta>().obs;

  String nombreCiudadela = 'Esto es un error.';
  @override
  void onInit() {
    super.onInit();
    generarTituloPantalla();
    negocioPrincipal.escuchandoYActualizandoListaAlertas();
  }

  filtrarCodigo() {
    try {
      EntidadAlerta().reasignarAlertasAFiltroAlertas();
      List<EntidadAlerta> listaCopia = EntidadAlerta.listaAlertas;

      listaAlertasFiltrada.value = listaCopia
          .where((element) => element.codigo
              .toLowerCase()
              .contains(textBusquedaAlerta.text.toString().toLowerCase()))
          .toList();
      int ps = 0;
      update(['listaAlerta']);
      /*global.lista_alertas_filtro = global.lista_alertas
                      .w(here(
                        (string) => string.codigo
                            .toLowerCase()
                            .contains(value.toLowerCase()),
                      )
                      .toList();*/
    } catch (ex) {
      int p = 0;
    }
  }

  generarTituloPantalla() {
    try {
      String _nombreCiudadela = EntidadGarita().dameNombre();
      if (_nombreCiudadela != null) {
        nombreCiudadela = EntidadGarita().dameNombre();
      }
    } catch (ex) {}
    update(['nombreCiudadelaId']);
  }

  dameAlertas() async* {
    try {
      yield negocioPrincipal.escuchandoYActualizandoListaAlertas();
    } catch (ex) {
      int p = 0;
    }
  }

  eliminarAlerta(String _documentId) {
    negocioPrincipal.eliminarAlerta(_documentId);
    textBusquedaAlerta.clear();

    try {} catch (e) {}
  }

  Future<void> puedoContinuar() async {
    try {} catch (e) {}
  }
}
