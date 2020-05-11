import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garita/models/garita.dart';
import 'package:garita/screens/register2.dart';
import 'package:garita/utils/cloudStoreDB.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:garita/library/variables_globales.dart' as global;

class Register1 extends StatefulWidget {
  @override
  _Register1State createState() => _Register1State();
}

final db = Firestore.instance;
String documentId = "";

bool mostrarMensaje = false;

class _Register1State extends State<Register1> {
  final myController = TextEditingController();

  ProgressDialog pr;

  CSDB csdb = new CSDB();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: MyColors.white_grey,
      ),
      body: body(context),
      backgroundColor: MyColors.white_grey,
    );
  }

  Widget body(context) {
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Container(
                        width: 50.0,
                        height: 60.0,
                        child: SizedBox(
                          width: 20.0,
                        ),
                      ),
                    ),
                    Container(
                      height: 50.0,
                      child:
                          Image(image: AssetImage("assets/images/reloj.png")),
                    )
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: Container(
                        width: 50.0,
                        height: 15.0,
                        child: SizedBox(
                          width: 20.0,
                        ),
                      ),
                    ),
                    Container(
                      height: 30.0,
                      child:
                          Image(image: AssetImage("assets/images/directo.png")),
                    )
                  ],
                ),
                FractionallySizedBox(
                  widthFactor: 0.3,
                  child: Container(
                    child:
                        Image(image: AssetImage("assets/images/campana2.png")),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Text(
                  '¿Cual es tu código?',
                  style: TextStyle(
                    color: MyColors.grey30,
                    fontSize: TamanioTexto.titulo,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  child: Text(
                    'Para emitir alertas necesitamos que nos ayudes con el código de registro.',
                    style: TextStyle(
                        color: MyColors.grey60,
                        fontSize: TamanioTexto.subtitulo),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 40,
                    child: TextField(
                      style: TextStyle(
                        fontSize: TamanioTexto.subtitulo,
                        color: MyColors.grey30,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      controller: myController,
                      decoration: InputDecoration(
                        filled: true,
                     
                        fillColor: MyColors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          borderSide:
                              BorderSide(width: 1, color: MyColors.sapphire),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          borderSide:
                              BorderSide(width: 1, color: MyColors.grey60),
                        ),

                        hintText: 'Código',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Builder(
              builder: (context) => Center(
                child: Container(
                  width: Posiciones.obtenerAnchoBotonInferior(context),
                  height: 50.0,
                  child: FlatButton(
                    color: MyColors.sapphire,
                    onPressed: () {
                      setState(
                        () {
                          mostrarMensaje = false;
                        },
                      );

                      _verificarRegistro(context);

                    },
                    child: Text(
                      'CONTINUAR',
                      style: TextStyle(letterSpacing: 1.5, color: MyColors.white
                          ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(22.0),
                        side: BorderSide(color: MyColors.white)),
                  ),
                ),
              ),
            ),
        ),
        SizedBox(height: Posiciones.separacion_inferior_boton,)
      ],
    );
  }

  Widget body1(context) {
    return Container(
      color: MyColors.white_grey,
      child: Column(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Container(
                        width: 50.0,
                        height: 60.0,
                        child: SizedBox(
                          width: 20.0,
                        ),
                      ),
                    ),
                    Container(
                      height: 50.0,
                      child:
                          Image(image: AssetImage("assets/images/reloj.png")),
                    )
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: Container(
                        width: 50.0,
                        height: 15.0,
                        child: SizedBox(
                          width: 20.0,
                        ),
                      ),
                    ),
                    Container(
                      height: 30.0,
                      child:
                          Image(image: AssetImage("assets/images/directo.png")),
                    )
                  ],
                ),
                FractionallySizedBox(
                  widthFactor: 0.3,
                  child: Container(
                    child:
                        Image(image: AssetImage("assets/images/campana2.png")),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Text(
                  '¿Cual es tu código?',
                  style: TextStyle(
                    color: MyColors.grey30,
                    fontSize: TamanioTexto.titulo,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  child: Text(
                    'Para emitir alertas necesitamos que nos ayudes con el código de registro.',
                    style: TextStyle(
                        color: MyColors.grey60,
                        fontSize: TamanioTexto.subtitulo),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 40,
                    child: TextField(
                      style: TextStyle(
                        fontSize: TamanioTexto.subtitulo,
                        color: MyColors.grey30,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      controller: myController,
                      decoration: InputDecoration(
                        filled: true,
                       
                        fillColor: MyColors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          borderSide:
                              BorderSide(width: 1, color: MyColors.sapphire),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          borderSide:
                              BorderSide(width: 1, color: MyColors.grey60),
                        ),

                        hintText: 'Código',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Builder(
              builder: (context) => Center(
                child: Container(
                  width: Posiciones.obtenerAnchoBotonInferior(context),
                  height: 50.0,
                  child: FlatButton(
                    color: MyColors.sapphire,
                    onPressed: () {
                      setState(
                        () {
                          mostrarMensaje = false;
                        },
                      );

                      _verificarRegistro(context);


                    },
                    child: Text(
                      'CONTINUAR',
                      style: TextStyle(letterSpacing: 1.5, color: MyColors.white
                          ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(22.0),
                        side: BorderSide(color: MyColors.white)),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: Posiciones.separacion_inferior_boton,
          )
        ],
      ),
    );
  }

  _verificarRegistro(context) async {
    pr = new ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: true, showLogs: false);
    await pr.show();
    try {
      if (myController.text.length > 0) {
        var userQuery = db
            .collection(Coleccion.registro_garita)
            .where(Campos.cod_garita, isEqualTo: myController.text)
            .limit(1);

        userQuery.getDocuments().then(
          (garita) {
            //VERIFICAR QUE EXISTA EL REGISTRO
            if (garita.documents.length > 0) {
              pr.hide();
              DocumentSnapshot garitaSnap = garita.documents[0];
              String documentIdGarita = garitaSnap.documentID;
              //VERIFICAR QUE NO ESTE OCUPADO
              String documentId = garitaSnap[Campos.document_id] != null
                  ? garitaSnap[Campos.document_id].toString()
                  : "";

              if (documentId.length == 0) {
                //REGISTRARLO

                Garita garita = new Garita();
                garita.codGarita = myController.text;
                garita.documentId = documentIdGarita;
                garita.nombreGarita = garitaSnap['nombre_garita'];
                global.garita = garita;

                _continuar(context);
              } else {
                pr.hide();
                _mostrarMensaje('El codigo ya esta siendo usado.', context);
              }
            } else {
              pr.hide();
              _mostrarMensaje('El código no existe.', context);
            }
          },
        );
      } else {
        pr.hide();
        _mostrarMensaje('El campo esta vacio.', context);
      }
    } catch (e) {
      pr.hide();
      _error();
    }
  }

  _mostrarMensaje(String _mensaje, context) {
    setState(
      () {
        global.mensaje = _mensaje;
        mostrarMensaje = true;
      },
    );

    Scaffold.of(context).showSnackBar(
      SnackBar(
        backgroundColor: MyColors.moccasin,
        content: Text(
          (global.mensaje != null) ? global.mensaje : '',
          style: TextStyle(color: MyColors.grey30),
        ),
        duration: Duration(seconds: 3),
      ),
    );
  }

  _error() {
    setState(
      () {
        mostrarMensaje = false;
      },
    );
  }

  _continuar(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Register2()),
    );
  }

}
