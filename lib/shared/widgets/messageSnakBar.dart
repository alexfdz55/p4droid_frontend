import 'package:flutter/material.dart';

snakBarMessage(
    {required String texto,
    required GlobalKey<ScaffoldState> key,
    bool errorColor = false,
    int time = 1000}) {
  Color redColor = Colors.red.withOpacity(0.8);
  Color greenColor = Colors.green;

  key.currentState!.showSnackBar(
    SnackBar(
      backgroundColor: Colors.white,
      margin: EdgeInsets.only(bottom: 10, left: 30, right: 30),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      content: Text(
        texto,
        textAlign: TextAlign.center,
        style:
            TextStyle(fontSize: 18, color: errorColor ? redColor : greenColor),
      ),
    ),
  );
  Future.delayed(Duration(milliseconds: time), () {
    // update(['login']);
  });
}
