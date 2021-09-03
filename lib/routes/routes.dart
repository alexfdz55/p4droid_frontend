import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:p4droid_frontend/ui/pages/home/screen/home_page.dart';

//Pages

final icons = <IconData>[
  FontAwesomeIcons.users,
  FontAwesomeIcons.qrcode,
  FontAwesomeIcons.solidFolder,
  FontAwesomeIcons.infoCircle,
  FontAwesomeIcons.book,
  FontAwesomeIcons.layerGroup,
  FontAwesomeIcons.solidCalendarCheck,
  FontAwesomeIcons.search,
  FontAwesomeIcons.trash,
  FontAwesomeIcons.shareAlt,
];

final namePages = [
  'Gestionar Grupos',
  'Capturar QR',
  'Cargar Archivo',
  'Información de P4',
  'Asignaturas',
  'Actualizar Asignaturas',
  'Vista por meses',
  'Buscar en los eventos',
  'Eliminar datos',
  'Compartir Datos'
];

List<Route> generateRoutes() {
  List<Route> routes = [];
  for (var i = 0; i < icons.length; i++) {
    routes.add(Route(icons[i], namePages[i], HomePage(title: namePages[i])));
  }
  return routes;
}

final iconsSistema = <IconData>[
  FontAwesomeIcons.slidersH,
  FontAwesomeIcons.infoCircle,
  FontAwesomeIcons.hireAHelper,
  FontAwesomeIcons.powerOff,
];

final namePagesSistema = ['Configuración', 'Acerca de...', 'Ayuda', 'Salir'];

List<Route> generateRoutesSistema() {
  List<Route> routes = [];
  for (var i = 0; i < iconsSistema.length; i++) {
    routes.add(Route(iconsSistema[i], namePagesSistema[i],
        HomePage(title: namePagesSistema[i])));
  }
  return routes;
}

// final pageRoutes = <Route>[
//   Route(FontAwesomeIcons.users, 'Gestionar Grupos', HomePage()),
//   Route(FontAwesomeIcons.qrcode, 'Capturar QR', HomePage()),
//   Route(FontAwesomeIcons.solidFolder, 'Cargar Archivo', HomePage()),
//   Route(FontAwesomeIcons.infoCircle, 'Información de P4', HomePage()),
//   Route(FontAwesomeIcons.book, 'Asignaturas', HomePage()),
//   Route(FontAwesomeIcons.layerGroup, 'Actualizar Asignaturas', HomePage()),
//   Route(FontAwesomeIcons.solidCalendarCheck, 'Vista por meses', HomePage()),
//   Route(FontAwesomeIcons.search, 'Buscar en los eventos', HomePage()),
//   Route(FontAwesomeIcons.trash, 'Eliminar datos', HomePage()),
//   Route(FontAwesomeIcons.shareAlt, 'Compartir Datos', HomePage()),
// ];

// final pageRoutesSistema = <Route>[
//   Route(FontAwesomeIcons.slidersH, 'Configuración', HomePage()),
//   Route(FontAwesomeIcons.infoCircle, 'Acerca de', HomePage()),
//   Route(FontAwesomeIcons.hireAHelper, 'Ayuda', HomePage()),
//   Route(FontAwesomeIcons.powerOff, 'Salir', HomePage()),
// ];

class Route {
  final IconData icon;
  final String titulo;
  final Widget page;

  Route(this.icon, this.titulo, this.page);
}
