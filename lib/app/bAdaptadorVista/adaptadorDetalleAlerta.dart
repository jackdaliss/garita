import 'package:garita/app/aVista/vistaInicioRegistro.dart';
import 'package:garita/app/cNegocio/negocioDetalleAlerta.dart';
import 'package:garita/app/cNegocio/negocioLogo.dart';
import 'package:garita/app/fEntidad/entidadAlerta.dart';
import 'package:get/get.dart';

class AdaptadorDetalleAlerta extends GetxController {
  NegocioDetalleAlerta negocioDetalleAlerta = new NegocioDetalleAlerta();
  EntidadAlerta entidadAlerta;

  String familia = '';
  String tipo = '';
  String codigo = '';
  String documentIdResidente = '';
  String documentIdAlerta = '';

  void onInit() {
    super.onInit();
    entidadAlerta = Get.arguments;
    actualizarDatosAlerta();
  }

  actualizarDatosAlerta() {
    try {
      if (entidadAlerta != null) {
        familia = entidadAlerta.familia;
        tipo = entidadAlerta.tipo;
        codigo = entidadAlerta.codigo;
        documentIdAlerta = entidadAlerta.document_id_alerta;
        update(['datosAlerta']);
      }
    } catch (ex) {}
  }

  actualizarAlerta(_documentId, _estado) {
    try {
      negocioDetalleAlerta.actualizarAlerta(_documentId, _estado);
      Get.back(result: true);
    } catch (ex) {}
  }
/*
  _button(EntidadAlerta alerta) {
    String familia =
        (alerta.familia != null) ? "Fam. " + alerta.familia : 'DESCONOCIDO';
    String direccion =
        (alerta.direccion != null) ? ": Dir. " + alerta.direccion : '';
    String tituloFam = familia + direccion;

    return Alert(
      closeFunction: null,
      context: Get.context,
      type: AlertType.info,
      title: tituloFam,
      style: alertStyle,
      desc: (alerta.tipo != null)
          ? "Solicitud de: " + alerta.tipo.toUpperCase()
          : "Tipo de solicitud desconocida",
      buttons: [
        DialogButton(
          child: Text(
            "NEGAR",
            style: TextStyle(color: MyColors.sapphire, fontSize: 20),
          ),
          onPressed: () {
            // _eliminarAlerta(alerta.documentId);
            //Navigator.of(context, rootNavigator: true).pop();
          },
          color: MyColors.white,
        ),
        DialogButton(
          child: Text(
            "APROBAR",
            style: TextStyle(color: MyColors.white, fontSize: 20),
          ),
          onPressed: () {
            AdaptadorPrincipal().eliminarAlerta(alerta.document_id);
            // _eliminarAlerta(alerta.document_id);
            Get.back();
            //Navigator.of(context, rootNavigator: true).pop();
          },
          color: MyColors.sapphire,
        )
      ],
    ).show();
  }*/
}
