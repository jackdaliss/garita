class CatalogoPantallas {
  static CatalogoPantallas _instance;
  factory CatalogoPantallas() => _instance ??= new CatalogoPantallas._();
  CatalogoPantallas._();

  String _vistaInicioRegistro = 'vistaInicioRegistro';

  String get vistaInicioRegistro => _vistaInicioRegistro;
}
