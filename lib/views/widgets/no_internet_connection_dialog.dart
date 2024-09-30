import 'package:flutter/material.dart';

class NoInternetConnectionDialog extends StatelessWidget {
  const NoInternetConnectionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: const Center(
          child: Text('No internet connection.'),
        ),
      ),
    );
  }
}
