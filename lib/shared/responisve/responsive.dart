import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Responsive {
  late double height, width, diagonal;
  static Responsive of(BuildContext context) => Responsive(context);

  Responsive(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    this.height = size.height;
    this.width = size.width;
    this.diagonal = sqrt(pow(this.height, 2) + pow(this.width, 2));
  }

  double wp(double percent) => this.width * percent / 100;
  double hp(double percent) => this.height * percent / 100;
  double dp(double percent) => this.diagonal * percent / 100;

  double wDisponible(double percent, double ancho) =>
      (this.width - ancho) * percent / 100;

  double hpDisponible({required double percent, bool bottomBar = true}) {
    double h;
    if (bottomBar) {
      h = 160;
    } else {
      h = 110;
    }
    return (this.height - h) * percent / 100;
  }

  optionDevice({
    required mobileOption,
    required tabletOption,
    required desktopOption,
  }) {
    final w = this.width;
    // If our width is more than 1100 then we consider it a desktop
    if (w >= 1100) {
      return desktopOption;
    }
    // If width it less then 1100 and more then 850 we consider it as tablet
    else if (w >= 500 && w < 1100) {
      return tabletOption;
    }
    // Or less then that we called it mobile
    else {
      return mobileOption;
    }
  }

  optionPlatform({
    required androidOption,
    required webOption,
  }) {
    if (GetPlatform.isWeb) {
      print('Es web');
      return webOption;
    } else {
      print('Es android');
      return androidOption;
    }
  }

  // double dp(double percent) => this.diagonal * percent / 100;
}
