import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:p4droid_frontend/share_prefs/preferencias_usuario.dart';

appbarCustom({required String title}) {
  final context = Get.context!;
  final prefs = PreferenciasUsuario();
  return AppBar(
    //centerTitle: true,
    title: Text(title),

    actions: [
      InkWell(
        child: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                    //color: Colors.red,
                    borderRadius: BorderRadius.circular(70.0)),
                height: 50,
                width: 40,
                child: Icon(
                  FontAwesomeIcons.solidBell,
                  color: // Get.theme.scaffoldBackgroundColor,
                      ThemeProvider.of(context)!.brightness == Brightness.light
                          ? Colors.white
                          : Colors.white.withOpacity(0.8),
                )),
            Positioned(
                top: 8,
                right: 4,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.black,
                  child: Text('1'),
                ))
          ],
        ),
        onTap: () => {},
      ),
      SizedBox(width: 5),
      CircleAvatar(
        backgroundColor: Get.theme.backgroundColor,
        // child: Text(
        //   getIniciales(prefs.name, prefs.lastName),
        //   style: TextStyle(
        //       color: textColor, fontWeight: FontWeight.bold, fontSize: 18),
        // ),
        radius: 20,
      ),
      SizedBox(width: 20),
    ],
  );
}
