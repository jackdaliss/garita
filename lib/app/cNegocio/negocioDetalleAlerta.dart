import 'package:garita/app/dAdaptadorNegocio/IadaptadorNegocio.dart';
import 'package:garita/app/eRepositorio/baseCloudStore.dart';
import 'package:garita/app/eRepositorio/baseLocal.dart';
import 'package:garita/app/fEntidad/entidadGarita.dart';
import 'package:garita/app/gCatalogo/catalogoCamposGarita.dart';
import 'package:garita/app/hUtil/internet.dart';

class NegocioDetalleAlerta {
  actualizarAlerta(String _documentId, _estado) {
    try {
      BaseCloudStore().actualizarAlerta(_documentId, _estado);
    } catch (ex) {}
  }
}
