import 'package:garita/app/dAdaptadorNegocio/IadaptadorNegocio.dart';
import 'package:garita/app/eRepositorio/baseLocal.dart';
import 'package:garita/app/fEntidad/entidadGarita.dart';
import 'package:garita/app/gCatalogo/catalogoCamposGarita.dart';
import 'package:garita/app/hUtil/internet.dart';

class NegocioLogo {
  Future<bool> tengoInternet() async {
    try {
      bool tengoInternet = await Internet().conectado(Internet().esperar10Seg);
      return tengoInternet;
    } catch (ex) {
      return false;
    }
  }

  Future<bool> estoyRegistradoEnAlert() async {
    try {
      String codGarita = await _leerDatoDeBaseLocal(
          new BaseLocal(), CatalogoCamposGarita().cod_garita);
      if (codGarita != null) {
        EntidadGarita().actualizarCodigo(codGarita);
        //TODO cambiar esto para que retorne true, lo he dejado en false por temas de preubas
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      return false;
    }
  }

  Future<String> _leerDatoDeBaseLocal(
      IBaseLocal _baseDeDatos, String _campo) async {
    try {
      return await _baseDeDatos.leer(_campo);
    } catch (ex) {
      return null;
    }
  }

  Future<bool> poblarEntidadGarita() async {
    try {
      String nombreGarita = await _leerDatoDeBaseLocal(
          new BaseLocal(), CatalogoCamposGarita().nombre_garita);
      String documentId = await _leerDatoDeBaseLocal(
          new BaseLocal(), CatalogoCamposGarita().document_id);

      EntidadGarita().actualizarNombre(nombreGarita);
      EntidadGarita().actualizarDocumentId(documentId);
      return true;
    } catch (ex) {
      return false;
    }
  }

  entidadGaritaTieneDatos() {
    return EntidadGarita().tusDatosSonCorrectos();
  }
}
