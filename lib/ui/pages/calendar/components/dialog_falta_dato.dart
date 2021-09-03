import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p4droid_frontend/shared/widgets/button_azul.dart';

dialogFaltaDato(String dato) {
  Get.dialog(
    AlertDialog(
      scrollable: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      title: Text(
        '$dato',
        style: TextStyle(fontSize: 22),
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        ButtonAzul(
            title: 'Aceptar',
            height: 40,
            fontSize: 20,
            onPressed: () => Get.back())

        // SizedBox(width: 50),
      ],
    ),
    barrierDismissible: true,
  );
}
