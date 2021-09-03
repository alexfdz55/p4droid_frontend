import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:p4droid_frontend/ui/pages/calendar/screen/calendar_page.dart';
import 'package:p4droid_frontend/utils/colors_text_and_size.dart';
import 'package:timetable/timetable.dart';

import 'share_prefs/preferencias_usuario.dart';
import 'shared/theme/theme_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  ;
  final themeServise = await ThemeService.instance;
  var initTheme = themeServise.initial;

  runApp(MyApp(theme: initTheme));
}

class MyApp extends StatelessWidget {
  MyApp({required this.theme});
  final ThemeData theme;
  @override
  Widget build(BuildContext context) {
    // final isPlatformDark =
    //     WidgetsBinding.instance!.window.platformBrightness == Brightness.dark;
    // final initTheme = isPlatformDark ? darkTheme : lightTheme;
    return ThemeProvider(
        initTheme: theme,
        builder: (_, theme) {
          textColor = theme!.textTheme.bodyText1!.color!;
          isDark = theme.brightness == Brightness.dark;
          isLight = theme.brightness == Brightness.light;
          return GetMaterialApp(
            localizationsDelegates: [
              // ... delegado[s] de localización específicos de la app aquí
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              TimetableLocalizationsDelegate(),
            ],
            supportedLocales: [
              const Locale('en'), // Inglés
              const Locale('es', 'US'), // Español
            ],
            debugShowCheckedModeBanner: false,
            theme: theme,

            title: 'Centro de Ultrasonido',
            initialRoute: 'home',
            //home://SplashPage(),
            routes: {"home": (_) => CalendarPage()},
          );
        });
  }
}
