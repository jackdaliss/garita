class Cualquiera {
  String bar; // normal field (getter/setter)
  String baz; // read-only (getter)

  int _weight;
  set weight(int value) {
    assert(weight >= 0);
    _weight = value;
  }

  int get weight => _weight;
}
