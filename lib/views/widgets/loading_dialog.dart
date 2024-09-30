import 'package:flutter/material.dart';

Widget loadingDialog(String text) {
  return PopScope(
    canPop: false,
    child: Dialog(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: CircularProgressIndicator(),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(text),
          ],
        ),
      ),
    ),
  );
}
