import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:parking_app/controllers/auth_controller.dart';
import 'package:parking_app/utils/validators.dart';

class OtpVerificationScreen extends StatelessWidget {
  OtpVerificationScreen({super.key});

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification Screen'),
      ),
      body: Form(
        key: authController.verificationFormKey,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          child: Column(
            children: [
              TextFormField(
                controller: authController.otpController,
                maxLength: 6,
                validator: (value) =>
                    Validators.validateOtp(value!) ? null : 'Invalid OTP',
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
                  authController.verifyOTP();
                },
                child: const Text('Verify OTP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
