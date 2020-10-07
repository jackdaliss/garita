//import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:garita/app/bAdaptadorVista/adaptadorInicioRegistro.dart';
import 'package:garita/app/gCatalogo/catalogoColores.dart';
import 'package:garita/app/gCatalogo/catalogoImagenesAplicacion.dart';
import 'package:garita/app/gCatalogo/catalogoPosicionControles.dart';
import 'package:garita/app/gCatalogo/catalogoTamanios.dart';
import 'package:garita/app/gCatalogo/catalogoTextos.dart';
import 'package:garita/app/hUtil/dialogoEspera.dart';
import 'package:get/get.dart';

class VistaInicioRegistro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdaptadorInicioRegistro>(
      init: AdaptadorInicioRegistro(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: CatalogoColores().azulMedio,
            elevation: 0.0,
            automaticallyImplyLeading: false,
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    _titulo(),
                    SizedBox(
                      height: 10.0,
                    ),
                    _subTitulo(),
                    _imagen(),
                  ],
                ),
              ),
              _botonContinuar(),
              SizedBox(
                  height: CatalogoPosicionControles()
                      .obtenerUbicacionBotonInferior(Get.context)),
            ],
          ),
          backgroundColor: CatalogoColores().azulMedio,
        );
      },
    );
  }

  Text _titulo() {
    return Text(
      CatalogoTextos().teDamosLaBienvenida,
      style: TextStyle(
        color: CatalogoColores().amarilloBajo,
        fontSize: CatalogoTamanios().titulo,
      ),
    );
  }

  Container _subTitulo() {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(Get.context).size.width - 40,
      child: Center(
        child: Text(
          CatalogoTextos().registrateParaPoderGestionarTusAlertas,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: CatalogoTamanios().subTitulo,
              color: CatalogoColores().blanco),
        ),
      ),
    );
  }

  Expanded _imagen() {
    return Expanded(
      child: FractionallySizedBox(
        widthFactor: 0.7,
        heightFactor: 0.7,
        child: Container(
          child: Image(
            image: AssetImage(CatalogoImagenesAplicacion().guardia),
          ),
        ),
      ),
    );
  }

  Center _botonContinuar() {
    var dialogoEspera = DialogoEspera().dameDialogoEspera(
        CatalogoTextos().espereUnMomentPorFavor, Get.context);
    return Center(
      child: Container(
        width: CatalogoPosicionControles()
            .obtenerUbicacionBotonInferior(Get.context),
        height: 50.0,
        child: GetBuilder<AdaptadorInicioRegistro>(
          builder: (_) => FlatButton(
            color: CatalogoColores().blanco,
            onPressed: () async {
              await _.puedoContinuar().then(
                    (value) => dialogoEspera.hide(),
                  );
            },
            child: Text(
              'CONTINUAR',
              style: TextStyle(
                letterSpacing: 1.5,
                color: CatalogoColores().azulMedio,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.0),
              side: BorderSide(color: CatalogoColores().blanco),
            ),
          ),
        ),
      ),
    );
  }
}
