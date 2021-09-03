import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:black_hole_flutter/black_hole_flutter.dart';
//import 'package:google_fonts/google_fonts.dart';

ThemeData theme() {
  return ThemeData(
    //Colores

    canvasColor: Colors.grey.shade200,
    cardColor: Colors.white,
    backgroundColor: Colors.white,
    brightness: Brightness.light,
    primaryColor: Colors.blue, //Color azul
    hintColor: Color(0xff9D9D9D), //COlor opaco

    // //accentColor: Colors.white, //Color(0xff5692FF),
    // errorColor: Color(0xffE94040),

    //AppBar
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
        //color: Colors.black,
        actionsIconTheme: IconThemeData(color: Colors.white),
        textTheme: TextTheme(
          headline6:
              TextStyle(color: Colors.white, fontSize: 20), //Letra blanca
        )),

    //Botones

    // buttonTheme: ButtonThemeData(
    //   buttonColor: kprimaryColor, // Background color (orange in my case).
    //   textTheme: ButtonTextTheme.accent,
    //   colorScheme: Theme.of(context)
    //       .colorScheme
    //       .copyWith(secondary: Colors.white), // Text color
    // ),
  );
}

// ThemeData createTheme(Brightness brightness) {
//   var theme = ThemeData(
//     brightness: brightness,
//     applyElevationOverlayColor: true,
//     primaryColor: Colors.blue,
//     primarySwatch: Colors.blue,
//     snackBarTheme: SnackBarThemeData(behavior: SnackBarBehavior.floating),
//   );
//   theme = theme.copyWith(
//     colorScheme: theme.colorScheme
//         .copyWith(onBackground: theme.colorScheme.background.contrastColor),
//     textTheme: theme.textTheme.copyWith(
//       headline6:
//           theme.textTheme.headline6!.copyWith(fontWeight: FontWeight.normal),
//     ),
//     appBarTheme: theme.appBarTheme.copyWith(backwardsCompatibility: false),
//   );

//   // We want to extend Timetable behind the navigation bar.
//   SystemChrome.setSystemUIOverlayStyle(
//     brightness.contrastSystemUiOverlayStyle
//         .copyWith(systemNavigationBarColor: Colors.transparent),
//   );
//   return theme;
// }
