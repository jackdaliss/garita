import 'package:garita/app/aVista/vistaInicioRegistro.dart';
import 'package:garita/app/aVista/vistaPrincipal.dart';
import 'package:garita/app/cNegocio/negocioFinRegistro.dart';
import 'package:garita/app/cNegocio/negocioLogo.dart';
import 'package:garita/app/eRepositorio/baseCloudStore.dart';
import 'package:garita/app/fEntidad/entidadGarita.dart';
import 'package:garita/app/gCatalogo/catalogoTextos.dart';
import 'package:get/get.dart';

class AdaptadorFinRegistro extends GetxController {
  NegocioFinRegistro negocioFinRegistro = new NegocioFinRegistro();
  String mensajeError = '';
  void onInit() {
    super.onInit();
  }

  Future<bool> puedoContinuar() async {
    bool retorno = false;
    try {
      bool retornoRegistroCloudStore =
          await negocioFinRegistro.actualizarRegistrosCloudStore();
      bool retornoRegistroBaseLocal =
          await negocioFinRegistro.creaRegistrosBaseLocal();

      bool retornoCreacionCorrectaRegistro =
          await negocioFinRegistro.registroGraritaFueCorrecto(
              retornoRegistroCloudStore, retornoRegistroBaseLocal);

      if (retornoCreacionCorrectaRegistro) {
        retorno = true;
        //_abrirVistaPrincipal();
      } else {
        retorno = false;
        mensajeError =
            CatalogoTextos().seGeneroUnErrorAlIntentarGenerarTuRegistro;
      }
    } catch (ex) {
      retorno = false;
    }

    return retorno;
  }

  abrirVistaPrincipal() {
    //Get.to(VistaAlertas());
    //TODO lanzar ventana con Get.OffAll()
    Get.offAll(VistaPrincipal());
  }
}
