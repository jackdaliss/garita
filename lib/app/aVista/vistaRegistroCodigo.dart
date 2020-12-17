import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:garita/app/aVista/vistaFinRegistro.dart';
import 'package:garita/app/bAdaptadorVista/adaptadorRegistroCodigo.dart';
import 'package:garita/app/gCatalogo/catalogoColores.dart';
import 'package:garita/app/gCatalogo/catalogoImagenesAplicacion.dart';
import 'package:garita/app/gCatalogo/catalogoPosicionControles.dart';
import 'package:garita/app/gCatalogo/catalogoTamanios.dart';
import 'package:garita/app/gCatalogo/catalogoTextos.dart';
import 'package:garita/app/hUtil/cuadroMensaje.dart';
import 'package:garita/app/hUtil/dialogoEspera.dart';
import 'package:get/get.dart';

class VistaRegistroCodigo extends StatelessWidget {
  SizedBox _espacio(double _alto, double _ancho) {
    return SizedBox(
      height: _alto,
      width: _ancho,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdaptadorRegistroCodigo>(
      init: AdaptadorRegistroCodigo(),
      builder: (_) {
        return Scaffold(
            resizeToAvoidBottomPadding: true,
            body: SafeArea(
              child: _body(
                Get.context,
              ),
            ),
            backgroundColor: CatalogoColores().blanco);
      },
    );
  }

/*
  Flex _body(context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Expanded(
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    //_espacio(30, null),

                    Container(
                      child: _logoHorizontal(),
                    ),
                    _espacio(50, null),
                    _imagen(),
                    _espacio(50, null),

                    Container(
                      child: textoCodigoCiudadela(),
                    ),
                    _espacio(20, null),
                    Container(
                      child: textoDetalleCodigoCiudadela(),
                    ),
                    _espacio(25, null),
                    Container(
                      child: campoIngresoCodigo(),
                    ),
                    _espacio(30, null),
                  ],
                ),
              )),
        ),
        botonContinuar(),
        //   botonConitnuar(),
        SizedBox(
          height: CatalogoPosicionControles().separacionInferiorBoton,
        )
      ],
    );
  }*/
  TextStyle _style() {
    return TextStyle(fontSize: 50);
  }

/*


  Container _body(context) {
    return Container(
      child: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                color: Colors.green,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //_logoHorizontal(),
                      Container(
                        color: Colors.blue,
                        height: 50,
                        width: 150,
                      ),
                      _espacio(50, null),
                      _imagen(),
                      _espacio(50, null),







                      
                      textoCodigoCiudadela(),
                      _espacio(20, null),
                      textoDetalleCodigoCiudadela(),
                      _espacio(25, null),
                      campoIngresoCodigo(),
                      _espacio(30, null),



                    ],
                  ),
                ),
              ),
            ),
            botonContinuar(),
            //   botonConitnuar(),
            SizedBox(
              height: CatalogoPosicionControles().separacionInferiorBoton,
            ),
            /*Container(
              child: Text(
                'Hola',
                style: TextStyle(fontSize: 40),
              ),
              color: Colors.red,
            )*/
          ],
        ),
      ),
    );
  }
*/
  Container _body(context) {
    final size = MediaQuery.of(Get.context).size;
    return Container(
      width: size.width,
      height: size.height,
      color: CatalogoColores().blanco,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(height: size.height * 0.12),
                _imagen(),
                SizedBox(height: size.height * 0.05),
                textoCodigoCiudadela(),
                SizedBox(height: size.height * 0.01),
                textoDetalleCodigoCiudadela(),
                SizedBox(height: size.height * 0.10),
                campoIngresoCodigo(),
                SizedBox(height: size.height * 0.1),
                botonContinuar(),
              ],
            ),
          ),
          /*Positioned(
            bottom: 0,
            left: size.width * 0.02,
            child: Column(
              children: [
                botonContinuar(),
                SizedBox(
                  height: CatalogoPosicionControles().separacionInferiorBoton,
                ),
              ],
            ),
          )*/
        ],
      ),
    );
  }

  FractionallySizedBox _logoHorizontal() {
    return FractionallySizedBox(
      widthFactor: 0.3,
      child: Container(
        child: Image(
          image: AssetImage(
            CatalogoImagenesAplicacion().logoAlertHorizontal,
          ),
        ),
      ),
    );
  }

  Center _imagen() {
    return Center(
      child: Container(
        child: FractionallySizedBox(
          widthFactor: 0.7,
          child: Image(
            width: 200, //MediaQuery.of(Get.context).size.width - 200,
            image: AssetImage(CatalogoImagenesAplicacion().llave),
          ),
        ),
      ),
    );
  }

  Text textoCodigoCiudadela() {
    return Text(
      CatalogoTextos().cualEsElCodigoDeTuCiudadela,
      style: TextStyle(
        color: CatalogoColores().azulMedio,
        fontSize: CatalogoTamanios().subTitulo,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Align textoDetalleCodigoCiudadela() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.of(Get.context).size.width - 40,
        child: Text(
          CatalogoTextos()
              .paraEmitirAlertasNecesitamosQueNosAyudesConElCodigoDeRegistro,
          style: TextStyle(
            color: CatalogoColores().azulAlto,
            fontSize: CatalogoTamanios().parrafo,
          ),
        ),
      ),
    );
  }

  Center campoIngresoCodigo() {
    return Center(
      child: Container(
        width: MediaQuery.of(Get.context).size.width - 40,
        child: GetBuilder<AdaptadorRegistroCodigo>(
          builder: (_) => TextField(
            style: TextStyle(
              fontSize: CatalogoTamanios().parrafo,
              color: CatalogoColores().azulAlto,
            ),
            textAlignVertical: TextAlignVertical.center,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              WhitelistingTextInputFormatter.digitsOnly
            ],
            controller: _.controladorTextoCodigo,
            decoration: InputDecoration(
              filled: true,
              fillColor: CatalogoColores().blanco,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
                borderSide: BorderSide(
                  width: 1,
                  color: CatalogoColores().rojoAlto,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
                borderSide: BorderSide(
                  width: 1,
                  color: CatalogoColores().azulVerde,
                ),
              ),
              hintText: 'Código',
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Align botonContinuar() {
    var dialogoEspera = DialogoEspera().dameDialogoEspera(
      CatalogoTextos().espereUnMomentPorFavor,
      Get.context,
    );
    return Align(
      alignment: Alignment.bottomCenter,
      child: Builder(
        builder: (context) => Center(
          child: Container(
            width: CatalogoPosicionControles()
                .obtenerUbicacionBotonInferior(Get.context),
            height: 50.0,
            child: GetBuilder<AdaptadorRegistroCodigo>(
              builder: (_) => FlatButton(
                color: CatalogoColores().azulMedio,
                onPressed: () async {
                  /* await dialogoEspera.show();

                  bool retorno = await _.puedoContinuar();
                  dialogoEspera.hide();

                  if (!retorno) {
                    CuadroMensaje().mostrarMensaje(
                        _.mensajeError,
                        Get.context,
                        CatalogoColores().azulMedio,
                        CatalogoColores().amarilloMedio);
                  } else {
                    Get.offAll(VistaFinRegistro());
                  }*/
                  await dialogoEspera.show();
                  var retorno = await _.puedoContinuar();
                  await dialogoEspera.hide();
                  if (!retorno) {
                    await CuadroMensaje().mostrarMensaje(
                      _.mensajeError,
                      Get.context,
                      CatalogoColores().azulMedio,
                      CatalogoColores().amarilloMedio,
                    );
                  } else {
                    await Get.offAll(VistaFinRegistro());
                  }
                },
                child: Text(
                  'CONTINUAR',
                  style: TextStyle(
                    letterSpacing: 1.5,
                    color: CatalogoColores().blanco,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0),
                  side: BorderSide(
                    color: CatalogoColores().blanco,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
