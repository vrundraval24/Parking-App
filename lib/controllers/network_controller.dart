import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../views/widgets/no_internet_connection_dialog.dart';

class NetworkController extends GetxController {
  final _connection = InternetConnection();

  @override
  void onInit() {
    super.onInit();

    _connection.onStatusChange.listen((InternetStatus status) {
      switch (status) {
        case InternetStatus.connected:
          if (Get.isDialogOpen!) {
            Get.back();
          }
          break;
        case InternetStatus.disconnected:
          Get.dialog(
            const NoInternetConnectionDialog(),
            barrierColor: Colors.transparent,
            barrierDismissible: false,
          );
          break;
      }
    });
  }
}
