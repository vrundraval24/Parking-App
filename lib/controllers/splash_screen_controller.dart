import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:parking_app/routes/app_routes.dart';
import 'package:parking_app/services/appwrite_service.dart';

class SplashScreenController extends GetxController {
  final box = GetStorage();

  final account = Account(AppwriteService.getClient());

  @override
  void onReady() {
    super.onReady();

    checkUserLoginStatusWithGetStorage();
  }

  Future<void> checkUserLoginStatusWithGetStorage() async {
    try {
      // if (box.read('userLoginStatus') == 'true') {
      //   Get.offAllNamed(AppRoutes.homeScreen);
      // } else {
      //   Get.offAllNamed(AppRoutes.welcomeScreen);
      // }

      final boxSessionId = await box.read('sessionId');

      log("SessionId: $boxSessionId");

      if (boxSessionId == null) {
        Get.offAllNamed(AppRoutes.welcomeScreen);
      } else {
        Get.offAllNamed(AppRoutes.homeScreen);
      }
    } catch (e) {
      Get.offAllNamed(AppRoutes.welcomeScreen);
      log(e.toString());
    }
  }

  Future<void> checkUserLoginStatusWithAppwrite() async {
    try {
      User user = await account.get();

      log(user.name);

      Get.offAllNamed(AppRoutes.homeScreen);
    } catch (e) {
      Get.offAllNamed(AppRoutes.welcomeScreen);
      log(e.toString());
    }
  }
}
