class CatalogoCamposAlerta {
  static CatalogoCamposAlerta _instance;
  factory CatalogoCamposAlerta() => _instance ??= new CatalogoCamposAlerta._();
  CatalogoCamposAlerta._();

  String _codigo = 'codigo';
  String _duracion = 'duracion';
  String _direccion = 'direccion';
  String _tipo = 'tipo';
  String _familia = 'familia';
  String _document_id = 'documentId';
  String _estado = 'estado';

  String get codigo => _codigo;
  String get duracion => _duracion;
  String get direccion => _direccion;
  String get tipo => _tipo;
  String get familia => _familia;
  String get document_id => _document_id;
  String get estado => _estado;
}
