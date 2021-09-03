import 'package:flutter/material.dart';
import 'package:p4droid_frontend/shared/responisve/responsive.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final double leftPadding;
  final double rightPadding;
  final double percentWitdh;

  const CustomContainer({
    required this.child,
    this.leftPadding = 15,
    this.rightPadding = 10,
    this.percentWitdh = 1,
  });
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return
        // GetBuilder<AgendarCitaController>(
        //   init: AgendarCitaController(),
        //   builder: (_) =>

        Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.only(
        left: this.leftPadding,
        right: this.rightPadding,
      ),
      width: responsive.width * this.percentWitdh,
      height: 50,
      // width: ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Theme.of(context).backgroundColor.withOpacity(0.3),
        //color: Colors.grey.withOpacity(0.3),
      ),
      child: this.child,
      //),
    );
  }
}
