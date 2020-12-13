class CatalogoTextos {
  static CatalogoTextos _instance;
  factory CatalogoTextos() => _instance ??= new CatalogoTextos._();
  CatalogoTextos._();

  String _porFavorRevisaTuConexionAInternet =
      'Por favor, revisa tu conexión a internet.';
  String _noienesConexionAInternet = 'No tienes conexión a internet.';
  String _espereUnMomentPorFavor = 'Espere un momento, por favor...';
  String _teDamosLaBienvenida = 'Te damos la bienvenida';
  String _registrateParaPoderGestionarTusAlertas =
      'Regístrate para poder gestionar tus alertas.';
  String _cualEsElCodigoDeTuCiudadela = '¿Cual es el código de tu ciudadela?';

  String _paraEmitirAlertasNecesitamosQueNosAyudesConElCodigoDeRegistro =
      'Para emitir alertas necesitamos que nos ayudes con el código de registro.';

  String _elCodigoYaEstaSiendoUsado = 'El código ya esta siendo usado.';

  String _elCodigoNoExiste = 'El código no existe.';

  String _errorInesperado = 'Error inesperado.';
  String _elCampoCodigoEstaVacio = 'El campo código, está vacio.';
  String _esteEsTuCodigoComparteloConTusResidentes =
      'Este es tu código, compártelo con tus residentes.';

  String _seGeneroUnErrorAlIntentarGenerarTuRegistro =
      'Se generó un error al intentar generar tu registro.';

  String _lorempTitulo = 'Lorem Ipsum';
  String _lorempSubTitulo = 'Lorem Ipsum es simplemente el texto ';
  String _lorempParrafo =
      'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen.';

  String get porFavorRevisaTuConexionAInternet =>
      _porFavorRevisaTuConexionAInternet;
  String get noienesConexionAInternet => _noienesConexionAInternet;
  String get espereUnMomentPorFavor => _espereUnMomentPorFavor;
  String get teDamosLaBienvenida => _teDamosLaBienvenida;
  String get registrateParaPoderGestionarTusAlertas =>
      _registrateParaPoderGestionarTusAlertas;
  String get cualEsElCodigoDeTuCiudadela => _cualEsElCodigoDeTuCiudadela;
  String get paraEmitirAlertasNecesitamosQueNosAyudesConElCodigoDeRegistro =>
      _paraEmitirAlertasNecesitamosQueNosAyudesConElCodigoDeRegistro;
  String get elCodigoYaEstaSiendoUsado => _elCodigoYaEstaSiendoUsado;
  String get elCodigoNoExiste => _elCodigoNoExiste;
  String get errorInesperado => _errorInesperado;
  String get elCampoCodigoEstaVacio => _elCampoCodigoEstaVacio;
  String get esteEsTuCodigoComparteloConTusResidentes =>
      _esteEsTuCodigoComparteloConTusResidentes;
  String get seGeneroUnErrorAlIntentarGenerarTuRegistro =>
      _seGeneroUnErrorAlIntentarGenerarTuRegistro;
  String get lorempTitulo => _lorempTitulo;
  String get lorempSubTitulo => _lorempSubTitulo;
  String get lorempParrafo => _lorempParrafo;
}
