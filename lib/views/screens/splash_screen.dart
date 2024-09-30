import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parking_app/controllers/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashScreenController = Get.find<SplashScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("Parking App"),
      ),
    );
  }
}
