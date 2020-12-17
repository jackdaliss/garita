class CatalogoColeccionesCloudStore {
  static CatalogoColeccionesCloudStore _instance;
  factory CatalogoColeccionesCloudStore() =>
      _instance ??= new CatalogoColeccionesCloudStore._();
  CatalogoColeccionesCloudStore._();

  //String alertas_json = 'alertas_json';
  String _registro_garita = 'registro_garita';
  String _alerta = 'alerta';

  String get registro_garita => _registro_garita;
  String get alerta => _alerta;
}
