import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:garita/app/bAdaptadorVista/adaptadorPrincipal.dart';
import 'package:garita/app/gCatalogo/catalogoCamposAlerta.dart';
import 'package:garita/app/gCatalogo/catalogoEstadoAlerta.dart';
import 'package:get/get.dart';

class EntidadAlerta extends GetxController {
  /*static EntidadAlerta _instance;
  factory EntidadAlerta() => _instance ??= new EntidadAlerta._();
  EntidadAlerta._();*/

  String _codigo = '';
  String _duracion = '';
  String _direccion = '';
  String _tipo = '';
  String _familia = '';
  String _document_id_residente = '';
  bool _estado = false;
  String _document_id_alerta = '';

  String get codigo => _codigo;
  String get duracion => _duracion;
  String get direccion => _direccion;
  String get tipo => _tipo;
  String get familia => _familia;
  String get document_id_residente => _document_id_residente;
  bool get estado => _estado;
  String get document_id_alerta => _document_id_alerta;

  static List<EntidadAlerta> listaAlertas = new List<EntidadAlerta>();
  static List<EntidadAlerta> listaAlertasFiltrada = new List<EntidadAlerta>();

  /*EntidadAlerta creaUnaNuevaAlerta(
      _codigo, _duracion, _direccion, _tipo, _familia, _document_id) {
    EntidadAlerta entidadAlerta = EntidadAlerta();
    entidadAlerta._codigo = _codigo;
    entidadAlerta._duracion = _duracion;
    entidadAlerta._direccion = _direccion;
    entidadAlerta._tipo = _tipo;
    entidadAlerta._familia = _familia;
    entidadAlerta._document_id = _document_id;
    return entidadAlerta;
  }*/

  _puedoAgregarLaAlerta(_alerta) {
    try {
      if (_alerta == null) {
        int g = 0;
        return false;
      }
      //? CUANDO ES NULL
      if (_alerta[CatalogoCamposAlerta().estado] == null) {
        int p = 0;
        return true;
      }

//? CUANDO ES NUEVA
      if (_alerta[CatalogoCamposAlerta().estado] ==
          CatalogoEstadoAlerta().nueva) {
        int p = 0;
        return true;
      }

//? CUANDO FUE APROBADA
      if (_alerta[CatalogoCamposAlerta().estado] ==
          CatalogoEstadoAlerta().aprobada) {
        int p = 0;
        return false;
      }

//? CUANDO FUE RECHAZADA
      if (_alerta[CatalogoCamposAlerta().estado] ==
          CatalogoEstadoAlerta().rechazada) {
        int p = 0;
        return false;
      }
    } catch (e) {}
  }

  _documentoAAlerta(DocumentSnapshot _captura_documento) {
    try {
      EntidadAlerta entidadAlerta = new EntidadAlerta();
      if (_puedoAgregarLaAlerta(_captura_documento)) {
        entidadAlerta._codigo =
            _captura_documento[CatalogoCamposAlerta().codigo];
        entidadAlerta._duracion =
            _captura_documento[CatalogoCamposAlerta().duracion];
        entidadAlerta._direccion =
            _captura_documento[CatalogoCamposAlerta().direccion];

        entidadAlerta._tipo = _captura_documento[CatalogoCamposAlerta().tipo];

        entidadAlerta._familia =
            _captura_documento[CatalogoCamposAlerta().familia];
        entidadAlerta._document_id_residente =
            _captura_documento[CatalogoCamposAlerta().document_id];
        entidadAlerta._document_id_alerta = _captura_documento.documentID;

        return entidadAlerta;
      } else {
        return null;
      }
      //String _nuevaAlerta = _captura_documento[CatalogoCamposAlerta().nueva];

    } catch (ex) {
      return null;
    }
  }
  //AdaptadorPrincipal.dat.value = p;

  crearNuevaInstanciaAlerta() {
    listaAlertasFiltrada = null;
    listaAlertas = <EntidadAlerta>[];
  }

  bool agregarAlerta(DocumentSnapshot _alerta) {
    try {
      var alerta = _documentoAAlerta(_alerta);
      if (alerta != null) {
        listaAlertas.add(alerta);
      }

      reasignarAlertasAFiltroAlertas();
      return true;
    } catch (e) {
      return false;
    }
  }

  reasignarAlertasAFiltroAlertas() {
    listaAlertasFiltrada = listaAlertas;
    AdaptadorPrincipal.listaAlertasFiltrada.value =
        EntidadAlerta.listaAlertasFiltrada;
  }
}
