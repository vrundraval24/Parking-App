import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:parking_app/controllers/auth_controller.dart';
import 'package:parking_app/controllers/student_data_controller.dart';
import 'package:parking_app/routes/app_routes.dart';
import 'package:parking_app/utils/validators.dart';
import 'package:parking_app/views/widgets/loading_dialog.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final studentDataController = Get.find<StudentDataController>();
  final authController = Get.find<AuthController>();

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Parking App"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
            child: TextButton(
              onPressed: () async {
                try {
                  Get.dialog(
                    loadingDialog('Logging out, please wait...'),
                    barrierDismissible: false,
                  );

                  final boxSessionId = await box.read('sessionId');
                  await authController.account
                      .deleteSession(sessionId: boxSessionId);

                  box.remove('sessionId');

                  Get.offAllNamed(AppRoutes.welcomeScreen);
                } catch (e) {
                  Get.snackbar(
                    "Couldn't log out. Something went wrong.",
                    'Please check your internet connection and try again.',
                  );

                  log("Logout Error: ", error: e);
                } finally {
                  if (Get.isDialogOpen!) {
                    Get.back();
                  }
                }
              },
              child: const Text(
                "LOG OUT",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Form(
          key: studentDataController.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: studentDataController.mainFieldController,
                maxLength: 6,
                textCapitalization: TextCapitalization.characters,
                validator: (value) => Validators.validateMainField(value!)
                    ? null
                    : 'Invalid input',
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r'[a-z]')),
                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
                  FilteringTextInputFormatter.deny(RegExp(r'-')),
                  FilteringTextInputFormatter.deny(RegExp(r'_')),
                  FilteringTextInputFormatter.deny(RegExp(r'\.')),
                  FilteringTextInputFormatter.deny(RegExp(r',')),
                ],
              ),
              ElevatedButton(
                onPressed: () async {
                  if (studentDataController.formKey.currentState!.validate()) {
                    Get.toNamed(AppRoutes.studentDataScreen);
                    await studentDataController.fetchStudentData();
                    studentDataController.mainFieldController.text = "";
                  }
                },
                child: const Text('SEARCH'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
