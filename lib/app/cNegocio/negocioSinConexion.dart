import 'package:garita/app/hUtil/internet.dart';

class NegocioSinConexion {
  _tengoConexion() async {
    bool retorno = false;
    try {
      retorno = await Internet().conectado(Internet().esperar10Seg);
      if (retorno) {
        return true;
      }
    } catch (ex) {}
    return false;
  }

  puedoContinuar() async {
    bool retorno = false;
    try {
      if (await _tengoConexion()) {
        retorno = true;
      } else {
        retorno = false;
      }
    } catch (ex) {}
    return retorno;
  }
}
