import 'package:data_connection_checker/data_connection_checker.dart';

class Internet {
  static Internet _instance;
  factory Internet() => _instance ??= new Internet._();
  Internet._();

  int _esperar10Seg = 10;
  int _esperar30Seg = 30;
  int get esperar10Seg => _esperar10Seg;
  int get esperar30Seg => _esperar30Seg;

  Future<bool> conectado(int _cuandoDeboEsperar) async {
    print('>>>>(5) DENTRO DE CONECTADO');
    try {
      print('>>>>(6) VA A HACER PING');
      return await DataConnectionChecker()
          .hasConnection
          .timeout(Duration(seconds: _cuandoDeboEsperar));
    } catch (ex) {
      return null;
    }
  }
}
