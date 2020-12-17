import 'package:flutter/material.dart';
import 'package:garita/app/bAdaptadorVista/adaptadorLogo.dart';
import 'package:garita/app/gCatalogo/catalogoColores.dart';
import 'package:garita/app/gCatalogo/catalogoImagenesAplicacion.dart';
import 'package:get/state_manager.dart';

class VistaLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdaptadorLogo>(
      init: AdaptadorLogo(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: CatalogoColores().azulMedio,
            elevation: 0.0,
          ),
          body: body(),
          backgroundColor: CatalogoColores().azulMedio,
        );
      },
    );
  }

  Center body() {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.3,
        heightFactor: 0.3,
        child: Container(
          child: Image(
            image: AssetImage(CatalogoImagenesAplicacion().logoAlertCuadrado),
          ),
        ),
      ),
    );
  }
}
