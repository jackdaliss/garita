import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:garita/app/dAdaptadorNegocio/IadaptadorNegocio.dart';
import 'package:garita/app/eRepositorio/baseCloudStore.dart';
import 'package:garita/app/eRepositorio/baseLocal.dart';
import 'package:garita/app/fEntidad/entidadAlerta.dart';
import 'package:garita/app/fEntidad/entidadGarita.dart';
import 'package:garita/app/gCatalogo/catalogoCamposGarita.dart';
import 'package:garita/app/hUtil/internet.dart';

class NegocioPrincipal {
  Future<bool> tengoInternet() async {
    try {
      bool tengoInternet = await Internet().conectado(Internet().esperar10Seg);
      return tengoInternet;
    } catch (ex) {
      return false;
    }
  }

  escuchandoYActualizandoListaAlertas() {
    try {
      BaseCloudStore().tengoNuevosDatosDeAlertas();

      /*List<DocumentSnapshot> listaDocumentsAlerta =
          capturaDocumentosAlerta.documents;
      yield listaDocumentsAlerta;*/
    } catch (ex) {
      int p = 0;
    }
  }

  eliminarAlerta(String documentId) {
    try {
      BaseCloudStore().eliminarAlerta(documentId);
    } catch (e) {}
  }

/*
_tengoNuevosDatos() {
    Firestore.instance
        .collection(Coleccion.registro_garita)
        .document(global.garita.documentId)
        .collection(Coleccion.alerta)
        .orderBy('codigo')
        .snapshots()
        .listen(
      (data) {
        global.lista_alertas.clear();
        data.documents.forEach(
          (doc) {
            print(doc["codigo"]);
            setState(
              () {
                Alertas(doc);
                global.lista_alertas_filtro = global.lista_alertas;
              },
            );
          },
        );
      },
    );
  }




  Future<bool> estoyRegistradoEnAlert() async {

*/
}
