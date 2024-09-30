import 'package:get/get.dart';
import 'package:parking_app/controllers/auth_controller.dart';
import 'package:parking_app/controllers/network_controller.dart';
import 'package:parking_app/controllers/student_data_controller.dart';
import 'package:parking_app/controllers/splash_screen_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkController(), permanent: true);

    Get.put(AuthController(), permanent: true);

    Get.put(SplashScreenController());

    Get.put(StudentDataController());

    // Get.lazyPut(
    //   () => StudentDataController(),
    // );
  }
}
