import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p4droid_frontend/shared/widgets/button_azul.dart';
import 'package:p4droid_frontend/utils/colors_text_and_size.dart';

customDialog({
  String title = '',
  required String text,
  bool error = true,
  required Function action,
  bool dismissible = true,
}) {
  Get.dialog(
    AlertDialog(
      scrollable: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      title: error
          ? Text(
              'ERROR',
              style: TextStyle(color: Colors.red, fontSize: 28),
              textAlign: TextAlign.center,
            )
          : Text(
              title,
              style: TextStyle(color: Colors.green, fontSize: 28),
              textAlign: TextAlign.center,
            ),
      content: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(color: textColor, fontSize: 18),
            textAlign: TextAlign.center,
          )
          //SettingsWidget()
        ],
      ),
      actions: <Widget>[
        ButtonAzul(
            color: Get.theme.primaryColor,
            title: 'Aceptar',
            height: 40,
            fontSize: 15,
            onPressed: () {
              Get.back();
              action();
            })
        // TextButton(
        //     child: Text('Aceptar'),
        //     onPressed: () {
        //       Get.back();
        //     }),
      ],
    ),
    barrierDismissible: dismissible,
  );
}
