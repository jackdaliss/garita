import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:garita/app/bAdaptadorVista/adaptadorFinRegistro.dart';
import 'package:garita/app/bAdaptadorVista/adaptadorPrincipal.dart';
import 'package:garita/app/dAdaptadorNegocio/IadaptadorNegocio.dart';
import 'package:garita/app/fEntidad/entidadAlerta.dart';
import 'package:garita/app/fEntidad/entidadGarita.dart';
import 'package:garita/app/gCatalogo/catalogoCamposAlerta.dart';
import 'package:garita/app/gCatalogo/catalogoCamposGarita.dart';
import 'package:garita/app/gCatalogo/catalogoColeccionesCloudStore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseCloudStore {
  final baseCloudStore = Firestore.instance;
  int p = 0;

  damePrimerDocumentoDeCaptura(_controladorTextoCodigo) async {
    //bool retorno = false;
    int p = 0;
    var retorno = null;
    try {
      var consultaCodigo = baseCloudStore
          .collection(CatalogoColeccionesCloudStore().registro_garita)
          .where(CatalogoCamposGarita().cod_garita,
              isEqualTo: _controladorTextoCodigo)
          .limit(1);

      await consultaCodigo.getDocuments().then((_documentosCaptura) {
        if (_documentosCaptura.documents.length > 0) {
          DocumentSnapshot primerDocumentoCaptura =
              _documentosCaptura.documents[0];
          retorno = primerDocumentoCaptura;
          //return primerDocumentoCaptura;
        }
      });

      return retorno;
    } catch (ex) {
      return null;
    }
  }

  damePrimerDocumentoDeCapturan(_consultaCodigo) {
    try {
      _consultaCodigo.getDocuments().then((_documentosCaptura) {
        if (_documentosCaptura.documents.length > 0) {
          DocumentSnapshot primerDocumentoCaptura =
              _documentosCaptura.documents[0];
          return primerDocumentoCaptura;
        }
      });
    } catch (ex) {
      return null;
    }
  }

  actualizarColeccion(String _coleccion, String _campo, String _documentId,
      String _nuevoValor) async {
    try {
      await baseCloudStore
          .collection(_coleccion)
          .document(_documentId)
          .updateData({_campo: _nuevoValor});
      return true;
    } catch (e) {
      return false;
    }
  }

//! aqui revisar que hay codigo quemado
  tengoNuevosDatosDeAlertas() {
    try {
      Firestore.instance
          .collection('registro_garita')
          .document(EntidadGarita().dameDocumentId())
          //.document('1dfuvVBx9vmOLhiP7slS')
          .collection('alerta')
          .orderBy('codigo')
          .snapshots()
          .listen(
        (datoRecibidoAlerta) {
          EntidadAlerta().crearNuevaInstanciaAlerta();
          print('llego dato.......................................');
          datoRecibidoAlerta.documents.forEach(
            (doc) async {
              EntidadAlerta().agregarAlerta(doc);

              p++;
//              AdaptadorPrincipal.dat.value = p;
            },
          );
        },
      );
    } catch (ex) {
      null;
    }
  }

  eliminarAlerta(String documentId) async {
    await baseCloudStore
        .collection(CatalogoColeccionesCloudStore().registro_garita)
        .document(CatalogoCamposGarita().document_id)
        .collection(CatalogoColeccionesCloudStore().alerta)
        .document(documentId)
        .delete();
    //EntidadAlerta().reasignarAlertasAFiltro();
  }

  actualizarAlerta(String _documentId, _estado) async {
    try {
      await baseCloudStore
          .collection(CatalogoColeccionesCloudStore().registro_garita)
          .document(EntidadGarita().dameDocumentId())
          .collection(CatalogoColeccionesCloudStore().alerta)
          .document(_documentId)
          .updateData({CatalogoCamposAlerta().estado: _estado});
      return true;
    } catch (ex) {
      return false;
    }
  }

  /*
QuerySnapshot tengoNuevosDatosDeAlertas() {
    try {
      Firestore.instance
          .collection(CatalogoColeccionesCloudStore().registro_garita)
          .document(EntidadGarita().dameDocumentId())
          .collection(CatalogoColeccionesCloudStore().alerta)
          .orderBy(CatalogoCamposAlerta().codigo)
          .snapshots()
          .listen(
        (datoRecibidoAlerta) async* {
          print('llego dato.......................................');
          yield datoRecibidoAlerta;
        },
      );
    } catch (ex) {
      return null;
    }
  }
  */
}
