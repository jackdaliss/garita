class CatalogoTamanios {
  static CatalogoTamanios _instance;
  factory CatalogoTamanios() => _instance ??= new CatalogoTamanios._();
  CatalogoTamanios._();

  double _extraGrande = 40.0;
  double _grande = 35.0;
  double _titulo = 30.0;
  double _subTitulo = 22.0;
  double _parrafo = 18.0;

  double get extraGrande => _extraGrande;
  double get grande => _grande;
  double get titulo => _titulo;
  double get subTitulo => _subTitulo;
  double get parrafo => _parrafo;
}
