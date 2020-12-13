class CatalogoImagenesAplicacion {
  static CatalogoImagenesAplicacion _instance;
  factory CatalogoImagenesAplicacion() =>
      _instance ??= new CatalogoImagenesAplicacion._();
  CatalogoImagenesAplicacion._();

  String _guardia = 'assets/images/guardia.png';
  String _sinConexion = 'assets/images/sin_conexion.png';
  String _llave = 'assets/images/llave.png';
  String _logoAlertHorizontal = 'assets/images/logo_alert_horizontal.png';
  String _logrado = 'assets/images/logrado.png';
  String _logoAlertCuadrado = 'assets/images/logo_alert_cuadrado.png';

  String get guardia => _guardia;
  String get sinConexion => _sinConexion;
  String get llave => _llave;
  String get logoAlertHorizontal => _logoAlertHorizontal;
  String get logrado => _logrado;
  String get logoAlertCuadrado => _logoAlertCuadrado;
}
