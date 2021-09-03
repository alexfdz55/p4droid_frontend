import 'package:animate_icons/animate_icons.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:p4droid_frontend/routes/routes.dart';
import 'package:p4droid_frontend/share_prefs/preferencias_usuario.dart';
import 'package:p4droid_frontend/shared/responisve/responsive.dart';
import 'package:p4droid_frontend/shared/theme/theme_dark.dart';
import 'package:p4droid_frontend/shared/theme/theme_service.dart';
import 'package:p4droid_frontend/shared/widgets/text_title.dart';
import 'package:p4droid_frontend/utils/colors_text_and_size.dart';

//late Responsive responsive;

double sizeIcon(context) {
  final responsive = Responsive(context);
  return responsive.optionDevice(
      mobileOption: responsive.dp(2.2),
      tabletOption: 16.0,
      desktopOption: 16.0);
}

double sizeText(context) {
  final responsive = Responsive(context);
  return Responsive(context).optionDevice(
      mobileOption: responsive.dp(1.5),
      tabletOption: 16.0,
      desktopOption: 16.0);
}

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: _DrawerWidget()),
    );
  }
}

class _DrawerWidget extends StatelessWidget {
  final prefs = new PreferenciasUsuario();

  late IconData icon;
  late IconData icon2;

  IconData iconDark = FontAwesomeIcons.solidMoon;
  IconData iconLight = FontAwesomeIcons.solidSun;
  AnimateIconController c1 = AnimateIconController();

  @override
  Widget build(BuildContext context) {
    icon = ThemeProvider.of(context)!.brightness == Brightness.light
        ? FontAwesomeIcons.solidMoon
        : FontAwesomeIcons.solidSun;
    icon2 = ThemeProvider.of(context)!.brightness != Brightness.light
        ? FontAwesomeIcons.solidSun
        : FontAwesomeIcons.solidMoon;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            color: isDark ? kSecondaryColor : Get.theme.primaryColor,
            padding: EdgeInsets.all(10.0),
            width: double.infinity,
            height: 170,
            child: SafeArea(
              child: Stack(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          children: [
                            Container(
                              color: Colors.green,
                              height: 60,
                              width: 60,
                              child: Icon(
                                FontAwesomeIcons.calendarAlt,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                            SizedBox(height: 5),
                            SizedBox(height: 5),
                            Text(
                              'P4Droid',
                              style: TextStyle(
                                  color: textColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'v 0.0.1',
                              style: TextStyle(
                                  color: textColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            prefs.name,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(prefs.email,
                              style: TextStyle(color: textColor, fontSize: 13)),
                        ],
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: ThemeSwitcher(
                      builder: (context) {
                        return AnimateIcons(
                          duration: Duration(milliseconds: 500),
                          startIconColor: textColor,
                          endIconColor: textColor,
                          startIcon: icon,
                          endIcon: icon2,
                          controller: c1,
                          size: 25.0,
                          onEndIconPress: () {
                            changeTheme(context);
                            return true;
                          },
                          onStartIconPress: () {
                            changeTheme(context);
                            return true;
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            )),
        Padding(
          padding: EdgeInsets.only(
            left: 25,
            top: 20,
          ),
          child: TextTitle(
              title: 'Adminstración docente',
              color: textColor.withOpacity(0.7),
              fontSize: 18),
        ),
        Expanded(
          flex: 7,
          child:
              // _ListaOpcionesSistema(),
              _ListaOpciones(),
        ),
        SizedBox(height: 10),
        Divider(color: Theme.of(context).primaryColor, thickness: 0.7),
        Padding(
          padding: EdgeInsets.only(
            left: 25,
            top: 10,
          ),
          child: TextTitle(
              title: 'Sistema',
              color: textColor.withOpacity(0.7),
              fontSize: 18),
        ),
        Expanded(
          flex: 2,
          child: ListaOpcionesSistema(),
        ),
        // Container(
        //   height: 200,
        //   child: Padding(
        //       padding: EdgeInsets.only(
        //         left: 25,
        //         top: 20,
        //       ),
        //       child: Column(
        //         children: [
        //           TextTitle(
        //               title: 'Sistema',
        //               color: textColor.withOpacity(0.7),
        //               fontSize: 18),
        //           _ListaOpcionesSistema(),
        //         ],
        //       )),
        // ),
      ],
    );
  }

  changeTheme(BuildContext context) async {
    var themeName = ThemeProvider.of(context)!.brightness == Brightness.light
        ? 'dark'
        : 'light';
    var service = await ThemeService.instance
      ..save(themeName);
    var theme = service.getByName(themeName);
    // ThemeSwitcher.of(context)!
    //     .changeTheme(theme: theme);

    var brightness = ThemeProvider.of(context)!.brightness;
    ThemeSwitcher.of(context)!.changeTheme(
      theme: theme,
      reverseAnimation: brightness == Brightness.dark ? true : false,
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    print('iconSIze: $sizeIcon');
    final pageRoutes = generateRoutes();

    return ListView.separated(
      padding: EdgeInsets.all(10),
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) => (i == 9)
          ? Divider(color: Theme.of(context).primaryColor, thickness: 0.5)
          : Container(),
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile(
        //hoverColor: Colors.red,
        horizontalTitleGap: 0.0,
        minLeadingWidth: 50.0,
        visualDensity: VisualDensity.compact,
        leading: FaIcon(
          pageRoutes[i].icon,
          size: sizeIcon(context),
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          pageRoutes[i].titulo,
          style: TextStyle(color: textColor, fontSize: sizeText(context)),
        ),
        onTap: () {
          if (i == 10) {
            Get.off(pageRoutes[i].page);
          } else {
            print('navegacion por menu');
            Get.back();
            Get.to(pageRoutes[i].page);
          }
        },
      ),
    );
  }
}

class ListaOpcionesSistema extends StatelessWidget {
  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    print('iconSIze: $sizeIcon');
    final pageRoutesSistema = generateRoutesSistema();

    return ListView.separated(
      padding: EdgeInsets.all(10),
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) => (i == 9)
          ? Divider(color: Theme.of(context).primaryColor, thickness: 0.5)
          : Container(),
      itemCount: pageRoutesSistema.length,
      itemBuilder: (context, i) => ListTile(
        //hoverColor: Colors.red,
        horizontalTitleGap: 0.0,
        minLeadingWidth: 50.0,
        visualDensity: VisualDensity.compact,
        leading: FaIcon(
          pageRoutesSistema[i].icon,
          size: sizeIcon(context),
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          pageRoutesSistema[i].titulo,
          style: TextStyle(color: textColor, fontSize: sizeText(context)),
        ),
        onTap: () {
          if (i == 10) {
            Get.off(pageRoutesSistema[i].page);
          } else {
            print('navegacion por menu');
            Get.back();
            Get.to(pageRoutesSistema[i].page);
          }
        },
      ),
    );
  }
}
