import 'package:flutter/material.dart';
import 'package:garita/app/bAdaptadorVista/adaptadorDetalleAlerta.dart';
import 'package:garita/app/bAdaptadorVista/adaptadorLogo.dart';
import 'package:garita/app/gCatalogo/catalogoColores.dart';
import 'package:garita/app/gCatalogo/catalogoEstadoAlerta.dart';
import 'package:garita/app/gCatalogo/catalogoPosicionControles.dart';
import 'package:garita/app/gCatalogo/catalogoTamanios.dart';

import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class VistaDetalleAlerta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdaptadorDetalleAlerta>(
      init: AdaptadorDetalleAlerta(),
      builder: (_) {
        return Scaffold(
          /*appBar: AppBar(
            backgroundColor: CatalogoColores().azulMedio,
            elevation: 0.0,
          ),*/
          body: SafeArea(
            child: _body(),
          ),
          backgroundColor: CatalogoColores().blanco,
        );
      },
    );
  }

/*


Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /*  _botonCerrar(),
                _avatarDetalle(),
                _detalleFamilia(),
                _detalleTipo(),
                _detalleCodigo(),*/
              ],
            ),
          ),
          Container(
            child: botonesAccion(),
          ),
        ],
      ),
*/

  _body() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _botonCerrar(),
                  _avatarDetalle(),
                  _detalleFamilia(),
                  _detalleTipo(),
                  _detalleCodigo(),
                  botonesAccion()
                ],
              ),
            ),
          ),
          /*Container(
            child: botonesAccion(),
          ),*/
        ],
      ),
    );
  }

  _botonCerrar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 2),
          child: FlatButton(
            child: Icon(
              Icons.clear,
              size: 50,
              color: CatalogoColores().plomoIcono,
            ),
            onPressed: () => Get.back(result: false),
          ),
        )
      ],
    );
  }

  _avatarDetalle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          width: 150,
          image: AssetImage("assets/images/avatar_detalle.png"),
        ),
      ],
    );
  }

  _detalleFamilia() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              'FAMILIA',
              style: TextStyle(
                color: CatalogoColores().plomoLetra,
                fontSize: 25,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: CatalogoColores().azulMedio),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    color: CatalogoColores().blanco),
                child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GetBuilder<AdaptadorDetalleAlerta>(
                      id: 'datosAlerta',
                      builder: (_) => Text(
                        _.familia.isNotEmpty ? _.familia : 'Sin datos',
                        style: TextStyle(
                            color: CatalogoColores().azulMedio, fontSize: 30),
                      ),
                    )),
              ),
            )
          ],
        )
      ],
    );
  }

  _detalleTipo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              'TIPO DE VISITA',
              style: TextStyle(
                color: CatalogoColores().plomoLetra,
                fontSize: 25,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: CatalogoColores().azulMedio),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    color: CatalogoColores().blanco),
                child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GetBuilder<AdaptadorDetalleAlerta>(
                      id: 'datosAlerta',
                      builder: (_) => Text(
                        _.tipo.isNotEmpty ? _.tipo : 'Sin datos',
                        style: TextStyle(
                            color: CatalogoColores().azulMedio, fontSize: 30),
                      ),
                    )),
              ),
            )
          ],
        )
      ],
    );
  }

  _detalleCodigo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              'CÓDIGO',
              style: TextStyle(
                color: CatalogoColores().plomoLetra,
                fontSize: 25,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GetBuilder<AdaptadorDetalleAlerta>(
                      id: 'datosAlerta',
                      builder: (_) => Text(
                        _.codigo.isNotEmpty ? _.codigo : 'Sin datos',
                        style: TextStyle(
                            color: CatalogoColores().azulAlto, fontSize: 60),
                      ),
                    )),
              ),
            ),
          ],
        )
      ],
    );
  }

  botonesAccion() {
    return Row(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: CatalogoPosicionControles()
                    .obtenerUbicacionBotonInferior(Get.context),
                height: 60.0,
                child: GetBuilder<AdaptadorDetalleAlerta>(
                  builder: (_) => FlatButton(
                    color: CatalogoColores().azulMedio,
                    onPressed: () async {
                      //await dialogoEspera.show();
                      //_.puedoContinuar().then((value) => dialogoEspera.hide());
                      _.actualizarAlerta(
                          _.documentIdAlerta, CatalogoEstadoAlerta().aprobada);
                    },
                    child: Text(
                      'APROBAR',
                      style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 1.5,
                          color: CatalogoColores().blanco),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(22.0),
                      side: BorderSide(color: CatalogoColores().azulMedio),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Container(
                width: CatalogoPosicionControles()
                    .obtenerUbicacionBotonInferior(Get.context),
                height: 60.0,
                child: GetBuilder<AdaptadorDetalleAlerta>(
                  builder: (_) => FlatButton(
                    color: CatalogoColores().blanco,
                    onPressed: () async {
                      //await dialogoEspera.show();
                      // _.puedoContinuar().then((value) => dialogoEspera.hide());
                      _.actualizarAlerta(
                          _.documentIdAlerta, CatalogoEstadoAlerta().rechazada);
                    },
                    child: Text(
                      'RECHAZAR',
                      style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 1.5,
                          color: CatalogoColores().azulMedio),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(22.0),
                      side: BorderSide(color: CatalogoColores().azulMedio),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
