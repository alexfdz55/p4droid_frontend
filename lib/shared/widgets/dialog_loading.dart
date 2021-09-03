import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p4droid_frontend/shared/widgets/custom_circular_progress.dart';

dialogLoading() {
  Get.dialog(
    AlertDialog(
      elevation: 10,
      titlePadding: EdgeInsets.symmetric(vertical: 40),
      // scrollable: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      title: CustomCircularProgress(
        h: 100,
        w: 100,
      ),
      //content: CustomCircularProgress(),
      // content: Text(
      //   '',
      //   style: TextStyle(fontSize: 18),
      //   textAlign: TextAlign.center,
      // ),
      // actions: <Widget>[
      //   ButtonAzul(
      //       title: 'Aceptar',
      //       height: 40,
      //       fontSize: 20,
      //       onPressed: () => Get.back())

      //   // SizedBox(width: 50),
      // ],
    ),
    barrierDismissible: false,
  );
}
