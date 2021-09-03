//import 'package:centro_ultrasonido/ui/pages/servicios/controller/servicios_controller.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:p4droid_frontend/shared/responisve/responsive.dart';
import 'package:p4droid_frontend/utils/colors_text_and_size.dart';

class ButtonAzul extends StatelessWidget {
  final String title;
  final Callback onPressed;
  final double height;
  final double fontSize;
  final double paddingH;
  final double paddingV;
  final Color? color;

  ButtonAzul({
    required this.title,
    required this.onPressed,
    this.height = 60,
    this.fontSize = 23,
    this.paddingH = 20,
    this.paddingV = 15,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 400,
        ),
        margin: EdgeInsets.symmetric(
            horizontal: this.paddingH, vertical: this.paddingV),
        child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0)),
            height: responsive.optionDevice(
                mobileOption: this.height,
                tabletOption: 45.0,
                desktopOption: 45.0),
            minWidth: responsive.width,
            color: this.color,
            elevation: 6,
            padding: EdgeInsets.all(7.0),
            child: Text(
              this.title,
              style: TextStyle(
                  color:
                      ThemeProvider.of(context)!.brightness == Brightness.light
                          ? Colors.white
                          : textColor,
                  fontSize: responsive.optionDevice(
                      mobileOption: this.fontSize,
                      tabletOption: 16.0,
                      desktopOption: 16.0),
                  fontWeight: FontWeight.w900),
            ),
            onPressed: this.onPressed),
      ),
      //),
    );
  }
}
