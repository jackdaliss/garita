import 'package:garita/app/eRepositorio/baseCloudStore.dart';
import 'package:garita/app/eRepositorio/baseLocal.dart';
import 'package:garita/app/fEntidad/entidadGarita.dart';
import 'package:garita/app/gCatalogo/catalogoCamposGarita.dart';
import 'package:garita/app/gCatalogo/catalogoColeccionesCloudStore.dart';

class NegocioFinRegistro {
  actualizarRegistrosCloudStore() {
    try {
//* document_id
      BaseCloudStore().actualizarColeccion(
          CatalogoColeccionesCloudStore().registro_garita,
          CatalogoCamposGarita().document_id,
          EntidadGarita().dameDocumentId(),
          EntidadGarita().dameDocumentId());

//* fecha_registro
      BaseCloudStore().actualizarColeccion(
          CatalogoColeccionesCloudStore().registro_garita,
          CatalogoCamposGarita().fecha_registro,
          EntidadGarita().dameDocumentId(),
          DateTime.now().toString());

      return true;
    } catch (ex) {
      return false;
    }
  }

  creaRegistrosBaseLocal() {
    try {
      BaseLocal().escribir(
          CatalogoCamposGarita().cod_garita, EntidadGarita().dameCodigo());
      BaseLocal().escribir(
          CatalogoCamposGarita().nombre_garita, EntidadGarita().dameNombre());
      BaseLocal().escribir(
          CatalogoCamposGarita().document_id, EntidadGarita().dameDocumentId());
      return true;
    } catch (e) {
      return false;
    }
  }

  registroGraritaFueCorrecto(
      _retornoRegistroCloudStore, _retornoRegistroBaseLocal) async {
    bool retorno = false;
    try {
      if (_retornoRegistroCloudStore && _retornoRegistroBaseLocal) {
        var documentoGarita = await BaseCloudStore()
            .damePrimerDocumentoDeCaptura(EntidadGarita().dameCodigo());

        if (_ducumentoNoEstaVacio(documentoGarita)) {
          retorno = true;
        }
      }
//      retorno = false;
    } catch (e) {
      retorno = false;
    }
    return retorno;
  }

  _ducumentoNoEstaVacio(_documentoGarita) {
    bool retorno = false;
    try {
      if (_documentoGarita != null) {
        retorno = true;
      } else {
        retorno = false;
      }
    } catch (ex) {
      return false;
    }
    return retorno;
  }
}
