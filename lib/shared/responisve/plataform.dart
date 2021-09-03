import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class PlataformWidget extends StatelessWidget {
  final Widget android;
  final Widget web;

  PlataformWidget({
    required this.android,
    required this.web,
  });

  // static bool isAndroid(BuildContext context) => Platform.isAndroid;

  // static bool isWeb(BuildContext context) => kIsWeb;

  @override
  Widget build(BuildContext context) {
    // If width it less then 1100 and more then 850 we consider it as web
    if (kIsWeb) {
      return web;
    } else {
      return android;
    }
  }
}
