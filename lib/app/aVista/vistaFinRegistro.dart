import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garita/app/bAdaptadorVista/adaptadorFinRegistro.dart';
import 'package:garita/app/fEntidad/entidadGarita.dart';
import 'package:garita/app/gCatalogo/catalogoColores.dart';
import 'package:garita/app/gCatalogo/catalogoPosicionControles.dart';
import 'package:garita/app/gCatalogo/catalogoTamanios.dart';
import 'package:garita/app/gCatalogo/catalogoTextos.dart';
import 'package:garita/app/hUtil/cuadroMensaje.dart';
import 'package:garita/app/hUtil/dialogoEspera.dart';

import 'package:get/get.dart';
import 'package:progress_dialog/progress_dialog.dart';

final firestore = Firestore.instance;

class VistaFinRegistro extends StatelessWidget {
//? este es el que sirve
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdaptadorFinRegistro>(
      init: AdaptadorFinRegistro(),
      builder: (_) {
        return Scaffold(
          body: body(),
          backgroundColor: CatalogoColores().blanco,
        );
      },
    );
  }

  _textoListo() {
    return Text(
      'Listo!',
      style: TextStyle(
          letterSpacing: 1.2,
          color: CatalogoColores().azulMedio,
          fontSize: CatalogoTamanios().titulo,
          fontWeight: FontWeight.bold),
    );
  }

  _textoCodigoGarita() {
    return Text(
      EntidadGarita().dameCodigo(),
      style: TextStyle(
          letterSpacing: 1.7,
          fontSize: 60,
          fontWeight: FontWeight.bold,
          color: CatalogoColores().azulMedio),
    );
  }

  _textoDescripcion() {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      child: Text(
        CatalogoTextos().esteEsTuCodigoComparteloConTusResidentes,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey,
          fontSize: CatalogoTamanios().subTitulo,
        ),
      ),
    );
  }

  _botonFinalizar() {
    ProgressDialog dialogoEspera = DialogoEspera().dameDialogoEspera(
        CatalogoTextos().espereUnMomentPorFavor, Get.context);
    return Builder(
      builder: (context) => Center(
          child: Container(
        width: CatalogoPosicionControles()
            .obtenerUbicacionBotonInferior(Get.context),
        height: 50.0,
        child: GetBuilder<AdaptadorFinRegistro>(
          builder: (_) => FlatButton(
            color: CatalogoColores().azulMedio,
            onPressed: () async {
              await dialogoEspera.show();
              bool retorno = await _.puedoContinuar();

              dialogoEspera.hide();
              if (!retorno) {
                CuadroMensaje().mostrarMensaje(
                    _.mensajeError, Get.context, Colors.red, Colors.yellow);
              } else {
                _.abrirVistaPrincipal();
              }

              //_end(context);
            },
            child: Text(
              'FINALIZAR',
              style: TextStyle(
                  letterSpacing: 1.5, color: CatalogoColores().blanco),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.0),
              side: BorderSide(color: CatalogoColores().blanco),
            ),
          ),
        ),
      )),
    );
  }

//? Este es el que sirve
  body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 30.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 30.0,
            ),
            /*
            Container(
              height: 30.0,
              child: Image(image: AssetImage("assets/images/directo.png")),
            )*/
          ],
        ),
        SizedBox(
          height: 15.0,
        ),
        /*
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Container(
                width: 40.0,
                height: 5.0,
                child: SizedBox(
                  width: 20.0,
                ),
              ),
            ),
            /*
            Container(
              height: 50.0,
              child: Image(image: AssetImage("assets/images/reloj.png")),
            )*/
          ],
        ),*/
        SizedBox(
          height: 50.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _textoListo(),
              SizedBox(
                height: 10.0,
              ),
              SizedBox(height: 20),
              FractionallySizedBox(
                widthFactor: 0.7,
                child: Container(
                  child: Image(image: AssetImage("assets/images/logrado.png")),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              _textoCodigoGarita(),
              SizedBox(
                height: 20.0,
              ),
              _textoDescripcion(),
              SizedBox(
                height: 20.0,
              ),
              _botonFinalizar(),
            ],
          ),
        ),
//        _botonFinalizar(),
        /*SizedBox(
            height: CatalogoPosicionControles()
                .obtenerUbicacionBotonInferior(Get.context)),*/
      ],
    );
  }

/*
  body(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 30.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 30.0,
            ),
            Container(
              height: 30.0,
              child: Image(image: AssetImage("assets/images/directo.png")),
            )
          ],
        ),
        SizedBox(
          height: 15.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Container(
                width: 40.0,
                height: 5.0,
                child: SizedBox(
                  width: 20.0,
                ),
              ),
            ),
            Container(
              height: 50.0,
              child: Image(image: AssetImage("assets/images/reloj.png")),
            )
          ],
        ),
        SizedBox(
          height: 50.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'BIENVENIDO!',
                style: TextStyle(
                    letterSpacing: 1.2,
                    color: MyColors.grey60,
                    fontSize: TamanioTexto.texto_pequenio),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                global.garita.codGarita,
                style: TextStyle(
                    letterSpacing: 1.7,
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: MyColors.grey30),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Text(
                  'Este es tu código, compártelo con tus residentes ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: MyColors.grey60,
                    fontSize: TamanioTexto.texto_pequenio,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
        Builder(
          builder: (context) => Center(
            child: Container(
              width: Posiciones.getBottomButtonSize(context),
              height: 50.0,
              child: FlatButton(
                color: MyColors.sapphire,
                onPressed: () {
                  _end(context);
                },
                child: Text(
                  'FINALIZAR',
                  style: TextStyle(letterSpacing: 1.5, color: MyColors.white),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(22.0),
                  side: BorderSide(color: MyColors.white),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: Posiciones.separacion_inferior_boton),
      ],
    );
  }*/

}
