import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garita/library/variables_globales.dart' as global;
import 'package:garita/models/garita.dart';
import 'package:garita/screens/listCodes.dart';
import 'package:garita/utils/localStorageDB.dart';

final db = Firestore.instance;
final localDb = LocalDataBase();

class Register2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registro',
      home: Scaffold(
        /*appBar: AppBar(
          backgroundColor: MyColors.white_grey,
          elevation: 0.0,
        ),*/
        body: SafeArea(
          child: body(context),
        ),
        backgroundColor: MyColors.white_grey,
      ),
    );
  }

  body(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 30.0,
            ),
            Container(
              height: 30.0,
              child: Image(image: AssetImage("assets/images/directo.png")),
            )
          ],
        ),
        SizedBox(
          height: 15.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Container(
                width: 40.0,
                height: 5.0,
                child: SizedBox(
                  width: 20.0,
                ),
              ),
            ),
            Container(
              height: 50.0,
              child: Image(image: AssetImage("assets/images/reloj.png")),
            )
          ],
        ),
        SizedBox(
          height: 50.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'BIENVENIDO!',
                style: TextStyle(
                    letterSpacing: 1.2,
                    color: MyColors.grey60,
                    fontSize: TamanioTexto.texto_pequenio),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                global.garita.codGarita,
                style: TextStyle(
                    letterSpacing: 1.7,
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: MyColors.grey30),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Text(
                  'Este es tu código, compártelo con tus residentes ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: MyColors.grey60,
                    fontSize: TamanioTexto.texto_pequenio,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
        Builder(
          builder: (context) => Center(
            child: Container(
              width: Posiciones.obtenerAnchoBotonInferior(context),
              height: 50.0,
              child: FlatButton(
                color: MyColors.sapphire,
                onPressed: () {
                  _finalizar(context);
                },
                child: Text(
                  'FINALIZAR',
                  style: TextStyle(letterSpacing: 1.5, color: MyColors.white),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(22.0),
                    side: BorderSide(color: MyColors.white)),
              ),
            ),
          ),
        ),
        SizedBox(height: Posiciones.separacion_inferior_boton),
      ],
    );
  }

  _finalizar(context) {
    //GUARDAR EN CLOUD
    _guardarDb(Coleccion.registro_garita, Campos.document_id,
        global.garita.documentId, global.garita.documentId);
    _guardarDb(Coleccion.registro_garita, Campos.fecha_registro,
        DateTime.now().toString(), global.garita.documentId);
    _continuar(context);

    //GUARDAR LOCAL
    print("***** " +
        global.garita.codGarita +
        "  #  " +
        global.garita.nombreGarita +
        "  #  " +
        global.garita.documentId);
    localDb.save(Campos.cod_garita, global.garita.codGarita);
    localDb.save(Campos.nombre_garita, global.garita.nombreGarita);
    localDb.save(Campos.document_id, global.garita.documentId);
  }

  _guardarDb(
      String collection, String field, String value, String documentId) async {
    await db
        .collection(collection)
        .document(documentId)
        .updateData({field: value});
  }

  _continuar(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListCodes()),
    );
  }
}
