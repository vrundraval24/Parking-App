import 'dart:convert';
import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parking_app/core/constants.dart';
import 'package:parking_app/models/error_model.dart';
import 'package:parking_app/models/student_model.dart';
import 'package:parking_app/services/appwrite_service.dart';

class StudentDataController extends GetxController {
  final mainFieldController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final functions = Functions(AppwriteService.getClient());

  late StudentModel studentModel;
  late ErrorModel errorModel;

  RxBool fetchComplete = false.obs;
  RxBool studentDataLoaded = false.obs;
  RxBool errorLoaded = false.obs;

  Future<void> fetchStudentData() async {
    try {
      fetchComplete.value = false;

      var sendPlateNumber = {
        "plateNumber": mainFieldController.text.toUpperCase(),
      };

      var body = json.encode(sendPlateNumber);

      var res = await functions.createExecution(
        functionId: Constants.fetchStudentDataFunctionId,
        body: body.toString(),
      );

      log(res.responseBody.toString());

      Map<String, dynamic> studentData =
          jsonDecode(res.responseBody.toString());

      try {
        studentModel = StudentModel.fromJson(studentData);
        studentDataLoaded.value = true;
      } catch (e) {
        log("Received data is not student information. It is Error Message. Hence we jumped to catch block to handle error.");
        log("Catch block error: ", error: e);

        errorModel = ErrorModel.fromJson(studentData);
        errorLoaded.value = true;
      }
    } on AppwriteException catch (exception) {
      log("Exception: ", error: exception);
    } catch (e) {
      log("Error:", error: e);
    } finally {
      fetchComplete.value = true;
    }
  }
}
