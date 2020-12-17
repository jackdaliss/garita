import 'package:garita/app/aVista/vistaInicioRegistro.dart';
import 'package:garita/app/aVista/vistaPrincipal.dart';
import 'package:garita/app/cNegocio/negocioLogo.dart';
import 'package:get/get.dart';

class AdaptadorLogo extends GetxController {
  NegocioLogo negocioLogo = new NegocioLogo();

  void onInit() {
    super.onInit();
    puedoContinuar().then((value) => null);
  }

  Future<void> puedoContinuar() async {
    try {
      if (!await negocioLogo.estoyRegistradoEnAlert()) {
        Future.delayed(Duration(seconds: 2), () {
          _abrirVistaInicioRegistro();
        });

        return;
      }

      await negocioLogo.poblarEntidadGarita();
      if (negocioLogo.entidadGaritaTieneDatos()) {
        _abrirVistaAlertas();
      } else {
        // mostrar un error inesperado}
        int p = 0;
      }
    } catch (ex) {
      //controlar error inesperado
      int h = 0;
    }
  }

  _abrirVistaAlertas() {
    Get.offAll(VistaPrincipal());
  }

  _abrirVistaInicioRegistro() {
    Get.offAll(VistaInicioRegistro());
  }
}
