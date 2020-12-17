import 'package:flutter/material.dart';

class CatalogoTiposVisita {
  static CatalogoTiposVisita _instance;
  factory CatalogoTiposVisita() => _instance ??= new CatalogoTiposVisita._();
  CatalogoTiposVisita._();

  String _amigos = 'amigos';
  String _taxi = 'taxi';
  String _familia = 'familia';
  String _servicios = 'servicios';
  String _comida = 'comida';

  String get amigos => _amigos;
  String get taxi => _taxi;
  String get familia => _familia;
  String get servicios => _servicios;
  String get comida => _comida;

  dameImagenTipoVisita(String _tipo) {
    try {
      _tipo = _tipo.toLowerCase();

      if (_tipo == _amigos) {
        return AssetImage(
          "assets/images/icono_amigo.png",
        );
      }
      if (_tipo == _taxi) {
        return AssetImage(
          "assets/images/icono_taxi.png",
        );
      }

      if (_tipo == _familia) {
        return AssetImage(
          "assets/images/icono_familia.png",
        );
      }

      if (_tipo == _servicios) {
        return AssetImage(
          "assets/images/icono_servicios.png",
        );
      }
      if (_tipo == _comida) {
        return AssetImage(
          "assets/images/icono_comida.png",
        );
      }

      return AssetImage(
        "assets/images/icono_error.png",
      );
    } catch (e) {
      return AssetImage(
        "assets/images/icono_error.png",
      );
    }
  }
}
