import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garita/app/aVista/vistaDetalleAlerta.dart';
import 'package:garita/app/bAdaptadorVista/adaptadorPrincipal.dart';
import 'package:garita/app/cNegocio/negocioPrincipal.dart';
import 'package:garita/app/eRepositorio/baseCloudStore.dart';
import 'package:garita/app/fEntidad/entidadAlerta.dart';
import 'package:garita/app/fEntidad/entidadGarita.dart';
import 'package:garita/app/gCatalogo/catalogoColores.dart';
import 'package:garita/app/gCatalogo/catalogoTamanios.dart';
import 'package:garita/app/gCatalogo/catalogoTextos.dart';
import 'package:garita/app/gCatalogo/catalogoTiposVisita.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class VistaPrincipal extends StatelessWidget {
  double alturaAlerta = 72;

  @override
  Widget build(BuildContext context) {
    Get.put(EntidadAlerta());
    return GetBuilder<AdaptadorPrincipal>(
      init: AdaptadorPrincipal(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: CatalogoColores().azulMedio,
            title: Center(
              child: GetBuilder<AdaptadorPrincipal>(
                id: 'nombreCiudadelaId',
                builder: (_) => Text(
                  _.nombreCiudadela,
                  style: TextStyle(color: CatalogoColores().blanco),
                ),
              ),
            ),
            automaticallyImplyLeading: false,
            actions: [
              GetBuilder<AdaptadorPrincipal>(
                builder: (_) => Obx(
                  () => Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Chip(
                      backgroundColor: CatalogoColores().azulVerde,
                      padding: EdgeInsets.all(0),
                      label: Text(
                        AdaptadorPrincipal.listaAlertasFiltrada.value.length
                            .toString(),
                        style: TextStyle(
                            color: CatalogoColores().azulAlto, fontSize: 25),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          body: _body(),
          backgroundColor: CatalogoColores().plomoFondo,
        );
      },
    );
  }

  _animacionEspera() {
    return Center(
      child: Expanded(
        child: CircularProgressIndicator(
          backgroundColor: CatalogoColores().azulMedio,
          valueColor:
              AlwaysStoppedAnimation<Color>(CatalogoColores().azulVerde),
        ),
      ),
    );
  }

  _barraEspera() {
    return GetBuilder<AdaptadorPrincipal>(
      id: 'listaAlerta',
      builder: (_) => Obx(() =>
          AdaptadorPrincipal.listaAlertasFiltrada.value.length > 0
              ? SizedBox.shrink()
              : _animacionEspera()),
      //        : LinearProgressIndicator(backgroundColor: Colors.lightBlue)),
    );
  }

  _listaAlertas() {
    return GetBuilder<AdaptadorPrincipal>(
        id: 'listaAlerta',
        builder: (_) => Obx(
              () => ListView.builder(
                itemCount: AdaptadorPrincipal.listaAlertasFiltrada.value.length,
                itemBuilder: (BuildContext build, int index) {
                  return _itemAlerta(
                      (AdaptadorPrincipal.listaAlertasFiltrada.value[index]),
                      Get.context);
                },
              ),
            )
        /*Obx(
            () => Text(
              'TENGO DATO:  ' + AdaptadorPrincipal.dat.value.toString(),
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),*/
        /*Obx(
            () => Text(
              'TOTAL LISTA :  ' +
                  AdaptadorPrincipal.listaAlertasFiltrada.value.length
                      .toString(),
              style: TextStyle(fontSize: 30, color: Colors.yellow),
            ),
          ),*/
        /*        
        ],
      )
*/
        /*child: EntidadAlerta.listaAlertasFiltrada != null
              ? Text('OK.... [ ' +
                  EntidadAlerta.listaAlertasFiltrada.value.length.toString() +
                  ' ]')
              : Text('NO'),*/

        /*(_.listaAlertasFiltrada != null)
              ? _.listaAlertasFiltrada.value.length > 0
                  ? Obx(
                      () => ListView.builder(
                        itemCount: _.listaAlertasFiltrada.value.length,
                        itemBuilder: (BuildContext build, int index) {
                          return _itemAlerta(
                              (_.listaAlertasFiltrada.value[index]),
                              Get.context);
                        },
                      ),
                    )
                  : SizedBox.shrink()
              : SizedBox.shrink()),*/
        //SizedBox.shrink(),

        );
  }

/*
  _listaAlertas() {
    return Expanded(
      child: global.lista_alertas_filtro.length > 0
          ? ListView.builder(
              itemCount: global.lista_alertas_filtro.length,
              itemBuilder: (BuildContext build, int index) {
                return _itemAlerta(
                    (global.lista_alertas_filtro[index]), Get.context);
              },
            )
          : SizedBox.shrink(),
    );
  }
*/

  _campoBusquedaa() {
    return Container(
      child: GetBuilder<AdaptadorPrincipal>(
        builder: (_) => TextField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            WhitelistingTextInputFormatter.digitsOnly
          ],
          controller: _.textBusquedaAlerta,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Buscar código',
            contentPadding: EdgeInsets.only(left: 20),
          ),
          style: TextStyle(
              fontSize: CatalogoTamanios().subTitulo,
              fontWeight: FontWeight.bold,
              color: Colors.grey),
          /*onChanged: (value) {
          /*setState(
                () {
                  global.lista_alertas_filtro = global.lista_alertas
                      .w(here(
                        (string) => string.codigo
                            .toLowerCase()
                            .contains(value.toLowerCase()),
                      )
                      .toList();
                },
              );*/
        },*/
        ),
      ),
    );
  }

  _campoBusqueda() {
    return GetBuilder<AdaptadorPrincipal>(
      builder: (_) => TextField(
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          WhitelistingTextInputFormatter.digitsOnly
        ],
        controller: _.textBusquedaAlerta,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Buscar código',
          contentPadding: EdgeInsets.only(left: 20),
        ),
        style: TextStyle(fontSize: 25, color: CatalogoColores().plomoLetra),
        onChanged: (value) {
          _.filtrarCodigo();

          /*setState(
                () {
                  global.lista_alertas_filtro = global.lista_alertas
                      .w(here(
                        (string) => string.codigo
                            .toLowerCase()
                            .contains(value.toLowerCase()),
                      )
                      .toList();
                },
              );*/
        },
      ),
    );
  }

  _barranferiorBusqueda() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: CatalogoColores().azulVerde, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          color: CatalogoColores().blanco),
      margin: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 15, top: 8, bottom: 8, right: 10),
            child: Icon(
              Icons.search,
              color: CatalogoColores().plomoIcono,
              size: 35,
            ),
          ),
          //_campoBusqueda(),
          Expanded(
            child: _campoBusqueda(),
          ),
          GetBuilder<AdaptadorPrincipal>(
            builder: (_) => FlatButton(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15, top: 8, bottom: 8, right: 10),
                child: Icon(
                  Icons.clear,
                  color: CatalogoColores().plomoIcono,
                  size: 35,
                ),
              ),
              onPressed: () {
                _.textBusquedaAlerta.clear();
                _.filtrarCodigo();
              },
            ),
          )
        ],
      ),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        //...bottom card part,
        //...top circlular image part,
      ],
    );
  }

  /*_body() {
    return Column(
      children: <Widget>[

        _listaAlertas(),
        _campoBusqueda(),
      ],
    );
  }*/

  _body() {
    return Stack(
      children: [
        Container(child: _listaAlertas()),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          left: 0.0,
          child: Container(
            child: _barranferiorBusqueda(),
          ),
        )
      ],
    );
  }

  _itemAlerta(EntidadAlerta alerta, context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: CatalogoColores().blanco),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          color: CatalogoColores().blanco),
      margin: EdgeInsets.only(left: 10, top: 5.0, bottom: 5.0, right: 10),
      //color: CatalogoColores().blanco,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            /*Container(
              width: 10,
              //color: Colors.red,
              height: alturaAlerta,
              /* decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft:
                            //borderRadius: BorderRadius.all(
                            Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    color: CatalogoColores().blanco),*/
            ),
            SizedBox(
              width: 2.0,
            ),*/
            SizedBox(
              width: 5.0,
            ),
            Column(
              children: <Widget>[
                Image(
                  height: 50.0,
                  image:
                      CatalogoTiposVisita().dameImagenTipoVisita(alerta.tipo),
                ),
              ],
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              children: <Widget>[
                Text(
                  alerta.codigo.toString(),
                  style: TextStyle(
                      fontSize: 50.0, color: CatalogoColores().azulAlto),
                ),
              ],
            ),
            SizedBox(
              width: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                (alerta.tipo != null) ? alerta.tipo.toString() : '',
                style: TextStyle(fontSize: 30.0, color: Colors.grey),
              ),
            ),
            Expanded(
              child: Container(child: Text('')),
            ),
            GetBuilder<AdaptadorPrincipal>(
              builder: (_) => Container(
                height: alturaAlerta,
                child: FlatButton(
                  splashColor: Colors.yellow,
//                  color: Colors.red,
                  child: Text(
                    'VER',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: CatalogoColores().azulAlto),
                  ),
                  onPressed: () async {
                    bool retorno =
                        await Get.to(VistaDetalleAlerta(), arguments: alerta);

                    //? probar si esto funciona
                    if (retorno) {
                      FocusManager.instance.primaryFocus.unfocus();
                      EntidadAlerta().reasignarAlertasAFiltroAlertas();
                      _.textBusquedaAlerta.clear();
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
