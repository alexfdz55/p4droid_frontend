import 'package:flutter/material.dart';

// //Para probar-----------------------------
// const kPrimaryColor = Color(0xFF1E1E28);
// const kSecondaryColor = Color(0xFF242430);
// const scaffoldBackgroundColor = Color(0xFF191923);
// const bodyTextColor = Color(0xFF8B8B8D);
// //------------------------------------------

const kPrimaryColor = Colors.pink;
//Color(0xFF009687);
Color kSecondaryColor = Color(0xFF1E1E28);
const scaffoldBackgroundColor = Color(0xFF151F27);
//Color(0xFF011627);
const kContentColorDarkTheme = Color(0xFFF5FCF9);
const kWarninngColor = Color(0xFFF3BB1C);
const kErrorColor = Color(0xFFF03738);

const kDefaultPadding = 20.0;

ThemeData darkThemeData() {
  // Bydefault flutter provie us light and dark theme
  // we just modify it as our need
  return ThemeData.dark().copyWith(
    primaryColor: Colors.cyan.shade300,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    cardColor: kPrimaryColor,
    appBarTheme: appBarTheme,
    iconTheme: IconThemeData(color: kContentColorDarkTheme),
    textTheme:
        TextTheme(bodyText1: TextStyle(color: Colors.white.withOpacity(0.8))),

    // textTheme:
    //     Theme.of(context).textTheme.apply(bodyColor: kContentColorDarkTheme),
    // colorScheme: ColorScheme.dark().copyWith(
    //   primary: kPrimaryColor,
    //   secondary: kSecondaryColor,
    //   error: kErrorColor,
    // ),
    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //   backgroundColor: kContentColorLightTheme,
    //   selectedItemColor: Colors.white70,
    //   unselectedItemColor: kContentColorDarkTheme.withOpacity(0.32),
    //   selectedIconTheme: IconThemeData(color: kPrimaryColor),
    //   showUnselectedLabels: true,
    // ),
  );
}

final appBarTheme = AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white.withOpacity(0.9)),
    color: kSecondaryColor,
    actionsIconTheme: IconThemeData(color: Colors.white.withOpacity(0.9)),
    textTheme: TextTheme(
      headline6: TextStyle(
          color: Colors.white.withOpacity(0.9), fontSize: 20), //Letra blanca
    ));
