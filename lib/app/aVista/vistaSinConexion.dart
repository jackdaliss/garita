import 'package:garita/app/bAdaptadorVista/adaptadorSinConexion.dart';
import 'package:flutter/material.dart';
import 'package:garita/app/gCatalogo/catalogoColores.dart';
import 'package:garita/app/gCatalogo/catalogoImagenesAplicacion.dart';
import 'package:garita/app/gCatalogo/catalogoPosicionControles.dart';
import 'package:garita/app/gCatalogo/catalogoTamanios.dart';
import 'package:garita/app/gCatalogo/catalogoTextos.dart';
import 'package:garita/app/hUtil/dialogoEspera.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class VistaSinConexion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdaptadorSinConexion>(
      init: AdaptadorSinConexion(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: CatalogoColores().rojoBajo,
            elevation: 0.0,
            automaticallyImplyLeading: false,
          ),
          body: body(),
          backgroundColor: CatalogoColores().rojoBajo,
        );
      },
    );
  }

  Column body() {
    return Column(
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              _textoSinConexion(),
              SizedBox(
                height: 10.0,
              ),
              _textoRevisaTuConexion(),
              _iconoSinConexion(),
            ],
          ),
        ),
        _botonReintentar(),
        SizedBox(height: CatalogoPosicionControles().separacionInferiorBoton)
      ],
    );
  }

  Text _textoSinConexion() {
    return Text(
      'Sin Conexión',
      style: TextStyle(
        color: CatalogoColores().rojoAlto,
        fontSize: CatalogoTamanios().titulo,
      ),
    );
  }

  Container _textoRevisaTuConexion() {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(Get.context).size.width - 40,
      child: Center(
        child: Text(
          CatalogoTextos().porFavorRevisaTuConexionAInternet,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: CatalogoTamanios().subTitulo,
            color: CatalogoColores().rojoAlto,
          ),
        ),
      ),
    );
  }

  Widget _iconoSinConexion() {
    return Expanded(
      child: FractionallySizedBox(
        widthFactor: 0.7,
        heightFactor: 0.7,
        child: Container(
          child: Image(
            image: AssetImage(
              CatalogoImagenesAplicacion().sinConexion,
            ),
          ),
        ),
      ),
    );
  }

  Center _botonReintentar() {
    var dialogoEspera = DialogoEspera().dameDialogoEspera(
      CatalogoTextos().espereUnMomentPorFavor,
      Get.context,
    );

    return Center(
      child: Container(
        width: CatalogoPosicionControles()
            .obtenerUbicacionBotonInferior(Get.context),
        height: 50.0,
        child: GetBuilder<AdaptadorSinConexion>(
          builder: (_) => FlatButton(
            color: CatalogoColores().rojoAlto,
            onPressed: () async {
              await dialogoEspera.show();
              var retorno = await _.puedoContinuar(Get.context);
              await dialogoEspera.hide();
              retorno ? Get.back() : null;
            },
            child: Text(
              'REINTENTAR',
              style: TextStyle(
                letterSpacing: 1.5,
                color: CatalogoColores().blanco,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.0),
              side: BorderSide(
                color: CatalogoColores().rojoMedio,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
