import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  final String title;
  final Color color;
  final double fontSize;
  double marginLeft;

  TextTitle(
      {required this.title,
      required this.color,
      this.marginLeft = 0,
      required this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        this.title,
        //textAlign: TextAlign.left,
        style: TextStyle(color: this.color, fontSize: this.fontSize),
      ),
    );
  }
}
