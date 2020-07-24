import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:garita/models/garita.dart';
import 'package:garita/screens/listCodes.dart';
import 'package:garita/screens/noConnection.dart';
import 'package:garita/screens/start.dart';
import 'package:garita/utils/localStorageDB.dart';
import 'package:garita/library/variables_globales.dart' as global;

void main() => runApp(MyApp());
final localDb = LocalDataBase();
Garita garita = new Garita();

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
}

class Home extends StatelessWidget {
  //VERIFICA SI EXISTE CONEXION A INTERNET
  _testConnection(context) async {
    var hasConnection = await DataConnectionChecker()
        .hasConnection
        .timeout(Duration(seconds: 10));

    if (hasConnection) {
      _getStart(context);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NoConnection(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _testConnection(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.sapphire,
        elevation: 0.0,
      ),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.3,
          heightFactor: 0.3,
          child: Container(
            child: Image(image: AssetImage("assets/images/campana.png")),
          ),
        ),
      ),
      backgroundColor: MyColors.sapphire,
    );
  }

  _getStart(context) {
    try {
      //LEE DE LA BASE DE DATOS LOCAL
      localDb.read(Campos.cod_garita).then(
        (data) {
          if (data != null) {
            garita.codGarita = data;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListCodes(),
              ),
            );

            _getData();
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Start(),
              ),
            );
          }
        },
      );
    } catch (e) {}
  }

  _getData() {
    localDb.read(Campos.document_id).then(
      (data) {
        garita.documentId = data;
        global.garita = garita;
      },
    );

    localDb.read(Campos.nombre_garita).then(
      (data) {
        garita.nombreGarita = data;
        global.garita = garita;
      },
    );
  }
}
