import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:parking_app/routes/app_routes.dart';
import 'package:parking_app/views/screens/home_screen.dart';
import 'package:parking_app/views/screens/login_screen.dart';
import 'package:parking_app/views/screens/otp_verification_screen.dart';
import 'package:parking_app/views/screens/splash_screen.dart';
import 'package:parking_app/views/screens/student_data_screen.dart';
import 'package:parking_app/views/screens/welcome_screen.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: AppRoutes.loginScreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.otpVerificationScreen,
      page: () => OtpVerificationScreen(),
    ),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: AppRoutes.studentDataScreen,
      page: () => StudentDataScreen(),
    ),
  ];
}
