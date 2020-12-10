import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garita/models/garita.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:garita/library/variables_globales.dart' as global;

final firestore = Firestore.instance;

class ListCodes extends StatefulWidget {
  @override
  _ListCodesState createState() => _ListCodesState();
}

var _editingController = TextEditingController();

class _ListCodesState extends State<ListCodes> {
  @override
  void initState() {
    super.initState();
    setState(
      () {
        _onGetNewData();
        global.lista_alertas_filtro = global.lista_alertas;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return new Future(() => false);
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: MyColors.sapphire,
          title: Center(
              child: Text(
            'Alertas ' +
                ((global.garita.nombreGarita.length != null)
                    ? global.garita.nombreGarita
                    : ''),
            style: TextStyle(color: MyColors.white),
          )),
          automaticallyImplyLeading: false,
        ),
        body: _body(),
        backgroundColor: MyColors.white,
      ),
    );
  }

  _body() {
    return Column(
      children: <Widget>[
        Expanded(
          child: global.lista_alertas_filtro.length > 0
              ? ListView.builder(
                  itemCount: global.lista_alertas_filtro.length,
                  itemBuilder: (BuildContext build, int index) {
                    return _item((global.lista_alertas_filtro[index]), context);
                  },
                )
              : SizedBox.shrink(),
        ),
        Container(
          margin: EdgeInsets.all(5.0),
          child: TextField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              WhitelistingTextInputFormatter.digitsOnly
            ],
            controller: _editingController,
            decoration: InputDecoration(
              hintText: 'Buscar',
              contentPadding: EdgeInsets.only(left: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(22),
                ),
                borderSide: BorderSide(width: 1, color: MyColors.sapphire),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(22),
                ),
                borderSide: BorderSide(width: 1, color: MyColors.grey60),
              ),
            ),
            style: TextStyle(
                fontSize: TamanioTexto.texto_campo_busqueda,
                fontWeight: FontWeight.bold,
                color: MyColors.grey60),
            onChanged: (value) {
              setState(
                () {
                  global.lista_alertas_filtro = global.lista_alertas
                      .where(
                        (string) => string.codigo
                            .toLowerCase()
                            .contains(value.toLowerCase()),
                      )
                      .toList();
                },
              );
            },
          ),
        ),
      ],
    );
  }

  _item(UsAlerta alerta, context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 10.0,
            ),
            Column(
              children: <Widget>[
                Image(
                  height: 40.0,
                  image: AssetImage(
                    "assets/images/campana3.png",
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              children: <Widget>[
                Text(
                  alerta.codigo.toString(),
                  style: TextStyle(fontSize: 50.0, color: MyColors.sapphire),
                ),
              ],
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              children: <Widget>[
                Text(
                  (alerta.familia != null)
                      ? alerta.familia.toString()
                      : 'Vacio',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: MyColors.grey30,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  (alerta.tipo != null) ? alerta.tipo.toString() : '',
                  style: TextStyle(fontSize: 20.0, color: MyColors.grey60),
                ),
              ],
            ),
          ],
        ),
        onTap: () {
          setState(
            () {
              _button(alerta);
            },
          );
        },
      ),
    );
  }

  _button(UsAlerta alerta) {
    String familia =
        (alerta.familia != null) ? "Fam. " + alerta.familia : 'DESCONOCIDO';
    String direccion =
        (alerta.direccion != null) ? ": Dir. " + alerta.direccion : '';
    String tituloFam = familia + direccion;

    var alertStyle = AlertStyle(
      animationType: AnimationType.fromTop,
      isCloseButton: false,
      isOverlayTapDismiss: true,
    );

    return Alert(
      closeFunction: () => null,
      context: context,
      type: AlertType.info,
      title: tituloFam,
      style: alertStyle,
      desc: (alerta.tipo != null)
          ? "Solicitud de: " + alerta.tipo.toUpperCase()
          : "Tipo de solicitud desconocida",
      buttons: [
        DialogButton(
          child: Text(
            "NEGAR",
            style: TextStyle(color: MyColors.sapphire, fontSize: 20),
          ),
          onPressed: () {
            _eliminarAlerta(alerta.documentId);
            Navigator.of(context, rootNavigator: true).pop();
          },
          color: MyColors.white,
        ),
        DialogButton(
          child: Text(
            "APROBAR",
            style: TextStyle(color: MyColors.white, fontSize: 20),
          ),
          onPressed: () {
            _eliminarAlerta(alerta.documentId);
            Navigator.of(context, rootNavigator: true).pop();
          },
          color: MyColors.sapphire,
        )
      ],
    ).show();
  }

  _eliminarAlerta(String documentID) async {
    await firestore
        .collection(Coleccion.registro_garita)
        .document(global.garita.documentId)
        .collection(Coleccion.alerta)
        .document(documentID)
        .delete();
    setState(() {
      _editingController.clear();
      global.lista_alertas_filtro = global.lista_alertas;
    });
  }

  _onGetNewData() {
    Firestore.instance
        .collection(Coleccion.registro_garita)
        .document(global.garita.documentId)
        .collection(Coleccion.alerta)
        .orderBy('codigo')
        .snapshots()
        .listen(
      (data) {
        global.lista_alertas.clear();
        data.documents.forEach(
          (doc) {
            print(doc["codigo"]);
            setState(
              () {
                Alertas(doc);
                global.lista_alertas_filtro = global.lista_alertas;
              },
            );
          },
        );
      },
    );
  }
}
