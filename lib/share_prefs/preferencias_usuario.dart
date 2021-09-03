import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  //String urlAvatar = 'http://media/avatar/2d88dbab.jpg';
  //String nombreApellidos = '';
  //String dir = '';

  //  bool get modoOscuro {
  //   return _prefs.getBool('modoOscuro') ?? false;
  // }

  // set modoOscuro(bool value) {
  //   _prefs.setBool('modoOscuro', value);
  // }

  String get theme {
    return _prefs.getString('theme') ?? '';
  }

  set theme(String value) {
    _prefs.setString('theme', value);
  }

/////////////////////////////////////////////////
  String get token {
    return _prefs.getString('token') ?? '';
  }

  set token(String value) {
    _prefs.setString('token', value);
  }

  String get name {
    return _prefs.getString('name') ?? '';
  }

  set name(String value) {
    _prefs.setString('name', value);
  }

  String get lastName {
    return _prefs.getString('lastName') ?? '';
  }

  set lastName(String value) {
    _prefs.setString('lastName', value);
  }

  String get cedula {
    return _prefs.getString('cedula') ?? '';
  }

  set cedula(String value) {
    _prefs.setString('cedula', value);
  }

  String get email {
    return _prefs.getString('email') ?? '';
  }

  set email(String value) {
    _prefs.setString('email', value);
  }

  String get address {
    return _prefs.getString('address') ?? '';
  }

  set address(String value) {
    _prefs.setString('address', value);
  }

  String get uid {
    return _prefs.getString('uid') ?? '';
  }

  set uid(String value) {
    _prefs.setString('uid', value);
  }

  String get urlAvatar {
    return _prefs.getString('urlAvatar') ?? '';
  }

  set urlAvatar(String value) {
    _prefs.setString('urlAvatar', value);
  }

  String get rol {
    return _prefs.getString('rol') ?? '';
  }

  set rol(String value) {
    _prefs.setString('rol', value);
  }

  String get phone {
    return _prefs.getString('phone') ?? '';
  }

  set phone(String value) {
    _prefs.setString('phone', value);
  }

  String get notification {
    return _prefs.getString('notification') ?? '';
  }

  set notification(String value) {
    _prefs.setString('notification', value);
  }

  String get firebaseToken {
    return _prefs.getString('firebaseToken') ?? '';
  }

  set firebaseToken(String value) {
    _prefs.setString('firebaseToken', value);
  }

  String get otpPin {
    return _prefs.getString('otpPin') ?? '';
  }

  set otpPin(String value) {
    _prefs.setString('otpPin', value);
  }

  String get birthDate {
    return _prefs.getString('birthDate') ?? '';
  }

  set birthDate(String value) {
    _prefs.setString('birthDate', value);
  }
}
