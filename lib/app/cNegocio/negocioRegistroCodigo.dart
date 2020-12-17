import 'package:garita/app/dAdaptadorNegocio/IadaptadorNegocio.dart';
import 'package:garita/app/eRepositorio/baseCloudStore.dart';
import 'package:garita/app/eRepositorio/baseLocal.dart';
import 'package:garita/app/fEntidad/entidadGarita.dart';
import 'package:garita/app/gCatalogo/catalogoCamposGarita.dart';
import 'package:garita/app/gCatalogo/catalogoTextos.dart';
import 'package:garita/app/hUtil/internet.dart';

class NegocioRegistroCodigo {
  BaseCloudStore baseCloudStore = BaseCloudStore();
  String mensajeError = '';
  Future<bool> tengoInternet() async {
    try {
      bool tengoInternet = await Internet().conectado(Internet().esperar10Seg);
      return tengoInternet;
    } catch (ex) {
      return false;
    }
  }

  capturaConsultaCodigoCorrecta(_consultaCodigo) {
    bool retorno = true;
    try {
      if (_consultaCodigo != null) {
        return retorno;
      } else {
        retorno = false;
      }
    } catch (ex) {
      retorno = false;
    }
    return retorno;
  }

  puedoRegistrarNuevaGarita(_controladorTextoCodigo) async {
    bool retorno = false;
    try {
      var _consultaCodigo = await baseCloudStore
          .damePrimerDocumentoDeCaptura(_controladorTextoCodigo.text);

      //if (capturaConsultaCodigoCorrecta(_consultaCodigo)) {
      /*var documentoGarita =
            baseCloudStore.damePrimerDocumentoDeCaptura(_consultaCodigo);*/

      if (_ducumentoNoEstaVacio(_consultaCodigo)) {
        String documentIdGarita = _consultaCodigo.documentID;

        String documentId = _dameIdDocumento(_consultaCodigo);

//*TODO poner en vez de isNotEmpty -> isEmpty
        if (documentId.isEmpty) {
          _actualizarEntidadGarita(_consultaCodigo, documentIdGarita);
          retorno = true;
        } else {
          mensajeError = CatalogoTextos().elCodigoYaEstaSiendoUsado;
        }
      } else {
        mensajeError = CatalogoTextos().elCodigoNoExiste;
      }
    } catch (ex) {
      mensajeError = CatalogoTextos().errorInesperado;
    }
    return retorno;
  }

  _actualizarEntidadGarita(_documentoGarita, _documentID) {
    try {
      EntidadGarita().actualizarNombre(
          _documentoGarita[CatalogoCamposGarita().nombre_garita]);
      EntidadGarita().actualizarDocumentId(_documentID);
      EntidadGarita().actualizarCodigo(
          _documentoGarita[CatalogoCamposGarita().cod_garita]);
    } catch (ex) {
      int t = 0;
    }
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

  _dameIdDocumento(_documentoGarita) {
    try {
      if (_documentoGarita[CatalogoCamposGarita().document_id] != null) {
        return _documentoGarita[CatalogoCamposGarita().document_id].toString();
      }
    } catch (ex) {}
    return '';
  }
}
