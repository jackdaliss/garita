class EntidadGarita {
  static EntidadGarita _instance;
  factory EntidadGarita() => _instance ??= new EntidadGarita._();
  EntidadGarita._();

  String _codGarita;
  String _nombre_garita;
  String _document_id;
  String _fecha_registro;

//* ACTUALIZACIONES

  actualizarCodigo(String _codGarita) {
    this._codGarita = _codGarita;
  }

  actualizarFechaRegistro(String _fechaRegistro) {
    this._fecha_registro = _fechaRegistro;
  }

  actualizarNombre(String _nombreGarita) {
    this._nombre_garita = _nombreGarita;
  }

  actualizarDocumentId(String _documentId) {
    this._document_id = _documentId;
  }

//* RETORNOS

  dameLaEntidadGarita() {
    return _instance;
  }

  dameCodigo() {
    return this._codGarita;
  }

  dameNombre() {
    return this._nombre_garita;
  }

  dameDocumentId() {
    return this._document_id;
  }

  dameFechaRegistro() {
    return this._fecha_registro;
  }

  tusDatosSonCorrectos() {
    if (_codGarita != null && _document_id != null) {
      return true;
    } else {
      return false;
    }
  }
}
