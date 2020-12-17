import 'package:garita/app/dAdaptadorNegocio/IadaptadorNegocio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseLocal implements IBaseLocal {
  Future<String> leer(String _campo) async {
    final contenedor = await SharedPreferences.getInstance();
    String dato;
    try {
      dato = contenedor.getString(
            _campo.toUpperCase(),
          ) ??
          null;
      return dato;
    } catch (ex) {
      return null;
    }
  }

  Future<bool> escribir(String _campo, String _valor) async {
    try {
      final contenedor = await SharedPreferences.getInstance();
      final campo = _campo.toUpperCase();
      contenedor.setString(campo, _valor);
      return true;
    } catch (ex) {
      return false;
    }
  }
}
