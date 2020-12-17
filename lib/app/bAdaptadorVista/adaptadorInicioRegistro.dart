import 'package:garita/app/aVista/vistaInicioRegistro.dart';
import 'package:garita/app/aVista/vistaRegistroCodigo.dart';
import 'package:garita/app/aVista/vistaSinConexion.dart';
import 'package:garita/app/cNegocio/negocioInicioRegistro.dart';
import 'package:garita/app/gCatalogo/catalogoPantallas.dart';
import 'package:get/get.dart';

class AdaptadorInicioRegistro extends GetxController {
  NegocioInicioRegistro negocioInicioRegistro = new NegocioInicioRegistro();

  @override
  void onInit() {
    super.onInit();
  }

  Future<bool> puedoContinuar() async {
    bool retorno = await negocioInicioRegistro.tengoInternet();
    if (!retorno) {
      await _abrirVistaSinConexion();
    }

    _abrirVistaRegistroCodigo();
    return retorno;
  }

  _abrirVistaRegistroCodigo() {
    Get.offAll(VistaRegistroCodigo());
    //Get.snackbar('CONTINUAR', 'Si, ahora puedo continuar');
  }

  /*_abrirVistaSinConexion() {
    Get.to(VistaSinConexion());
  }*/

  _abrirVistaSinConexion() async {
    String datToSend = CatalogoPantallas().vistaInicioRegistro.toString();
    final result = await Get.to(VistaSinConexion(), arguments: datToSend);
  }
}
