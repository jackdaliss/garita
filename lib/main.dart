import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:garita/app/aVista/vistaDetalleAlerta.dart';
import 'package:garita/app/aVista/vistaLogo.dart';
import 'package:garita/app/aVista/vistaPrincipal.dart';
import 'package:get/route_manager.dart';

void main() => runApp(MyApp());
//final localDb = LocalDataBase();
//Garita garita = new Garita();
/*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '...',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}*/

//CODIGO NUEVO GETX
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '...',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VistaLogo(), //Home(),
    );
  }
}
