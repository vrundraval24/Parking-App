import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:parking_app/controllers/auth_controller.dart';
import 'package:parking_app/utils/validators.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Form(
        key: authController.loginFormKey,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          child: Column(
            children: [
              TextFormField(
                controller: authController.phoneNumberController,
                maxLength: 10,
                validator: (value) => Validators.validatePhoneNumber(value!)
                    ? null
                    : 'Invalid phone number',
                autocorrect: false,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
                  FilteringTextInputFormatter.deny(RegExp(r'-')),
                  FilteringTextInputFormatter.deny(RegExp(r'\.')),
                  FilteringTextInputFormatter.deny(RegExp(r',')),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  authController.sendOTP();
                },
                child: const Text('Send OTP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
