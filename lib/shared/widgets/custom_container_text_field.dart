import 'package:flutter/material.dart';
import 'package:p4droid_frontend/shared/responisve/responsive.dart';
import 'package:p4droid_frontend/utils/colors_text_and_size.dart';

class CustomContainerTextField extends StatelessWidget {
  final Widget child;
  //final Color color;

  const CustomContainerTextField({required this.child});
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return
        // GetBuilder<AgendarCitaController>(
        //   init: AgendarCitaController(),
        //   builder: (_) =>
        Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.only(left: 15, right: 10),
      width: responsive.width,
      height: 50,
      // width: ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        //color: Colors.white.withAlpha(180),
        color: isDark
            ? Colors.grey.withOpacity(0.3)
            : Theme.of(context).backgroundColor.withAlpha(180),
      ),
      child: this.child,
      // ),
    );
  }
}
