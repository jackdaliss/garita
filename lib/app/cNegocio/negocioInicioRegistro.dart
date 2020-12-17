import 'package:garita/app/hUtil/internet.dart';

class NegocioInicioRegistro {
  Future<bool> tengoInternet() async {
    try {
      bool tengoInternet = await Internet().conectado(Internet().esperar10Seg);
      return tengoInternet;
    } catch (ex) {
      return false;
    }
  }
}
