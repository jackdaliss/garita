import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class DialogoEspera {
  static DialogoEspera _instance;
  factory DialogoEspera() => _instance ??= new DialogoEspera._();
  DialogoEspera._();

  ProgressDialog dameDialogoEspera(_mensaje, _context) {
    return _getPopUp(_mensaje, _context);
  }

  _getPopUp(_mensaje, _context) {
    ProgressDialog p = new ProgressDialog(_context,
        type: ProgressDialogType.Normal, isDismissible: true, showLogs: false);

    p.style(
      message: _mensaje,
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      progress: 0.0,
      maxProgress: 100.0,
      progressTextStyle: TextStyle(
          color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(
          color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
    );

    return p;
  }
}
