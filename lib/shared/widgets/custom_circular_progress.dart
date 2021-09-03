import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCircularProgress extends StatelessWidget {
  final Color? color;
  final double h;
  final double w;

  CustomCircularProgress({this.h = 100, this.w = 100, this.color});

  final contex = Get.context!;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: this.w,
        height: this.h,
        child: CircularProgressIndicator(
          color: this.color == null ? Get.theme.primaryColor : this.color,
          //color: this.color,
          strokeWidth: 6,
          // color: Colors.black,
        ),
      ),
    );
  }
}
