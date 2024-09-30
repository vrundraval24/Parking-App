import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:parking_app/routes/app_routes.dart';
import 'package:parking_app/services/appwrite_service.dart';

class AuthController extends GetxController {
  final phoneNumberController = TextEditingController();
  final otpController = TextEditingController();

  final loginFormKey = GlobalKey<FormState>();
  final verificationFormKey = GlobalKey<FormState>();

  final account = AppwriteService.getAccount();

  final box = GetStorage();

  late String userId;

  Future<void> sendOTP() async {
    if (loginFormKey.currentState!.validate()) {
      try {
        final String phoneNumber = '+91${phoneNumberController.text}';

        final token = await account.createPhoneToken(
          userId: ID.unique(),
          phone: phoneNumber,
        );

        userId = token.userId;

        // OTP sent successfully
        // So now navigate to the OTP verification screen
        Get.toNamed(AppRoutes.otpVerificationScreen);
      } catch (e) {
        Get.snackbar(
          'Something went wrong',
          'Please check your internet connection and try again.',
        );

        log(e.toString());
      }
    }
  }

  Future<void> verifyOTP() async {
    if (verificationFormKey.currentState!.validate()) {
      try {
        final session = await account.createSession(
          userId: userId,
          secret: otpController.text,
        );

        log("Client name: ${session.clientName}");
        log("Session id: ${session.$id}");

        // OTP verification is successful
        // So now update the USER LOGIN STATUS in Get Storage to TRUE

        // box.write('userLoginStatus', 'true');
        box.write('sessionId', session.$id);

        // And navigate to the Home Screen
        Get.offAllNamed(AppRoutes.homeScreen);
      } on AppwriteException catch (exception) {
        if (exception.type == 'user_invalid_token') {
          Get.snackbar(
            'Invalid OTP',
            'Please provide valid OTP to complete your verification.',
          );
        } else {
          Get.snackbar(
            'Something went wrong',
            'Please check your internet connection and try again.',
          );
        }

        log(exception.toString());
      } catch (e) {
        Get.snackbar(
          'Something went wrong',
          'Please check your internet connection and try again.',
        );

        log(e.toString());
      }
    }
  }
}
