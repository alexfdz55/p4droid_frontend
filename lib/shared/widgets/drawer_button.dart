import 'package:flutter/material.dart';

class DrawerButton extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const DrawerButton({required this.scaffoldKey});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 4,
      left: 4,
      child: SafeArea(
        child: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
        ),
      ),
    );
  }
}
