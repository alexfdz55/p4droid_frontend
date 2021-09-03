import 'package:flutter/material.dart';

class AgendarButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final double height;
  final double fontSize;
  AgendarButton(
      {required this.title,
      required this.onPressed,
      this.height = 60,
      this.fontSize = 23});

  late Size size;

  @override
  Widget build(BuildContext context) {
    final kColor = Theme.of(context).primaryColor;
    size = MediaQuery.of(context).size;
    return
        // GetBuilder<ServiciosController>(
        //   init: ServiciosController(),
        //   id: 'button_servicio',
        //   builder: (_) =>
        Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 400,
        ),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0)),
            height: this.height,
            minWidth: size.width,
            color: kColor,
            elevation: 6,
            padding: EdgeInsets.all(7.0),
            child: Text(
              this.title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: this.fontSize,
                  fontWeight: FontWeight.w900),
            ),
            onPressed: this.onPressed),
      ),
      //),
    );
  }
}
