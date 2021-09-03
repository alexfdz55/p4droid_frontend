import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p4droid_frontend/ui/pages/home/controller/home_controller.dart';

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({required this.title});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: Center(
          child: Text(this.title),
        ),
      ),
    );
  }
}
