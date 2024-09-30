import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parking_app/routes/app_routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome Screen',
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed(AppRoutes.loginScreen);
          },
          child: const Text(
            'Login with Phone Number',
          ),
        ),
      ),
    );
  }
}
