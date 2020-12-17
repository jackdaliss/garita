class CatalogoCamposGarita {
  static CatalogoCamposGarita _instance;
  factory CatalogoCamposGarita() => _instance ??= new CatalogoCamposGarita._();
  CatalogoCamposGarita._();

  //String alertas_json = 'alertas_json';
  String _cod_garita = 'cod_garita';
  //String codigos_alerta_json = 'codigos_alerta_json';
  String _fecha_registro = 'fecha_registro';
  //String generador_residente = 'generador_residente';
  //String generador_alerta = 'generador_alerta';
  String _nombre_garita = 'nombre_garita';
  String _document_id = 'document_id';

  String get cod_garita => _cod_garita;
  String get nombre_garita => _nombre_garita;
  String get document_id => _document_id;
  String get fecha_registro => _fecha_registro;
}
