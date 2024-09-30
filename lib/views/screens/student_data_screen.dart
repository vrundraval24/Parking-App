import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parking_app/controllers/student_data_controller.dart';

class StudentDataScreen extends StatelessWidget {
  StudentDataScreen({super.key});

  final studentDataController = Get.find<StudentDataController>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        studentDataController.fetchComplete.value = false;
        studentDataController.studentDataLoaded.value = false;
        studentDataController.errorLoaded.value = false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Student Information'),
        ),
        body: Obx(
          () => Container(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            child: (!studentDataController.fetchComplete.value)
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      (studentDataController.studentDataLoaded.value)
                          ? Column(
                              children: [
                                Text(studentDataController.studentModel.name),
                                Text(studentDataController
                                    .studentModel.enrolmentNumber),
                                Text(studentDataController
                                    .studentModel.phoneNumber)
                              ],
                            )
                          : const SizedBox(),
                      (studentDataController.errorLoaded.value)
                          ? Text(studentDataController.errorModel.errorMessage)
                          : const SizedBox(),
                      (!studentDataController.errorLoaded.value &&
                              !studentDataController.studentDataLoaded.value)
                          ? const Text(
                              'Something went wrong. Please check your internet connection and try again.',
                            )
                          : const SizedBox(),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
